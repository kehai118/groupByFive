<%--
  Created by IntelliJ IDEA.
  User: kehai
  Date: 2019/11/21
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>examHistory</title>
    <%@include file="/WEB-INF/commonRel.jsp"%>
</head>
<body>
<%@include file="/WEB-INF/autoTable.jsp"%>
<style>
    h2{
        text-align: center;
        margin: 0.8em auto;
        font-family: 华文楷体;
    }
</style>
<h2>考试历史</h2>
<div <%--ng-app="app"--%> ng-controller="ctrl" >
    <style>
        .panel{width:60%;margin:0 auto;text-align: center;}
        .form-inline{width:60%;margin:0 auto;}
    </style>
    <div class="panel">
        <div class="row req form-inline">
            <div class="col-md-8 col-md-offset-4 solid_top form-group">
                <div class="pull-right">
                    <label>展示条数:
                        <select  class="form-control" ng-change="change(selectedLimit)" ng-model="selectedLimit" ng-options="value.limit for value in values"></select>
                    </label>
                </div>
            </div>
        </div>
        <table class="table" id="table">
            <thead>
            <tr>
                <th class="header">试卷名称</th>
                <th class="header">姓名</th>
                <th class="header">教师</th>
                <th class="header">所属班级</th>
                <th class="header">成绩</th>
                <th class="header">评价</th>
                <th class="header">创建日期</th>
            </tr>
            </thead>
            <tbody>
            <tr  ng-repeat="data in datas" data-src="{{data.id}}">
                <td>{{data.name}}</td>
                <td>{{data.user}}</td>
                <td>{{data.teacher}}</td>
                <td>{{data.group}}</td>
                <td>{{data.score}}</td>
                <td>{{data.appraise}}</td>
                <td>{{data.createTime}}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row form-inline">
        <div class="col-md-8">
            <uib-pagination
                    total-items="page.totalCount"
                    ng-model="page.pageNo"
                    max-size="5"
                    class="samplePage pagination"
                    boundary-links="true"
                    force-ellipses="false"
                    first-text="首页"
                    last-text="末页"
                    previous-text="上一页"
                    next-text="下一页"
                    items-per-page="page.limit"
                    ng-change="pageChanged()"
                    boundary-link-numbers="true"
            >
            </uib-pagination>
        </div>
        <div class="col-md-4">
            <input type="text" class="form-control" style="width:100px;margin:25px 0" name="" ng-model="go" />
            <a class="btn btn-primary btn-sm" ng-click="setPage(go)">跳转</a>
        </div>
    </div>
    <script type="text/javascript">

        $(function ($) {
            var pageApp = angular.module("app",['ui.bootstrap']);
            pageApp.controller("ctrl",function($scope, $http){
                //取回结果
                var response= ${result};
                //总条数
                $scope.total =response.length;
                //反转函数转化abcd转dcba
                $scope.data = response;
                //选择显示的条数
                $scope.values = [{"limit":3},{"limit":4},{"limit":5},{"limit":6},{"limit":7},{"limit":8},{"limit":response.length}];
                //默认显示的条数
                $scope.selectedLimit=$scope.values[3];
                //默认显示当前页数
                $scope.currentPage = 2;
                if($scope.data != null){
                    $scope.datas = $scope.data.slice($scope.selectedLimit.limit*($scope.currentPage-1),$scope.selectedLimit.limit*$scope.currentPage);
                }else{
                    alert($scope.data);
                }
                $scope.page = {
                    "limit":$scope.selectedLimit.limit,"pageSize":5,"pageNo":$scope.currentPage,"totalCount":$scope.total};

                $scope.change = function(selectedLimit){
                    $scope.page.limit = selectedLimit.limit;
                    $scope.datas = $scope.data.slice($scope.selectedLimit.limit*($scope.page.pageNo-1),$scope.selectedLimit.limit*$scope.page.pageNo);
                    $("#table").trigger("update");
                };
                $scope.pageChanged = function(){
                    $scope.page.limit = $scope.selectedLimit.limit;
                    $scope.datas = $scope.data.slice($scope.selectedLimit.limit*($scope.page.pageNo-1),$scope.selectedLimit.limit*$scope.page.pageNo);
                    $("#table").trigger("update");
                };
                $scope.setPage = function (go) {
                    $scope.length = Math.ceil($scope.total/$scope.selectedLimit.limit);
                    if(go > $scope.length){
                        $scope.page.pageNo =  $scope.length;
                    }else{
                        $scope.page.pageNo=go;
                    }
                    $scope.datas = $scope.data.slice($scope.selectedLimit.limit*($scope.page.pageNo-1),$scope.selectedLimit.limit*$scope.page.pageNo);
                    $("#table").trigger("update");
                };
                $scope.setPage(1);
            });

            angular.element(document).ready(function() {
                angular.bootstrap(document, ['app']);
            });

            $('#table').basictable();

            //单页面排序只需要这个就可以了
            $("#table").tablesorter();
            //ajax或分页后需要执行update`

            $('tbody').on('dblclick','tr',function () {
                window.location.href="/exam/checkExam?examId="+$(this).attr('data-src');
            });
            
        })
    </script>

    <style>

        @media only screen and (max-width: 568px) {
            #table tr td:first-of-type,
            #table tr:nth-of-type(2n+2) td:first-of-type,
            #table tr td:first-of-type:before {
                background-color: #56a2cf;
                color: #ffffff;
            }

            #table tr td:first-of-type {
                border-bottom: 1px solid #e4ebeb;
            }
        }

        #table thead tr th{
            background-color: #56a2cf;
        }

        table tr:nth-of-type(2n+2) td{
            background: #EAF3F5;
        }

        table tr:nth-of-type(2n+1) td {
            background: #ffffff;
        }
    </style>
</div>
<%@include file="/Menu.jsp"%>
</body>
</html>
