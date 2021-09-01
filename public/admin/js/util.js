var indexLoadingST;
var Util = {};
Util.init = function () {
    this.iframeIndex = parent.layer.getFrameIndex ? parent.layer.getFrameIndex(window.name || null) : null; //获取父窗口索引
    if (this.iframeIndex) {
        $('form div.st-form-submit-btn').addClass('layui-hide');//隐藏提交按钮
    }
    //表单提示
    $('form.layui-form i.st-form-tip-help').click(function () {
        var tip = $(this).parent().next().find('input').attr('data-tips');
        var obj = $(this).parent().next().find('.st-form-tip');
        //console.log(obj.length);
        if (obj.length <= 0) {
            obj = $(this).parent().next().append('<div class="layui-word-aux st-form-tip"></div>')
            var obj = $(this).parent().next().find('.st-form-tip');
        }
        obj.text(tip);
        if (obj.hasClass('st-form-tip-error')) {
            obj.removeClass('st-form-tip-error').addClass('layui-show');
            return;
        }
        //obj.toggle();
        if (obj.hasClass('layui-hide')) {
            obj.removeClass('layui-hide').addClass('layui-show');
        } else if (obj.hasClass('layui-show')) {
            obj.removeClass('layui-show').addClass('layui-hide');
        } else {
            obj.addClass('layui-show');
        }
    });
    $.ajaxSetup({
        timeout: 30000,
        headers: {
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                    //, "Content-Type": "application/json;charset=utf-8"
        },
        dataType: 'json'
    });
    //监听提交
    layui.form.on('submit(ST-SUBMIT)', function (data) {
        //console.log(data)
        Util.postForm('form.layui-form', data.field, true);
        //layer.alert(JSON.stringify(data.field), {
        //    title: '最终的提交信息'
        //});
        return false;
    });
    //批发设置
    $('.st-wholesale-create').click(function () {
        if ($('.st-form-wholesale tbody tr').length >= 10) {
            layer.msg('最多设置10个', function () {});
            return;
        }
        $('.st-form-wholesale tbody tr:first').clone(true).removeClass('layui-hide').appendTo($('.st-form-wholesale tbody'));
    });
    $('.st-wholesale-remove').click(function () {
        $(this).parent().parent().remove();
    });
};
Util.postForm = function (formId, data, reload = true, contentType = 'application/x-www-form-urlencoded') {
    if (formId instanceof  Object) {
        var formObj = formId;
    } else {
        var formObj = $(formId);
    }
    var url = $(formObj).attr('action');
    if (!url) {
        url = window.location.pathname;
    }
    $.ajaxSetup({
        beforeSend: function () {
            indexLoadingST = layer.load();
        },
        error: function (xhr, status, error) {
            console.log(error);
        },
        complete: function (xhr, status) {
            layer.close(indexLoadingST);
        }
    });
    //注意：parent 是 JS 自带的全局对象，可用于操作父页面
    var iframeIndex = this.iframeIndex; //获取窗口索引
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'json',
        data: data,
        contentType: contentType,
        success: function (response, status, xhr) {
            console.log(response);
            $(formObj).find(":input").siblings('div.st-form-tip-error').text('');
            if (response.code === 200) {
                layer.msg(response.message, {
                    time: 1500
                });
                setTimeout(function () {
                    if (iframeIndex) {
                        parent.layer.close(iframeIndex);
                    }
                    if (reload) {
                        if (iframeIndex) {
                            //parent.window.location.reload();
                            parent.layui.table.reload("ST-TABLE-LIST");
                        } else {
                            window.location.reload();
                        }
                        return;
                    }
                    if (response.toUrl) {
                        window.location.href = response.toUrl;
                        return;
                    }
                }, 1600);

                return;
            }
            layer.msg(response.message, {
                //offset: 'b',
                anim: 6
            });
            let errors = response.data || [];
            for (let errorKey of Object.keys(errors)) {
                let errorVal = errors[errorKey][0];
                console.log(errorKey, errorVal);
//            var obj = $(formObj).find(":input[name=" + errorKey + "]").siblings('div.st-form-tip');
//            if (obj.length <= 0) {
//                $(formObj).find(":input[name=" + errorKey + "]").parent().append('<div class="layui-word-aux st-form-tip"></div>');
//            }
                var pos = errorKey.indexOf('.');
                console.log(pos);
                if (pos >= 0) {
                    errorKey = errorKey.substr(0, pos);
                }
                $(formObj).find(":input[name=" + errorKey + "]").siblings('div.st-form-tip').addClass('st-form-tip-error').text(errorVal).show();
                $(formObj).find("div[data-field=" + errorKey + "]").find('div.st-form-tip').addClass('st-form-tip-error').text(errorVal).show();
            }
            return false;
        }
    });
};
Util.destroy = function (url, data = {}, reload = true) {
    $.ajaxSetup({
        beforeSend: function () {
            indexLoadingST = layer.load();
        },
        error: function (xhr, status, error) {
            console.log(error);
        },
        complete: function (xhr, status) {
            layer.close(indexLoadingST);
        }
    });
    layer.confirm('确定删除? 删除后无法恢复', {icon: 3, title: '提示'}, function (index) {
        //do something
        $.post(url, data).then(response => {
            console.log(response);
            if (response.code === 200) {
                layer.msg(response.message, {
                    time: 1500
                });
                setTimeout(function () {
                    if (reload) {
                        window.location.reload();
                        return;
                    }
                    if (response.toUrl) {
                        window.location.href = response.toUrl;
                        return;
                    }
                }, 1600);
                return;
            }
            layer.msg(response.message, {
                //offset: 'b',
                anim: 6
            });
            return false;
        })
                .catch(function (error) {
                    console.log(error);
                });
        layer.close(index);
    });

};
Util.batchDelete = function (url, datas, field = 'id') {
    var arr = $.map(datas, function (n, i) {
        console.log(n);
        return n[field];
    });
    this.destroy(url, {id: arr});
};
Util.exportFile = function (tableIns, whereData) {
    console.log(tableIns);
    whereData.export = 1;
    $.ajaxSetup({
        beforeSend: function () {
            indexLoadingST = layer.msg('正在导出', {
                icon: 16
                , shade: 0.01
            });
        },
        error: function (xhr, status, error) {
            console.log(error);
        },
        complete: function (xhr, status) {
            layer.close(indexLoadingST);
        }
    });
    $.get(tableIns.config.url, whereData, function (res) {
        //导出任意数据
        layui.table.exportFile(tableIns.config.id, res.data); //data 为该实例中的任意数量的数据
        layer.msg('导出成功');
    })
};
/**
 * 创建表单窗口
 * @param {type} url 提交url
 * @param {type} title 窗口标题
 * @param {type} area 窗口宽高
 * @param {type} narrowTitle 是否缩低窗口标题高度
 * @param {type} btn 操作按钮文案
 * @returns {undefined}
 */
