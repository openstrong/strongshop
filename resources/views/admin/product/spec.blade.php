@if(isset($specs) && isset($productSpecs))
<!--价格规格-->
<fieldset class="layui-elem-field">
    <legend>价格规格<font class="st-sepc-tip">（作为产品价格属性选择）</font></legend>
    <div class="layui-field-box">
        <div class="layui-form-item">
            @foreach ($specs as $spec)
            @if($spec['spec_type']==1)
            <label class="layui-form-label st-form-input-required">{{$spec->name}}</label>
            <div class="layui-input-inline">
                @if($spec['input_type'] == 1)
                <select name="productSpec" lay-filter='productSpec' data-specId="{{$spec->id}}" data-specType="{{$spec->spec_type}}">
                    @foreach ($spec['select_values_array'] as $select_value)
                    <option value="{{$select_value}}" @if(isset($productSpecs[$spec->id]) && $productSpecs[$spec->id] == $select_value)selected @endif>{{$select_value}}</option>
                    @endforeach
                </select>
                @elseif($spec['input_type'] == 2)
                <input type="text" name="productSpec" value="{{$productSpecs[$spec->id] ?? ''}}" data-specId="{{$spec->id}}" data-specType="{{$spec->spec_type}}" class="layui-input">
                @endif
            </div>
            @endif
            @endforeach
        </div>
    </div>
</fieldset>
<!--普通规格-->
<fieldset class="layui-elem-field">
    <legend>普通规格 <font class="st-sepc-tip">（作为普通产品参数显示）</font></legend>
    <div class="layui-field-box">
        @foreach ($specs as $spec)
        @if($spec['spec_type']==2)
        <div class="layui-form-item">
            <label class="layui-form-label">{{$spec->name}}</label>
            <div class="layui-input-inline">
                @if($spec['input_type'] == 1)
                <select name="productSpec" lay-filter='productSpec' data-specId="{{$spec->id}}" data-specType="{{$spec->spec_type}}">
                    <option>请选择</option>
                    @foreach ($spec['select_values_array'] as $select_value)
                    <option value="{{$select_value}}" @if(isset($productSpecs[$spec->id]) && $productSpecs[$spec->id] == $select_value)selected @endif>{{$select_value}}</option>
                    @endforeach
                </select>
                @elseif($spec['input_type'] == 2)
                <input type="text" name="productSpec" value="{{$productSpecs[$spec->id] ?? ''}}" data-specId="{{$spec->id}}" data-specType="{{$spec->spec_type}}" class="layui-input">
                @endif
            </div>
        </div>
        @endif
        @endforeach
    </div>
</fieldset>
@endif
