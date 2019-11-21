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
    <title>table</title>
    <%@include file="/WEB-INF/commonRel.jsp"%>
</head>
<body>
<div ng-app="app" ng-controller="ctrl">
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
            <<%--thead>
            <tr>
                &lt;%&ndash;<td>序号</td>
                <td>模块</td>
                <td>信息</td>
                <td>时间</td>&ndash;%&gt;
                <c:forEach items="${th}" var="td">
                    <td>${td}</td>>
                </c:forEach>
            </tr>
            </thead>
            <tbody>
            <tr  ng-repeat="data in datas">
                &lt;%&ndash;<td>{{data.order}}</td>
                <td>{{data.module}}</td>
                <td>{{data.message}}</td>
                <td>{{data.time}}</td>&ndash;%&gt;
                <c:forEach items="${tr}" var="td">
                    <td>{{data.${td}}}</td>
                </c:forEach>
            </tr>
            </tbody>--%>
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
        var pageApp = angular.module("app",['ui.bootstrap']);
        pageApp.controller("ctrl",function($scope, $http){
            //总条数
            $scope.total = ${result};
            //反转函数转化abcd转dcba
            $scope.data = response.data.reverse();
            //选择显示的条数
            $scope.values = [{"limit":3},{"limit":4},{"limit":5},{"limit":6},{"limit":7},{"limit":8}];
            //默认显示的条数
            $scope.selectedLimit=$scope.values[0];
            //默认显示当前页数
            $scope.currentPage = 1;
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
            };
            $scope.pageChanged = function(){
                $scope.page.limit = $scope.selectedLimit.limit;
                $scope.datas = $scope.data.slice($scope.selectedLimit.limit*($scope.page.pageNo-1),$scope.selectedLimit.limit*$scope.page.pageNo);
            };
            $scope.setPage = function (go) {
                $scope.length = Math.ceil($scope.total/$scope.selectedLimit.limit);
                console.log($scope.length);
                if(go > $scope.length){
                    $scope.page.pageNo =  $scope.length;
                    console.log($scope.length);

                }else{
                    $scope.page.pageNo=go;
                }
                $scope.datas = $scope.data.slice($scope.selectedLimit.limit*($scope.page.pageNo-1),$scope.selectedLimit.limit*$scope.page.pageNo);
            };
        });

    </script>

    <style>
        #table tr td:first-of-type {
            background: #dff1f7;

        }

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
    </style>

    <script>
        $('#table').basictable();

        /*//单页面排序只需要这个就可以了
        $("#table").tablesorter();*/
        //ajax或分页后需要执行update
        $("#table").trigger("update");

    </script>
</div>
</body>
</html>
