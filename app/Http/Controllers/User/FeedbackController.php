<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use App\Models\UserFeedback;

class FeedbackController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $model = UserFeedback::orderBy('id', 'DESC');
        $model->where('parent_id', 0)->where('user_id', $this->user->id);
        if ($request->title)
        {
            $model->where('title', 'like', "%{$request->title}%");
        }
        if ($request->status)
        {
            $model->where('status', $request->status);
        }
        if ($request->created_at_begin && $request->created_at_end)
        {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
        }
        $model->select('id', 'type', 'title', 'content', 'status', 'created_at', 'updated_at');
        $model->withCount(['unreadReplies' => function($query) {
                $query->where('admin_id', '>', 0);
            }]);
        $rows = $model->paginate();
        //$rows->makeHidden(['deleted_at']);
        return view('user.feedback.index', ['rows' => $rows]);
        //return ['code' => 200, 'message' => __('common.Success'), 'data' => $rows];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\UserFeedback  $userFeedback
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', 'integer', Rule::exists('user_feedback')->where('user_id', $this->user->id)],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = UserFeedback::find($request->id);
        if ($model)
        {
            return ['code' => 200, 'message' => __('common.Success'), 'data' => $model];
        } else
        {
            return ['code' => 5001, 'message' => __('common.Server internal error')];
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, UserFeedback $userFeedback)
    {
        if (!$request->expectsJson())
        {
            return view('user.feedback.create', ['model' => $userFeedback]);
        }
        $rules = [
            'parent_id' => ['nullable', 'integer'],
            'type' => ['required', 'integer', 'in:1,2,3'],
            'title' => ['nullable', 'string', 'min:1', 'max:100'],
            'content' => ['required', 'string', 'min:2', 'max:65535'],
        ];
        $messages = [];
        $customAttributes = [];
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $userFeedback->fill($request->all());
        $userFeedback->parent_id = (int) $request->parent_id;
        $userFeedback->user_id = $this->user->id;
        $userFeedback->status = $request->parent_id ? 0 : 1;

        $feedback = UserFeedback::where('user_id', $this->user->id)->find($request->parent_id);
        if ($feedback)
        {
            $feedback->status = 1;
            $feedback->save();
        }
        if ($userFeedback->save())
        {
            return ['code' => 200, 'message' => __('Success')];
        } else
        {
            return ['code' => 5001, 'message' => __('Server internal error')];
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserFeedback  $userFeedback
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, UserFeedback $userFeedback)
    {
        $rules = array_merge_recursive($userFeedback->rules(), [
            'id' => ['required', 'integer', Rule::exists('user_feedback')->where('user_id', $this->user->id)],
        ]);
        $messages = $userFeedback->messages();
        $customAttributes = $userFeedback->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $userFeedback::find($request->id);
        $model->fill($request->all());
        if ($model->save())
        {
            return ['code' => 200, 'message' => __('common.Success')];
        } else
        {
            return ['code' => 5001, 'message' => __('common.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\UserFeedback  $userFeedback
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', 'array'],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = UserFeedback::where('user_id', $this->user->id)->whereIn('id', is_array($request->id) ? $request->id : [$request->id]);
        if ($model->delete())
        {
            return ['code' => 200, 'message' => __('Success')];
        } else
        {
            return ['code' => 5001, 'message' => __('Server internal error')];
        }
    }

    public function replies(Request $request)
    {
        $validator = Validator::make($request->all(), [
                    'parent_id' => ['required', 'integer', Rule::exists('user_feedback', 'id')->where('user_id', $this->user->id)],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = UserFeedback::orderBy('id', 'ASC');
        $model->where('parent_id', $request->parent_id);
        $model->select('id', 'user_id', 'type', 'title', 'content', 'created_at', 'updated_at', 'admin_id');
        $model->with('adminUser:id,name');
        $rows = $model->paginate(100);
        //标记为已读
        UserFeedback::where('parent_id', $request->parent_id)->update(['read_at' => now()]);
        //$rows->makeHidden(['deleted_at']);

        $feedback = UserFeedback::where('user_id', $this->user->id)->with('adminUser:id,name')->find($request->parent_id);
        $feedback->read_at = now(); //标记为已读
        $feedback->save();
        return view('user.feedback.replies', ['rows' => $rows, 'feedback' => $feedback]);
        //return ['code' => 200, 'message' => __('common.Success'), 'data' => $rows];
    }

}
