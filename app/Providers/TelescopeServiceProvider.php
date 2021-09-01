<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Laravel\Telescope\IncomingEntry;
use Laravel\Telescope\Telescope;
use Laravel\Telescope\TelescopeApplicationServiceProvider;
use Laravel\Telescope\EntryType;

class TelescopeServiceProvider extends TelescopeApplicationServiceProvider
{

    public $allowUrlPatterns = ['payment/*'];

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {

        //Telescope::night();

        $this->hideSensitiveRequestDetails();

        Telescope::filter(function (IncomingEntry $entry) {
            if (request()->is($this->allowUrlPatterns))
            {
                return true;
            }

            if ($this->app->environment(['local', 'testing', 'staging']))
            {
                return true;
            }

            return $entry->isReportableException() ||
            $entry->isFailedRequest() ||
            $entry->isFailedJob() ||
            $entry->isScheduledTask() ||
            $entry->hasMonitoredTag();
        });
    }

    /**
     * Prevent sensitive request details from being logged by Telescope.
     *
     * @return void
     */
    protected function hideSensitiveRequestDetails()
    {
        if ($this->app->environment(['local', 'testing', 'staging']))
        {
            return;
        }

        Telescope::hideRequestParameters(['_token']);

        Telescope::hideRequestHeaders([
            'cookie',
            'x-csrf-token',
            'x-xsrf-token',
        ]);
    }

    protected function authorization()
    {
        $this->gate();

        Telescope::auth(function ($request) {
            if (app()->environment('local'))
            {
                return true;
            }
            $user = $request->user('admin');
            return in_array($user->user_name, ['admin']);
        });
    }

    /**
     * Register the Telescope gate.
     *
     * This gate determines who can access Telescope in non-local environments.
     *
     * @return void
     */
    protected function gate()
    {
        Gate::define('viewTelescope', function ($user) {
            return true;
        });
    }

}