Util.createFormWindow = function (url, title = '信息', area = ['45%', '60%'], narrowTitle = false, btn = ['保存', '取消']) {
    var titleStyle = '';
    if (narrowTitle) {
        titleStyle = 'height:25px;line-height:25px;font-size:14px;';
        $('span.layui-layer-setwin').css('top', '7px');
    }
    layer.open({
        type: 2,
        content: url,
        title: [title, titleStyle],
        //area: 'auto',
        area: area,
        fixed: false, //不固定
        maxmin: true,
        resize: true
        , btn: btn
        , yes: function (index, layero) {
            //按钮【按钮一】的回调
            /*
             var childIframeFormObj = layer.getChildFrame('form#ST-FORM', index);
             var childIframeframeWin = window[layero.find('iframe')[0]['name']];
             data = childIframeframeWin.layui.form.val('ST-FORM');
             Util.postForm(childIframeFormObj, data, true);
             */

            layer.getChildFrame('form.layui-form :submit', index).click();

            return false;//开启该代码可禁止点击该按钮关闭
        }
        , btn2: function (index, layero) {
            //按钮【按钮二】的回调
            //return false;
        }
        , cancel: function () {
            //右上角关闭回调
        }
    });
    if (narrowTitle) {
        $('span.layui-layer-setwin').css('top', '7px');
    }
    ;
};
/**
 * 创建查看窗口
 * @param {type} url 提交url
 * @param {type} title 窗口标题
 * @param {type} area 窗口宽高
 * @param {type} narrowTitle 是否缩低窗口标题高度
 * @returns {undefined}
 */
