$(function ($) {
    //确定按键（添加/修改）
    $('#add_btn').click(function () {
        methods.addHandle()
    });

    //选项重置
    $('#xztb').on('click', '.o_reset',function(){
        $('#xztb .select select').html("");
    });

    //选项添加
    $('#xztb').on('click', '.o_add',function(){
        var inew = $('#xztb .o_new').val().trim();
         $('#xztb .o_new').val("");
        if (inew==undefined || inew==="") return;
        $('#xztb .select select').append('<option selected>' + optionIndex[$('#xztb .select option').length] + '.' + inew + '</option>')
    });

    //编辑按键
    $('#show_tbody').on('click','.edit', function () {
        trIndex = $('.edit', '#show_tbody').index($(this));
        addEnter = false;
        $(this).parents('tr').addClass('has_case');
        methods.editHandle(trIndex);
    });

    //hover
    $('#show_tbody').on('mouseenter','tr',function () {
        $("#v_question").html($(this).find('td').eq(2).html());
        $('#v_score').html("("+$(this).find('td').eq(6).html()+")");

        $('#v_option').html(" ");
        $(this).find('select option').each(function () {
            var str="";
            str+='<li class="option"> <label>' +
                $(this).html()+
                '</label> </li>';
            $('#v_option').append($(str));
        });
        $('#v_answer').html('答案:'+$(this).find('td').eq(4).html());
        $('#v_analyze').html('解析'+$(this).find('td').eq(5).html())
    });

    //搜索按键
    $('#search_btn').click(function () {
        methods.seach();
    });

    //重置按钮
    $('#back_btn').click(function () {
        $('#Ktext').val(' ');
        methods.resectList();
    });
    
    //删除按钮
    $('#tb').on('click', '.del', function () {
        $(this).parents('tr').remove();
    });

    $('#renyuan').on('hide.bs.modal',function() {
        addEnter = true;
        $('#show_tbody tr').removeClass('has_case');
        $('#xztb input').val('');
        $('#xztb .select select').html("");
    });

});

var addEnter = true,
    noRepeat = true,
    tdStr = '',
    trIndex,
    hasNullMes = false,
    optionIndex='ABCDEFGHIGKLMNOPQRSTUVWXYZ';

function getTd(selector){
     var a=$(selector).val();
     if(a===undefined || a=="") return '<td></td>';
     return '<td>'+a.trim()+'</td>';
}

var methods = {
    addHandle: function (the_index) {
        hasNullMes = false;
        methods.checkMustMes();
        if (hasNullMes) {
            return;
         }
        if (addEnter) {
            methods.checkRepeat();
            if (noRepeat) {
                methods.setStr();
                $('#show_tbody').append('<tr>' + tdStr + '</tr>');
                $('#renyuan').modal('hide');
            }
        }else{
            methods.setStr();
            $('#show_tbody tr').eq(trIndex).empty().append(tdStr);
            $('#renyuan').modal('hide');
        } 
    },
    editHandle: function (the_index) {

        var tar = $('#show_tbody tr').eq(the_index);
        
        var nowConArr = [];
        for (var i=0; i<tar.find('td').length-1;i++) {
            var a = tar.children('td').eq(i).html();
            nowConArr.push(a);
        }

        $('#renyuan').modal('show');

        $('#xztb .type').val(nowConArr[0]);
        $('#xztb .kind').val(nowConArr[1]);
        $('#xztb .question').val(nowConArr[2]);
        $('#xztb .answer').val(nowConArr[4]);
        $('#xztb .analyzing').val(nowConArr[5]);
        $('#xztb .score').val(nowConArr[6]);
        $('#xztb .select').html(nowConArr[3]);
    },
    setStr: function () {
        tdStr = '';
        tdStr += getTd('#xztb .type');
        tdStr +=getTd('#xztb .kind');
        tdStr +=getTd('#xztb .question');
        tdStr += '<td>' + '<select class="form-control select_down" style = "font-size: 13px; color: #666;" >'+
            $("#xztb .select select").html()
            +'</select> </td > ';
        tdStr += getTd('#xztb .answer');
        tdStr +=getTd('#xztb .analyzing');
        tdStr +=getTd('#xztb .score');
        tdStr+='<td><a href="#" class="edit">编辑</a> <a href="#" class="del">删除</a></td>';

    },
    seach: function () {
        var a = $('#show_tbody tr');
        var search = $('#Ktext').val().trim();
        var type=$('#Ktype').val().trim();
        if (search=='') {
            /*bootbox.alert({
                title: "来自火星的提示",
                message: "搜索内容不能为空",
                closeButton:false
            })*/
            return;
        }

        switch (type) {
            case '全部':
                break;
            case '题型':
                break;
            case  '题类':
                break;
            case '分值':
                break;
        }
        //todo  ajax请求
    },
    resectList: function () {
        $('#show_tbody tr').show();
    },
    checkMustMes: function () {
        if ($('#xztb .kind').val().trim()==='') {
            bootbox.alert({
                title: "error",
                message: "请填写题类",
                closeButton:false
            });
            hasNullMes = true;
            return
        }
        if ($('#xztb .question').val().trim()==='') {
            bootbox.alert({
                title: "error",
                message: "请填写题干",
                closeButton:false
            });
            hasNullMes = true;
            return
        }
        if ($('#xztb .answer').val().trim()==='') {
            bootbox.alert({
                title: "error",
                message: "请填写题目答案",
                closeButton:false
            });
            hasNullMes = true;
            return
        }

        if($('#xztb .select option').length<2){
            bootbox.alert({
                title: "error",
                message: "题目选项至少为两个",
                closeButton:false
            });
            hasNullMes = true;
            return
        }

        var type=$('#xztb .type').val();
        var ans=$('#xztb .answer').val().split('');
        if(type=='单选题' && ans.length>1){
            bootbox.alert({
                title: "error",
                message: "单选题中存在多个答案",
                closeButton:false
            });
            hasNullMes = true;
            return;
        }

        $(ans).each(function () {
            if(optionIndex.substring(0,$('#xztb .select option').length).indexOf(this)<0){
                bootbox.alert({
                    title: "error",
                    message: "存在选项中不存在的答案",
                    closeButton:false
                });
                hasNullMes = true;

            }
        });

        str="";

        $(ans).sort().each(function () {
            if(str.indexOf(this)<0){
                str+=this;
            }
        });

        $('#xztb .answer').val(str);
    },
    checkRepeat: function () {
        var newQuestion = $('#xztb .question').val().trim();

        for (var i = 0; i<$('#show_tbody tr:not(".has_case")').length;i++) {
            var a=$('#show_tbody tr:not(".has_case")').eq(i).find('td').eq(2).val().trim();
            if(a==newQuestion){
                noRepeat = false;
                bootbox.alert({
                    title: "error",
                    message: "重复的题名!!!",
                    closeButton: false
                });
                return;
            } 
        }
        noRepeat = true; 
    }
};