<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Route;
use App\Repositories\AppRepository;

class RouteServiceProvider extends ServiceProvider
{

    /**
     * This namespace is applied to your controller routes.
     *
     * In addition, it is set as the URL generator's root namespace.
     *
     * @var string
     */
    protected $namespace = 'App\Http\Controllers';

    /**
     * The path to the "home" route for your application.
     *
     * @var string
     */
    public const HOME = '/';

    /**
     * Define your route model bindings, pattern filters, etc.
     *
     * @return void
     */
    public function boot()
    {
        //

        parent::boot();
    }

    /**
     * Define the routes for the application.
     *
     * @return void
     */
    public function map()
    {
        $this->mapApiRoutes();

        $this->mapWebRoutes();

        $this->mapAdminRoutes();
    }

    /**
     * Define the "web" routes for the application.
     *
     * These routes all receive session state, CSRF protection, etc.
     *
     * @return void
     */
    protected function mapWebRoutes()
    {
        //多语言前缀路由
        $langs = AppRepository::getLanguages();
        foreach ($langs as $lang_key => $lang)
        {
            Route::middleware('web')
                    ->prefix($lang_key)
                    ->namespace($this->namespace)
                    ->group(base_path('routes/web.php'));
        }
        Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/web.php'));
    }

    /**
     * Define the "api" routes for the application.
     *
     * These routes are typically stateless.
     *
     * @return void
     */
    protected function mapApiRoutes()
    {
        Route::prefix('api')
                ->middleware('api')
                ->namespace($this->namespace)
                ->group(base_path('routes/api.php'));
    }

    /**
     * 后台admin
     */
    protected function mapAdminRoutes()
    {
        Route::prefix('admin')
                ->middleware('admin')
                ->namespace($this->namespace)
                ->group(base_path('routes/admin.php'));
    }

}
