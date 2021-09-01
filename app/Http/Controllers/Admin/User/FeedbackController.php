<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Admin\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Admin\BaseController;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use App\Models\UserFeedback;
use Illuminate\Support\Facades\Mail;
use App\Models\User;

class FeedbackController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserFeedback  $userFeedback
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, UserFeedback $userFeedback)
    {
        if (!$request->expectsJson())
        {
            return $this->view('user.feedback.index', ['model' => $userFeedback]);
        }
        $model = UserFeedback::orderBy(($request->field ?: 'status'), ($request->order ?: 'asc'));
        $model->orderByDesc('updated_at');
        $model->where('parent_id', 0);
        $model->with('user:id,first_name,last_name,email');
        $model->with('adminUser:id,name');
        if ($request->id)
        {
            $model->where('id', $request->id);
        }
        if ($request->type)
        {
            $model->where('type', $request->type);
        }
        if ($request->user_id)
        {
            $model->where('user_id', $request->user_id);
        }
        if ($request->title)
        {
            $model->where('title', 'like', "%{$request->title}%");
        }
        if ($request->content)
        {
            $model->where('content', 'like', "%{$request->content}%");
        }
        if ($request->content_reply)
        {
            $model->where('content_reply', 'like', "%{$request->content_reply}%");
        }
        if ($request->admin_id)
        {
            $model->where('admin_id', $request->admin_id);
        }
        if ($request->more)
        {
            $model->where('more', 'like', "%{$request->more}%");
        }
        if ($request->status)
        {
            $model->where('status', $request->status);
        }
        if ($request->created_at_begin && $request->created_at_end)
        {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
        }
        if ((isset($request->page) && $request->page <= 0) || $request->export)
        {
            $rows = $model->get();
        } else
        {
            $rows = $model->paginate($request->limit);
        }
        //$rows->makeHidden(['deleted_at']);
        return ['code' => 200, 'message' => __('admin.Success'), 'data' => $rows];
    }

    /**
     * Display the specified resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', 'integer', Rule::exists('user_feedback')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = UserFeedback::find($request->id);
        if ($model)
        {
            return ['code' => 200, 'message' => __('admin.Success'), 'data' => $model];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Store a newly created resource in storage.
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserFeedback  $userFeedback
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, UserFeedback $userFeedback)
    {
        if (!$request->expectsJson())
        {
            return $this->view('user.feedback.form', ['model' => $userFeedback]);
        }
        $rules = array_merge_recursive($userFeedback->rules(), [
        ]);
        $messages = $userFeedback->messages();
        $customAttributes = $userFeedback->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $userFeedback->fill($request->all());
        if ($userFeedback->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessCreated'),
                'data' => $userFeedback,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $userFeedback->tableComments, $userFeedback->id)
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * 回复反馈
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserFeedback  $userFeedback
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, UserFeedback $userFeedback)
    {
        if (!$request->expectsJson())
        {
            $model = UserFeedback::orderBy('id', 'ASC');
            $model->where('parent_id', $request->id);
            $rows = $model->paginate(100);
            $model = $userFeedback::find($request->id);
            return $this->view('user.feedback.form', ['model' => $model, 'rows' => $rows]);
        }
        $rules = [
            'id' => ['required', 'integer', Rule::exists('user_feedback')],
            'content' => ['required', 'string', 'min:2', 'max:2000'],
        ];
        $messages = $userFeedback->messages();
        $customAttributes = $userFeedback->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $userFeedback::find($request->id);
        $model->status = 2;
        $model->read_at = null;

        $reply = new UserFeedback();
        $reply->parent_id = $request->id;
        $reply->content = $request->content;
        $reply->admin_id = $this->user->id;
        $reply->save();

        if ($model->save())
        {
            if ($request->emailNotify)
            {
                $newFeedbackModel = UserFeedback::orderByDesc('id')->where('user_id', $model->user_id)->first();
                //发送邮件通知
                $user = User::find($model->user_id);
                Mail::to($user)->send(new \App\Mail\FeedbackReply($user, $reply, $newFeedbackModel));
            }

            return [
                'code' => 200,
                'message' => __('admin.SuccessUpdated'),
                'data' => $model,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $userFeedback->tableComments, $model->id)
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserFeedback  $userFeedback
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, UserFeedback $userFeedback)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $userFeedback::whereIn('id', $ids);
        if ($model->delete())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $userFeedback->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

}
