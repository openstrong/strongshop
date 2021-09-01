<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\Repositories\AppRepository;
use App\Models\Product\ShoppingCart;
use App\Models\User;

class UpdateShoppingCart
{

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  Login  $event
     * @return void
     */
    public function handle($event)
    {
        $user = $event->user;
        if (!($event->user instanceof User))
        {
            return false;
        }
        $uuid = app('strongshop')->getUuid();
        $user_id = $user->id ?? 0;
        if (!$uuid || !$user_id)
        {
            return false;
        }
        ShoppingCart::query()
                ->where('uuid', $uuid)
                ->chunk(100, function($rows)use($user_id, $uuid) {
                    foreach ($rows as $row)
                    {
                        $shoppingcart = ShoppingCart::where('user_id', $user_id)->where('product_id', $row->product_id)->first();
                        if ($shoppingcart && $shoppingcart->uuid === $row->uuid)
                        {
                            continue;
                        }
                        if ($shoppingcart)
                        {
                            $shoppingcart->delete();
                        }
                        $row->user_id = $user_id;
                        $row->save();
                    }
                });
    }

}
