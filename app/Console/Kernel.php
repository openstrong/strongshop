<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{

    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
            //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')
        //          ->hourly();
        if (\App::environment(['production']))
        {
            //清理telescope日志数据库
            $schedule->command('telescope:prune --hours=168')->dailyAt('12:10');
            //站点地图创建
            $schedule->command('generate:sitemap')->weeklyOn(1, '12:20'); //每周一的 12:20 执行一次任务
            //关闭超时(24h)未支付订单
            $schedule->command('order:close')->everyThirtyMinutes();
        }
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }

}
