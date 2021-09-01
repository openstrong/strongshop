<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Repositories\Traits;

use App\Repositories\AppRepository;

/**
 * Description of AuthTrait
 * @property bool $isApi 是否是`api`路由组
 * @property bool $isWeb 是否是`web`路由组
 * @property User $user 登录用户对象
 * @property string $uuid uuid
 * @property User $guard 获取登录守护名称
 * @author Administrator
 */
trait AppTrait
{

    /**
     * 是否是`api`路由组
     * @return bool
     */
    protected function getIsApi(): bool
    {
        return AppRepository::isApi();
    }

    /**
     * 是否是`web`路由组
     * @return bool
     */
    protected function getIsWeb(): bool
    {
        return AppRepository::isWeb();
    }

    /**
     * 获取登录用户信息
     * @return User
     */
    protected function getUser()
    {
        return AppRepository::getUser();
    }

    /**
     * 获取 uuid
     * @return User
     */
    protected function getUuid()
    {
        return app('strongshop')->getUuid();
    }

    /**
     * 获取登录守护名称
     * @return type
     */
    protected function getGuard()
    {
        return AppRepository::getGuard();
    }

    /**
     * 渲染视图
     * @param type $view
     * @param type $data
     * @param type $mergeData
     * @return type
     */
    protected function view($view = null, $data = [], $mergeData = [])
    {
        return view($view, $data, $mergeData);
    }

    /**
     * 魔术方法
     * @param type $name
     * @return type
     */
    public function __get($name)
    {
        $action = 'get' . ucfirst($name);
        return $this->$action();
    }

}
