<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Product\Category;
use App\Models\Product\Product;
use App\Models\Article;

class GenerateSitemap extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'generate:sitemap';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '创建站点地图';

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
        $xml = new \SimpleXMLElement('<?xml version="1.0" encoding="UTF-8" ?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"></urlset>');

        //产品分类
        $this->info('产品分类 ...');
        $categories = Category::query()->where('type', 1)->select('id', 'updated_at')->get();
        foreach ($categories as $category)
        {
            $website = $xml->addChild('url');
            $website->addChild('loc', route('product.list.rewrite', ['catid' => $category->id]));
            $website->addChild('lastmod', now()->parse($category->updated_at)->toDateString());
        }
        //产品
        $this->info('产品 ...');
        $products = Product::query()->select('id', 'updated_at')->get();
        foreach ($products as $product)
        {
            $website = $xml->addChild('url');
            $website->addChild('loc', route('product.show.rewrite', ['id' => $product->id]));
            $website->addChild('lastmod', now()->parse($product->updated_at)->toDateString());
        }
        //文章分类
        $this->info('文章分类 ...');
        $articleCategories = Category::query()->where('type', 2)->select('id', 'updated_at')->get();
        foreach ($articleCategories as $articleCategory)
        {
            $website = $xml->addChild('url');
            $website->addChild('loc', route('article.index', ['catid' => $articleCategory->id]));
            $website->addChild('lastmod', now()->parse($articleCategory->updated_at)->toDateString());
        }
        //文章
        $this->info('文章 ...');
        $articles = Article::query()->select('id', 'updated_at')->get();
        foreach ($articles as $article)
        {
            $website = $xml->addChild('url');
            $website->addChild('loc', route('article.show.rewrite', ['id' => $article->id]));
            $website->addChild('lastmod', now()->parse($article->updated_at)->toDateString());
        }

        $content = $xml->asXML();
        $filename = public_path('sitemap.xml');
        try {
            $this->info('Writing sitemap.xml file ...');
            file_put_contents($filename, $content);
        } catch (\Exception $exc) {
            $this->error($exc->getMessage());
        }
        $this->info("站点地图创建成功:" . $filename);
    }

}
