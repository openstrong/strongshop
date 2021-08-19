<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Repositories\Admin;

use App\Models\Product\Category;
use App\Models\Product\Product;

class ProductRepositories
{

    /**
     * 回显选中的分类id
     * @param array $ids
     */
    static public function categoryTree(array $ids = [])
    {
        $modelCategory = Category::orderBy('sort', 'DESC');
        $modelCategory->where('type', 1)->where('level', 1);
        $modelCategory->with(['children' => function($query) {
                $query->select('id', 'name as title', 'parent_id', 'status');
                $query->with(['children' => function($query) {
                        $query->select('id', 'name as title', 'parent_id', 'status');
                    }]);
            }]);
        $modelCategory->select('id', 'name as title', 'parent_id', 'status');
        $rows = $modelCategory->get();
        foreach ($rows as $row)
        {
            $row->spread = true;
            if ($row->status == 2)
            {
                $row->disabled = true;
            }
            if (in_array($row->id, $ids) && $row->children->isEmpty())
            {
                $row->checked = true;
            }

            foreach ($row->children as $child)
            {
                $child->spread = true;
                if ($child->status == 2 || $row->status == 2)
                {
                    $child->disabled = true;
                }
                if (in_array($child->id, $ids) && count($child['children']) == 0)
                {
                    $child->checked = true;
                }
                foreach ($child['children'] as $child2)
                {
                    if (in_array($child2->id, $ids))
                    {
                        $child2->checked = true;
                    }
                    if ($child2->status == 2 || $row->status == 2 || $child->status == 2)
                    {
                        $child2->disabled = true;
                    }
                }
            }
        }
        return $rows;
    }

    /**
     * 处理前端提交的分类树数据
     * @param array $categories
     * @return type
     */
    static public function pluckCategoryId(array $categories)
    {
        $data = [];
        foreach ($categories as $category)
        {
            $data[] = $category['id'];
            if (!isset($category['children']))
            {
                continue;
            }
            foreach ($category['children'] as $child)
            {
                $data[] = $child['id'];
                if (!isset($child['children']))
                {
                    continue;
                }
                foreach ($child['children'] as $ch)
                {
                    $data[] = $ch['id'];
                }
            }
        }
        return $data;
    }

    /**
     * 处理前端提交的产品规格
     * @param array $specs
     */
    static public function pluckSpecs(array $specs)
    {
        $data = [];
        foreach ($specs as $spec)
        {
            $spec_id = $spec['spec_id'];
            $data[$spec_id] = [
                'spec_type' => $spec['spec_type'],
                'spec_value' => $spec['spec_value'] ?: '',
            ];
        }
        return $data;
    }

    /**
     * 检测产品
     * @param array $productSpecs
     * @param string $spu
     * @return boolean
     */
    static public function checkUniqueSpec(array $productSpecs, string $spu, $ignoreId = null)
    {
        $specValues = collect($productSpecs)->where('spec_type', 1)->pluck('spec_value', 'spec_id')->toArray();
        $productModel = Product::query()
                ->where('spu', $spu)
                ->with(['specs' => function($query) {
                        $query->select('id');
                        $query->where('product_spec.spec_type', 1);
                    }])
                ->select('id', 'spu', 'sku')
        ;
        if ($ignoreId)
        {
            $productModel->where('id', '<>', $ignoreId);
        }
        $products = $productModel->get()->toArray();
        foreach ($products as $product)
        {
            $exists_product_specs = [];
            foreach ($product['specs'] as $spec)
            {
                $spec_id = $spec['pivot']['spec_id'];
                $exists_product_specs[$spec_id] = $spec['pivot']['spec_value'];
            }
            if ($exists_product_specs == $specValues)
            {
                return $product['sku'];
            }
        }
        return false;
    }

}
