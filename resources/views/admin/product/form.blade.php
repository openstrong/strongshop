@extends('admin.layouts.app')

@push('styles')
<style></style>
@endpush

@push('scripts')
<script></script>
@endpush

@section('content')
<form class="layui-form" action="@isset($_action){{$_action}}@endisset" id="ST-FORM">
    <input name="id" type="hidden" value="{{$model->id}}" />
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class="layui-this">基础信息</li>
            <li>产品分类</li>
            <li>产品价格</li>
            <li>产品详情</li>
            <li>产品图片</li>
            <li>产品规格</li>
            <li>相关产品</li>
            <li>相关配件</li>
            <li>SEO设置</li>
        </ul>

        <div class="layui-tab-content">
            <!--基本信息-->
            <div class="layui-tab-item layui-show">
                <div class="layui-row">
                    <div class="layui-col-xs12">
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('title')}}</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" value="{{$model->title}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('intro')}}</label>
                            <div class="layui-input-block">
                                <textarea name="intro" autocomplete="off" placeholder="" class="layui-textarea" style="min-height: 60px;">{{$model->intro}}</textarea>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('spu')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="spu" value="{{$model->spu}}" autocomplete="off" placeholder="" class="layui-input" data-tips="商品聚合信息的最小单位，如 手机->苹果手机->苹果6，苹果6 就是SPU">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('sku')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sku" value="{{$model->sku}}" autocomplete="off" placeholder="" class="layui-input" data-tips="商品的不可再分的最小单元，如 土豪金 16G 苹果6">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('brand_id')}}</label>
                            <div class="layui-input-inline">
                                <select name="brand_id">
                                    <option value="0">--</option>
                                    @foreach ($brands as $brand)
                                    <option value="{{$brand->id}}" @if($model->brand_id == $brand->id)selected @endif>{{$brand->title}}</option>
                                    @endforeach
                                </select>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('stock')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stock" value="{{$model->stock}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('stock_status')}}</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="stock_status" value="1" title="有库存" @if($model->stock_status==1)checked @endif>
                                <input type="radio" name="stock_status" value="2" title="无库存" @if($model->stock_status==2)checked @endif>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('is_recommend')}}</label>
                            <div class="layui-input-block">
                                <input type="checkbox" name="is_hot" value="1" title="{{$model->getAttributeLabel('is_hot')}}" lay-skin="primary"  @if($model->is_hot==1)checked @endif>
                                <input type="checkbox" name="is_new" value="1" title="{{$model->getAttributeLabel('is_new')}}" lay-skin="primary"  @if($model->is_new==1)checked @endif>
                                <input type="checkbox" name="is_recommend" value="1" title="{{$model->getAttributeLabel('is_recommend')}}" lay-skin="primary"  @if($model->is_recommend==1)checked @endif>
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('status')}}</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="status" value="1" title="上架" @if($model->status==1)checked @endif>
                                <input type="radio" name="status" value="2" title="下架" @if($model->status==2)checked @endif>
                                <div class="layui-word-aux st-form-tip">”下架“后，该产品无法购买</div>
                            </div>
                            <label class="layui-form-label st-form-input-required"><i class="layui-icon layui-icon-help st-form-tip-help"></i>{{$model->getAttributeLabel('hidden')}}</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="hidden" value="1" title="是" @if($model->hidden==1)checked @endif>
                                <input type="radio" name="hidden" value="2" title="否" @if($model->hidden==2)checked @endif>
                                <div class="layui-word-aux st-form-tip">如果选择”是“，则该产品不会显示在产品搜索和分类列表中。但依然可在详情页显示和进行购买</div>
                            </div>
                        </div>
                        
                        <hr>
                        <div class="st-h10"></div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('long')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="long" value="{{$model->long}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('width')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="width" value="{{$model->width}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('high')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="high" value="{{$model->high}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('weight')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="weight" value="{{$model->weight}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('volume_weight')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="volume_weight" value="{{$model->volume_weight}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">{{$model->getAttributeLabel('click_num')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="click_num" value="{{$model->click_num}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('remark')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="remark" value="{{$model->remark}}" autocomplete="off" placeholder="" class="layui-input">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--产品分类-->
            <div class="layui-tab-item">
                <div id="ST-TREE"></div>
            </div>
            <!--产品价格-->
            <div class="layui-tab-item">
                <fieldset class="layui-elem-field">
                    <legend>基础价格</legend>
                    <div class="layui-field-box">
                        <div class="layui-form-item">
                            <label class="layui-form-label st-form-input-required">{{$model->getAttributeLabel('sale_price')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sale_price" value="{{$model->sale_price}}" class="layui-input" onblur="$('#original_price').val((this.value*1.3).toFixed(3));" />
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                            <label class="layui-form-label">{{$model->getAttributeLabel('original_price')}}</label>
                            <div class="layui-input-inline">
                                <input type="text" name="original_price" value="{{$model->original_price}}" autocomplete="off" placeholder="" class="layui-input" id="original_price">
                                <div class="layui-word-aux st-form-tip"></div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="layui-elem-field">
                    <legend>{{$model->getAttributeLabel('wholesale_set')}}</legend>
                    <div class="layui-field-box">
                        <div class="layui-form-item" data-field='wholesale_set'>
                            <div><a class="layui-btn layui-btn-xs st-wholesale-create">新增</a></div>
                            <table class="layui-table st-form-wholesale" lay-size="sm" lay-skin="nob">
                                <colgroup>
                                    <col width="150">
                                    <col width="150">
                                    <col width="100">
                                    <col>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>数量</th>
                                        <th>价格</th>
                                        <th>操作</th>
                                    </tr> 
                                </thead>
                                <tbody>
                                    <tr class="layui-hide">
                                        <td> ≥ <input type="text" name="wholesale_num" class="" /></td>
                                        <td><input type="text" name="wholesale_price" class="" /></td>
                                        <td><a class="layui-btn layui-btn-xs st-wholesale-remove">删除</a></td>
                                    </tr>
                                    @isset($model->wholesale_set['num'])
                                    @foreach ($model->wholesale_set['num'] as $numVal)
                                    <tr>
                                        <td> ≥ <input type="text" name="wholesale_num" value="{{$numVal}}" /></td>
                                        <td><input type="text" name="wholesale_price"  value="{{$model->wholesale_set['price'][$loop->index]}}" /></td>
                                        <td><a class="layui-btn layui-btn-xs st-wholesale-remove">删除</a></td>
                                    </tr>
                                    @endforeach
                                    @endisset
                                </tbody>
                            </table>
                            <div class="layui-word-aux st-form-tip"></div>
                        </div>
                    </div>
                </fieldset>
            </div>
            <!--产品详情-->
            <div class="layui-tab-item">
                <div class="layui-row">
                    <div id="div1">{!!$model->details!!}</div>
                    <textarea class="layui-textarea layui-hide" name="details" id="LAY_ditor" lay-verify="details">{!!$model->details!!}</textarea>
                    <div class="layui-word-aux st-form-tip"></div>
                </div>
            </div>
            <!--产品图片-->
            <div class="layui-tab-item">
                <div class="layui-row">
                    <div class="layui-upload-drag" id="ST-UPLOAD">
                        <i class="layui-icon"></i>
                        <p>点击上传产品图，或将图片拖拽到此处。( ≤ {{config('strongshop.uploadLimitForImage')}}kb )</p>
                    </div>
                    <br/>
                    <br/>
                    <div class="layui-col-md6">
                        <ul id="ST-SORTABLE-IMAGE" class="st-sortable-image">
                            <li class="layui-hide">
                                <table>
                                    <tr>
                                        <td>
                                            <img src="" data-title="" />
                                        </td>
                                        <td>
                                            <label>作为封面图 <input type="radio" name="isImgCover" value="1" lay-ignore /></label>
                                        </td>
                                        <td>
                                            <label>同时作为规格图 <input type="radio" name="isImgSpec" value="1" lay-ignore /></label>
                                        </td>
                                        <td>
                                            <i class="layui-icon layui-icon-delete"></i>
                                        </td>
                                        <td>
                                            <i class="layui-icon layui-icon-slider"></i> 
                                        </td>
                                    </tr>
                                </table>
                            </li>
                            @if(!empty($model->img_photos))
                            @foreach ($model->img_photos as $img_photo)
                                <li>
                                    <table>
                                    <tr>
                                        <td>
                                            <img src="{{$img_photo['src']}}" data-title="{{$img_photo['title']}}" />
                                        </td>
                                        <td>
                                            <label>作为封面图 <input type="radio" name="isImgCover" value="1" lay-ignore @if(isset($img_photo['isImgCover']) && $img_photo['isImgCover']) checked @endif /></label>
                                        </td>
                                        <td>
                                            <label>同时作为规格图 <input type="radio" name="isImgSpec" value="1" lay-ignore @if(isset($img_photo['isImgSpec']) && $img_photo['isImgSpec']) checked @endif /></label>
                                        </td>
                                        <td>
                                            <i class="layui-icon layui-icon-delete"></i>
                                        </td>
                                        <td>
                                            <i class="layui-icon layui-icon-slider"></i> 
                                        </td>
                                    </tr>
                                    </table>
                                </li>
                            @endforeach
                            @endif
                        </ul>
                        <div class="st-h50 layui-clear"></div>
                    </div>
                </div>
            </div>
            <!--产品规格-->
            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">{{$model->getAttributeLabel('spec_group_id')}}</label>
                    <div class="layui-input-inline">
                        <select name="spec_group_id" lay-filter="specGroup">
                            <option value="">请选择</option>
                            @foreach ($specGroups as $specGroup)
                            <option value="{{$specGroup->id}}" @if($model->spec_group_id == $specGroup->id)selected @endif>{{$specGroup->name}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <hr>
                <div id="productSpecsList"></div>
            </div>
            <!--相关产品-->
            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">{{$model->getAttributeLabel('related_sku')}}</label>
                    <div class="layui-input-block">
                        <input type="text" name="related_sku" value="{{$model->related_sku}}" autocomplete="off" placeholder="请填写 sku， 多个 sku 请以英文标点 "," 分割" class="layui-input">
                        <div class="layui-word-aux st-form-tip layui-show">请填写 sku， 多个 sku 请以英文标点 "," 分割</div>
                    </div>
                </div>
            </div>
            <!--相关配件-->
            <div class="layui-tab-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">{{$model->getAttributeLabel('related_accessories_sku')}}</label>
                    <div class="layui-input-block">
                        <input type="text" name="related_accessories_sku" value="{{$model->related_accessories_sku}}" autocomplete="off" placeholder="请填写 sku， 多个 sku 请以英文标点 "," 分割" class="layui-input">
                        <div class="layui-word-aux st-form-tip layui-show">请填写 sku， 多个 sku 请以英文标点 "," 分割</div>
                    </div>
                </div>
            </div>
            <!--SEO设置-->
            <div class="layui-tab-item layui-form-pane">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">{{$model->getAttributeLabel('meta_keywords')}}</label>
                    <div class="layui-input-block">
                        <input type="text" name="meta_keywords" value="{{$model->meta_keywords}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">{{$model->getAttributeLabel('meta_description')}}</label>
                    <div class="layui-input-block">
                        <input type="text" name="meta_description" value="{{$model->meta_description}}" autocomplete="off" placeholder="" class="layui-input">
                        <div class="layui-word-aux st-form-tip"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-form-item st-form-submit-btn">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="ST-SUBMIT">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
@endsection

@push('scripts_bottom')
<script>
!function () {
    var form = layui.form, layedit = layui.layedit, laydate = layui.laydate;
    
    //动态渲染产品规格html部分
    Util.getSpecs('/admin/product/spec/htmlString',$(":input[name='spec_group_id']").val(),{!!$model->id!!});
    //产品规格组选择事件监听
    form.on('select(specGroup)', function(data){
      Util.getSpecs('/admin/product/spec/htmlString',data.value,{!!$model->id!!});
    });
    
    //富文本编辑
    const E = window.wangEditor;
    const editor = new E('#div1');
    editor.config.uploadImgHeaders = {"X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')};//自定义header头
    editor.config.uploadImgServer = '/admin/upload/image/wangeditor'; // 配置 server 接口地址
    editor.config.uploadImgMaxSize = 2 * 1024 * 1024; // 2M 限制上传大小
    editor.config.uploadFileName = 'file';//上传文件名
    const $text1 = $('#LAY_ditor');
    editor.config.onchange = function (html) {
        // 第二步，监控变化，同步更新到 textarea
        $text1.val(html);
    };
    editor.create();
    // 第一步，初始化 textarea 的值
    $text1.val(editor.txt.html());
        
    //产品图片上传&排序
    var sortImageId = '#ST-SORTABLE-IMAGE';
    Util.sortImage(sortImageId);
    layui.upload.render({
        elem: '#ST-UPLOAD'
        , url: '/admin/upload/image?thumb=1' //改成您自己的上传接口
        , size: 2000 //限制文件大小，单位 KB
        , multiple: true //多文件上传
        , done: function (res) {
            layer.closeAll();
            console.log(res);
            if (res.code != 0) {
                layer.msg(res.message,function(){});
                return;
            }
            layer.msg('上传成功');
            $(sortImageId + ">li:first").clone(true).appendTo(sortImageId).removeClass('layui-hide').find('img').attr({src: res.data.src, "data-title": res.data.title});
            Util.sortImageCover(sortImageId);
        }
    });
    //产品分类树
    layui.tree.render({
        elem: '#ST-TREE'
        , data: {!!$categories!!}
        , showCheckbox: true  //是否显示复选框
        , id: 'ST-TREE'
        //, isJump: true //是否允许点击节点时弹出新窗口跳转
        , click: function (obj) {
        //var data = obj.data;  //获取当前点击的节点数据
        //layer.msg('状态：' + obj.state + '<br>节点数据：' + JSON.stringify(data));
        }
    });

    //监听提交
    layui.form.on('submit(ST-SUBMIT)', function (data) {
        var postDatas = data.field;//表单数据
        
        //产品分类数据
        var checkedData = layui.tree.getChecked('ST-TREE'); //获取选中节点的数据[产品分类]
        postDatas.categories = checkedData;
        
        //批发配置
        var wholesale_set = Util.pluckWholesaleSet();
        postDatas.wholesale_set = wholesale_set;
        
        //产品图片
        var img_photos = Util.pluckImgPhotos();
        postDatas.img_photos = img_photos;//产品相册
        postDatas.img_cover = $("input[name=isImgCover]:checked").parentsUntil('table').find('img').attr('src');//产品封面图
        postDatas.img_spec = $("input[name=isImgSpec]:checked").parentsUntil('table').find('img').attr('src');//产品规格图
        
        //产品规格
        postDatas.productSpecs = Util.pluckSpecs();
        
        //更多配置
        postDatas.more = {
            img_cover_show_inDetail:data.field.img_cover_show_inDetail
        };
        //提交json数据
        var postDatas = JSON.stringify(postDatas);
        Util.postForm('#ST-FORM', postDatas, true, 'application/json;charset=utf-8');
        return false;
    });
    
}();
</script>
@endpush
