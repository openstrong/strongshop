<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class InstallPublic extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'install:public';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '产品安装';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        if (!class_exists('PharData'))
        {
            $this->warn('PharData 类不存在，无法完成 产品安装');
        }
        $this->line('开始 产品安装 ...');
        $filepath = storage_path('install/products_images.tar');
        $phar = new \PharData($filepath);
        $phar->extractTo(storage_path('app/public'), null, true);
        $this->info('产品安装 成功.');
    }

}
