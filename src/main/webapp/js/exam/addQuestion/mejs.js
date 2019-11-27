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
        $("#v_question").html($(this).find('td').eq(3).html());
        $('#v_score').html("("+$(this).find('td').eq(7).html()+")");

        $('#v_option').html(" ");
        $(this).find('select option').each(function () {
            var str="";
            str+='<li class="option"> <label>' +
                $(this).html()+
                '</label> </li>';
            $('#v_option').append($(str));
        });
        $('#v_answer').html('答案:'+$(this).find('td').eq(5).html());
        $('#v_analyze').html('解析'+$(this).find('td').eq(6).html())
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
        $tr= $(this).parents('tr');
        $.get("/exam/addQuestionSubmit",{id:+$tr.find('td:eq(0)').html()});
        $tr.remove();
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
    optionIndex='ABCDEFGHIGKLMNOPQRSTUVWXYZ',
    nowID=-1;

function getTd(selector){
     var a=$(selector).val();
     if(a===undefined || a=="") return '<td></td>';
     return '<td>'+a.trim()+'</td>';
}

function writeJson() {
    json={};

    json.type=$('#xztb .type').val();
    json.kind=$('#xztb .kind').val();
    json.question=$('#xztb .question').val();
    json.answer= $('#xztb .answer').val();
    json.analyze= $('#xztb .analyzing').val();
    json.score=parseInt($('#xztb .score').val());
    var opt="";
    $('#xztb .select option').each(function () {
        opt+=$(this).html()+"///////////////////end";
    });

    json.optionString=opt;
    return json;
}

var methods = {
    addHandle: function () {
        hasNullMes = false;
        methods.checkMustMes();
        if (hasNullMes) {
            return;
         }
        if (addEnter) {
            methods.checkRepeat(function () {
                $.get('/exam/addQuestionSubmit',writeJson(),function (data) {
                    methods.setStr(data);
                    $('#show_tbody').append('<tr>' + tdStr + '</tr>');
                    $('#renyuan').modal('hide');
                })
            });
        }else{
            json=writeJson();
            json.id=nowID;
            $.get('/exam/addQuestionSubmit',writeJson(),function (data) {
                methods.setStr(nowID);
                $('#show_tbody tr').eq(trIndex).empty().append(tdStr);
                $('#renyuan').modal('hide');
            })
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

        $('#xztb .type').val(nowConArr[1]);
        $('#xztb .kind').val(nowConArr[2]);
        $('#xztb .question').val(nowConArr[3]);
        $('#xztb .answer').val(nowConArr[5]);
        $('#xztb .analyzing').val(nowConArr[6]);
        $('#xztb .score').val(nowConArr[7]);
        $('#xztb .select').html(nowConArr[4]);

        nowID=tar.find("td:eq(0)").html();
    },
    setStr: function (id) {
        tdStr ='<td>'+id+'</td>';
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
            return;
        }
        var url="/exam/addQuestion?";

        switch (type) {
            case '全部':
                url+="type="+search+"&kind="+search+"&question="+search+"&scroe="+search;
                break;
            case '题型':
                url+="type="+search;
                break;
            case  '题类':
                url+="kind="+search;
                break;
            case '题干':
                url+="question="+search;
                break;
            case '分值':
                url+="score="+search;
                break;
        }
        window.location.href=url;
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
    checkRepeat: function (success) {
        var newQuestion = $('#xztb .question').val().trim();

        for (var i = 0; i<$('#show_tbody tr:not(".has_case")').length;i++) {
            var a=$('#show_tbody tr:not(".has_case")').eq(i).find('td').eq(2).val().trim();
            if(a==newQuestion){
                noRepeat = false;
                break;
            } 
        }
        
        $.get('/exam/searchQuestion',{question:newQuestion},function (e) {
            if(e!='-1') {
                noRepeat=false;
            }
            if(!noRepeat){
                bootbox.alert({
                    title: "error",
                    message: "重复的题名!!!",
                    closeButton: false
                });
                noRepeat=false;
            }else {
                noRepeat=true;
                success();
            }
        })
    }
};