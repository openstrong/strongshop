<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Repositories\AppRepository;

class AppServiceProvider extends ServiceProvider
{

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //单例绑定
        $this->app->singleton('strongshop', function ($app) {
            return new AppRepository();
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //修改配置信息 邮箱配置等
        AppRepository::changeConfig();
    }

}
