<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class InitialInstalltion extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'install:init';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '初始化系统安装';

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
        exec("chcp 65001");
        pclose(popen('chcp 65001', 'r'));
        $this->call('key:generate', ['--ansi' => true]);

        $public_dir_exists = Storage::disk('public')->exists('202103');
        if ($public_dir_exists)
        {
            $this->info('产品已安装。');
        } else
        {
            $this->call('install:public');
        }
        $this->call('storage:link');

        $env_file = base_path('.env');
        if (!file_exists($env_file))
        {
            @copy('.env.example', '.env');
        } else
        {
            $this->line('');
            $this->warn('现在开始写入 .env 配置，注意：仅首次安装有效。');
            $host = $this->ask('Mysql host?', '127.0.0.1');
            $port = $this->ask('Mysql port?', '3306');
            $database = $this->ask('Mysql database?', 'strongshop');
            $username = $this->ask('Mysql uername?', 'root');
            $password = $this->ask('Mysql password?', '123456');
            $env_content = file_get_contents($env_file);
            $env_content = preg_replace('/{{host}}/', $host, $env_content);
            $env_content = preg_replace('/{{port}}/', $port, $env_content);
            $env_content = preg_replace('/{{database}}/', $database, $env_content);
            $env_content = preg_replace('/{{username}}/', $username, $env_content);
            $env_content = preg_replace('/{{password}}/', $password, $env_content);
            file_put_contents($env_file, $env_content);
            
            
        }
        try {
            DB::connection()->getPdo();
        } catch (\Exception $e) {
            return $this->error($e->getMessage());
        }
        DB::statement("CREATE DATABASE {$database} DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;");
        $this->call('migrate');
        $this->info('Install Successfully.');
    }

}