Util.createWindow = function (url, title = '信息', area = ['100%', '100%'], narrowTitle = false) {
    var titleStyle = '';
    if (narrowTitle) {
        titleStyle = 'height:25px;line-height:25px;font-size:14px;';
        $('span.layui-layer-setwin').css('top', '7px');
    }
    layer.open({
        type: 2,
        content: url,
        title: [title, titleStyle],
        //area: 'auto',
        area: area,
        fixed: true, //层是否固定在可视区域
        maxmin: true,
        resize: false,
        maxmin: false
    });
    if (narrowTitle) {
        $('span.layui-layer-setwin').css('top', '7px');
    }
    ;
};
Util.treeTable = function (id) {
    $(id + ' .st-tree-table').click(function () {
        var parentObj = $(this).parent().parent();
        Util.treeTableEach(parentObj);
    });
    var down = this.getUrlParam('down');
    if (down == 1) {
        $(id + " tbody tr").removeClass('layui-hide').find('.st-tree-table').children('i.layui-icon-add-circle').removeClass('layui-icon-add-circle').addClass('layui-icon-reduce-circle');
    }
};
Util.treeTableEach = function (parentObj, isFirstLevel = true) {
    var _this = this;
    var parenLevel = $(parentObj).attr('data-level');
    var parentOpen = $(parentObj).attr('data-open');
    parentOpen = $.trim(parentOpen);
    var parentIndent = $(parentObj).attr('data-indent');
    var childIndent = parseInt(parentIndent) + 1;
    var parentIconObj = $(parentObj).find('.st-tree-table').children('i');
    var closedStatus = 0, openedStatus = 1;
    if (isFirstLevel === false) {
        closedStatus = 1, openedStatus = 0;
    }
    if (parentOpen == -1) {
        return;
    }
    if (parentOpen == closedStatus) {
        $(parentObj).attr('data-open', 1);
        $(parentIconObj).removeClass('layui-icon-add-circle').addClass('layui-icon-reduce-circle');
        var parentSiblingsElements = $(parentObj).siblings("[data-level^='" + parenLevel + "'][data-indent='" + childIndent + "']");
        $(parentSiblingsElements).removeClass('layui-hide');
        parentSiblingsElements.each(function () {
            _this.treeTableEach(this, false);
        });
    } else if (parentOpen == openedStatus) {
        $(parentObj).attr('data-open', 0);
        $(parentIconObj).removeClass('layui-icon-reduce-circle').addClass('layui-icon-add-circle');
        var parentSiblingsElements = $(parentObj).siblings("[data-level^='" + parenLevel + "']");
        $(parentSiblingsElements).addClass('layui-hide');
    }
    ;
};
Util.sortImage = function (id) {
    var _this = this;
    $(id).sortable({
        start: function () {
        },
        drag: function () {
        },
        stop: function () {
            //layer.msg('sortImage');
            //_this.sortImageCover(id);
        }
    }).disableSelection();
    $(id + " i.layui-icon-delete").click(function () {
        $(this).parentsUntil('table').parent().parent().fadeOut(function () {
            $(this).remove();
            _this.sortImageCover(id);
        });
    });
};
Util.sortImageCover = function (id) {
    $(id + ">li:eq(1)").find('input[name=isImgCover],input[name=isImgSpec]').attr('checked', 'true');
};
Util.getUrlParam = function (name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r !== null || r !== '') {
        return unescape(r[2]);
    }
    return null; //返回参数值
};
/**
 * 创建下拉框
 * @param {type} datas 渲染的数据
 * @param {type} selected 选中的数据
 * @param {type} map 
 * @param {type} name
 * @returns {undefined}
 */
Util.htmlSelect = function (id, rows, selected, map = ["id", "name"]) {
    var url = rows;
    $.get(url).then(response => {
        console.log(response);
        if (response.code !== 200) {
            return;
        }
        let htmlStr = '';
        let datas = response.data || [];
        for (let dataKey of Object.keys(datas)) {
            let value = datas[dataKey][map[0]];
            let name = datas[dataKey][map[1]];
            htmlStr += '<option value="' + value + '">' + name + '</option>';
        }
        console.log(htmlStr);
        $(id).append(htmlStr);
        return false;
    })
            .catch(function (error) {
                console.log(error);
            });

};
/*
 * 数据表格列表 默认配置
 * @type type
 */
