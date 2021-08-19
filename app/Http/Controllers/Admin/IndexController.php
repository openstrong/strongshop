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

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Models\Admin\AdminMenu;
use App\Models\Admin\AdminRole;
use App\Models\Order\Order;
use App\Models\UserFeedback;
use App\Models\Product\Product;

class IndexController extends BaseController
{

    /**
     * 后台home主页
     * @return type
     */
    public function home()
    {
        $default_url = 'admin/index/panel'; //默认加载页面

        $roleModel = AdminRole::find(auth('admin')->user()->roles->pluck('id'));
        if (!$roleModel)
        {
            return $this->view('index.home', ['rows' => []]);
        }
        $permissionsMenuId = [];
        foreach ($roleModel as $perm)
        {
            $permissionsMenuId = array_merge_recursive($permissionsMenuId, $perm['permissions']['menu_id'] ?? []);
        }
        $rows = AdminMenu::query()
                ->orderByDesc('sort')
                ->where('status', 1)->where('level', 1)
                ->with(['children' => function($query) {
                        $query->where('status', 1);
                    }])
                ->get();

        //如果不是超级管理员
        if (auth('admin')->user()->id !== 1)
        {
            //过滤无权限菜单
            $datas = $rows->filter(function($item)use($permissionsMenuId) {
                        $children = $item->children->filter(function($it)use($permissionsMenuId, $item) {
                            return in_array($it->id, $permissionsMenuId);
                        });
                        unset($item->children);
                        $item->children = $children;
                        return $children->count() > 0;
                    })->values();
        } else
        {
            $datas = $rows;
        }
        $default_url = $datas[0]['children'][0]['route_url'] ?? $default_url;
        return $this->view('index.home', ['rows' => $datas, 'default_url' => $default_url]);
    }

    /**
     * 面板
     * @return type
     */
    public function panel()
    {
        $order_count_paid = Order::where('order_status', Order::STATUS_PAID)->count(); //待发货
        $order_count_unpaid = Order::where('order_status', Order::STATUS_UNPAID)->count(); //待付款
        $order_count_today = Order::whereBetween('created_at', [now()->yesterday()->startOfDay(), now()->endOfDay()])->count(); //今日订单
        $userfeedback_noreply_count = UserFeedback::where('parent_id', 0)->where('status', 1)->count(); //待回复反馈
        $product_stock_warning = Product::where('stock', '<=', 5)->count(); //产品库存警告
        return $this->view('index.panel', [
                    'order_count_paid' => $order_count_paid,
                    'order_count_unpaid' => $order_count_unpaid,
                    'order_count_today' => $order_count_today,
                    'userfeedback_noreply_count' => $userfeedback_noreply_count,
                    'product_stock_warning' => $product_stock_warning,
        ]);
    }

}
