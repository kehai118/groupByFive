$(function ($) {

    $('.yui-b').on('click','.q_add',function () {
        var id=$(this).closest("tr").attr('tid');
        methods.addQuestion(id)
    });

    $('.yui-b').on('click','.q_del',function(){
       methods.subQuestion($(this).closest('li'))
    });

    $('#reset').click(function(){
        $('.test_content_nr').html('');
        $('.test_content_title').hide();
        question_checkBox=[];
        question_radio=[];
    });
    
    $('#newPaperSubmit').click(function () {
        if(methods.checkSubmit()){
            var s ='('+ question_radio.concat(question_checkBox) .join(",")+')';

            $.get('/exam/newPaperSubmit',{
                questionsId:s,
                name:$('#newPaper .paper_name').val().trim(),
                totalScore:radio_score+checkBox_score
            },function (id) {
                bootbox.alert({
                    title: "成功",
                    message: "新建试卷"+id+"成功,马上返回主菜单",
                    closeButton: false
                });
                setTimeout(function () {
                        window.location.href='/exam/index';
                },3000);
            });
        }
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

    methods.flash();
});

var question_radio=[],
    radio_score=0,
    question_checkBox=[],
    checkBox_score=0;
    nameError=false;

var methods = {
    addQuestion: function (id) {
        $.getJSON("/exam/getQuestion?id="+id,function (json) {
            console.log(json);
            var $new;
            switch (json.type) {
                case '单选题':
                    $new=$('#h_radio').clone();
                    break;
                case '多选题':
                    $new=$('#h_check').clone();
                    break;
            }

            $new.attr("id",json.id);
            $new.find('.score').html(json.score);
            $new.find('.qb').html(json.question);
            $new.find('.answer').html('答案：'+json.answer);
            $new.find('.explain').html('解析：'+(json.analyze==null?'无':json.analyze));

            var options=json.options;
            var i=options.length;
            $op=$new.find('.option');
            while (i-->1){
                $op.clone().insertBefore($op);
            }
            $new.find('.option').each(function (i) {
                $(this).find('.option_title').html(options[i].optionIndex+'. <p class="ue" style="display: inline;">'+options[i].descript + '</p>');
                $(this).find('input').attr('name','option'+json.id);
                if(json.answer.indexOf(options[i].optionIndex)>-1){
                    $(this).find('input').attr("checked","checked");
                }
            });

            switch (json.type) {
                case '单选题':
                    $new.appendTo($('.test_content_nr:eq(0)'));
                    radio_score+=json.score;
                    question_radio.push(json.id);
                    break;
                case '多选题':
                    checkBox_score+=json.score;
                    question_checkBox.push(json.id);
                    $new.appendTo($('.test_content_nr:eq(1)'));
                    break;
            }
            $new.show();
            methods.flash();
            $('#toJump').attr('href','#'+json.id);
            $('#toJump').get(0).click();
        })
    },
    subQuestion: function ($li) {
        var s = $li.find('.score').html();
        var t = $li.closest('.test_content_nr').attr("type");
        var id = $li.attr('id');
        switch (t) {
            case 'radio':
                question_radio.splice(question_radio.indexOf(id), 1);
                radio_score -= s;
                break;
            case 'checkBox':
                question_checkBox.splice(question_checkBox.indexOf(id), 1);
                checkBox_score -= s;
                break;
        }
        $li.remove();
        methods.flash();
    },
    flash: function () {
        $("#total_radio").html(question_radio.length);
        $("#total_radio_score").html(radio_score);
        $("#total_checkBox").html(question_checkBox.length);
        $("#total_checkBox_score").html(checkBox_score);

        $('.test_content_nr').each(function () {
            $(this).find('.question').each(function (i) {
                $(this).find('.index').html(i+"")
            })
        });
        if (question_checkBox.length == 0) $('.test_content_title').eq(1).hide();
        else $('.test_content_title').eq(1).show();
        if (question_radio.length == 0) $('.test_content_title').eq(0).hide();
        else  $('.test_content_title').eq(0).show();
    },
    seach: function () {
        var a = $('#show_tbody tr');
        var search = $('#Ktext').val().trim();
        var type = $('#Ktype').val().trim();
        if (search == '') {
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
    checkSubmit: function () {
        if(question_checkBox.length+question_radio.length==0){
            bootbox.alert({
                title: "error",
                message: "无法创建空试卷",
                closeButton: false
            });
            nameError = true;
            return false;
        }
        if ($('#newPaper .paper_name').val().trim() === '') {
            bootbox.alert({
                title: "error",
                message: "请填写试卷名",
                closeButton: false
            });
            nameError = true;
            return false;
        }
        return true;
    },

};