Util.tableConfigDefault = {
    elem: '#ST-TABLE-LIST'//table 容器唯一 id
    , searchFormId: 'ST-FORM-SEARCH'//查询搜索表单id(自定义字段值)
    , url: window.location.pathname//请求url，默认当前url
    , title: '数据列表'
    , escape: true //是否开启 xss 字符过滤
    , autoSort: false //禁止前端自动排序
    , totalRow: false //统计
    , toolbar: '#ST-TOOL-BAR' // 工具栏
    , defaultToolbar: [
        'filter', //字段过滤
        'print', //打印
        'exports', //导出
        //自定义按钮
        {
            title: '导出(当前搜索条件下全部数据)' //标题
            , layEvent: 'ST-EXPORT-EXCEL' //事件名，用于 toolbar 事件中使用
            , icon: 'layui-icon-export' //图标类名
        }]
    , initSort: {
        field: 'id' //排序字段，对应 cols 设定的各字段名
        , type: 'desc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
    }
    , page: true
    , height: 'full-100'//高度最大适应化
    , parseData: function (res) { //res 即为原始返回的数据
        return {
            code: res.code == 200 ? 0 : res.code, //解析接口状态
            msg: res.message, //解析提示文本
            count: res.data.total, //解析数据长度
            data: res.data.data //解析数据列表
        };
    }
    , done: function (res, curr, count) {//数据渲染完的回调
        //如果是异步请求数据方式，res即为你接口返回的信息。
        //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
        console.log(res);
        //得到当前页码
        console.log(curr);
        //得到数据总量
        console.log(count);
        //图片放大
        $(".st-img-zoom").click(function () {
            var src = $(this).attr('src');
            var html = "<img src='" + src + "' style='max-width:500px;height:auto;' />";
            layer.open({
                type: 1,
                title: false,
                closeBtn: 1,
                area: ['auto'],
                area: ['500px', '500px'],
                skin: 'layui-layer-nobg', //没有背景色
                shadeClose: true,
                content: html
            });
        });
    }
    , cols: []
    , size: "sm"
};
//渲染数据表格列表
Util.renderTable = function (tableConfig) {
    var tableIns = layui.table.render(Object.assign(this.tableConfigDefault, tableConfig));
    //console.log(tableIns);
    var tableId = tableIns.config.id;
    var searchFormId = tableIns.config.searchFormId;
    //条件搜索
    layui.$('form[lay-filter="ST-FORM-SEARCH"] .st-search-button').on('click', function () {
        var data = layui.form.val(searchFormId);
        console.log(data);
        tableIns.reload({
            where: data
            , page: {
                curr: 1 //重新从第 1 页开始
            }
        }, true);
    });
    //监听排序事件 
    layui.table.on('sort(' + tableId + ')', function (obj) { //注：sort 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        tableIns.reload({
            initSort: obj //记录初始排序，如果不设的话，将无法标记表头的排序状态。
            , where: {//请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                field: obj.field //排序字段
                , order: obj.type //排序方式
            }
            , page: {
                curr: 1 //重新从第 1 页开始
            }
        }, true);
        //layer.msg('服务端排序。order by ' + obj.field + ' ' + obj.type);
    });
    //工具栏事件
    layui.table.on('toolbar(' + tableId + ')', function (obj) {
        var checkStatus = layui.table.checkStatus(obj.config.id);
        switch (obj.event) {
            case 'batchDelete':
                Util.batchDelete($(this).attr('data-href'), checkStatus.data);
                break;
            case 'ST-EXPORT-EXCEL':
                var data = layui.form.val(searchFormId);
                Util.exportFile(tableIns, data);
                break;
        }
        return;
    });
    return tableIns;
};
/**
 * 获取批发设置的数据
 * @returns {Util.getWholesaleSet.utilAnonym$20|Boolean}
 */
Util.pluckWholesaleSet = function () {
    var wholesale_num = [], wholesale_price = [];
    $("input[name='wholesale_num']").each(function (i) {
        if (i == 0) {
            return;
        }
        i--;
        wholesale_num[i] = $(this).val();
    });
    $("input[name='wholesale_price']").each(function (i) {
        if (i == 0) {
            return;
        }
        i--;
        wholesale_price[i] = $(this).val();
    });
    return {
        num: wholesale_num,
        price: wholesale_price
    };
};
/**
 * 获取产品图片数据
 * @returns {Array}
 */
Util.pluckImgPhotos = function () {
    var img_photos = [];
    $(".st-sortable-image li").each(function (i) {
        if (i === 0) {
            return;
        }
        i--;
        img_photos[i] = {
            src: $(this).find('img').attr("src"),
            title: $(this).find('img').attr("data-title"),
            isImgCover: $(this).find('input[name=isImgCover]').is(":checked"),
            isImgSpec: $(this).find('input[name=isImgSpec]').is(":checked")
        };
    });
    return img_photos;
};
/**
 * 获取产品规格数据
 * @returns {Util.getSpecs.utilAnonym$22|Boolean}
 */
Util.pluckSpecs = function () {
    var specs = [];
    var n = 0;
    $(":input[name='productSpec']").each(function (i) {
        var spec_id = $(this).attr('data-specId');
        var spec_type = $(this).attr('data-specType');
        var spec_value = $(this).val();
        specs[n] = {
            spec_id: spec_id,
            spec_type: spec_type,
            spec_value: spec_value
        };
        n++;
    });
    return specs;
};
/**
 * 产品规格 html部分
 * @param {type} url
 * @param {type} specGroupId
 * @param {type} productId
 * @returns {undefined}
 */
Util.getSpecs = function (url, specGroupId = "", productId = "") {
    url += '?specGroupId=' + specGroupId;
    url += '&productId=' + productId;
    $.get(url, function (res) {
        $("#productSpecsList").html(res.data);
        /*
         * 动态更新渲染
         * 具体参考 https://www.layui.com/doc/modules/form.html#render
         */
        layui.form.render('select');//更新渲染
    });
};

//*** BEGIN 此初始化方法`Util.init()`必须放在末尾执行
Util.init();
//*** END `Util.init()`
