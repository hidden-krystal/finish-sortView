<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/27
  Time: 下午6:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>快速排序算法</title>

    <script language="JavaScript" type="text/javascript">
         function runQuickSort() {
             var a = document.getElementById("sortData").value;
             var data = new Array(20);
             var arr = new Array();
             data = a.split(",");
             console.log(data);
             var len = data.length;
             for (var i = 0; i < len; i++){
                 arr[i] = parseInt(data[i]); //将字符串数组转化为数字数组
             }
             console.log(arr);
             console.log("长度为："+len);

             var result = quickSort(arr);

             console.log("最终结果为：" + result);
             document.getElementById("result").innerText=("最终结果为:"+result);
         }
         
         function quickSort(arr) {
             if (arr.length <= 1) {
                 return arr;
             }
             var pivotIndex = Math.floor(arr.length / 2);
             var pivot = arr.splice(pivotIndex, 1)[0]; //splice() 方法向/从数组中添加/删除项目，然后返回被删除的项目。该方法会改变原始数组。
             console.log(pivot);
             var left = [];
             var right = [];
             for (var i = 0; i < arr.length; i++){
                 if (arr[i] < pivot) {
                     left.push(arr[i]);
                 } else {
                     right.push(arr[i]);
                 }
             }
             return quickSort(left).concat([pivot], quickSort(right)); //concat()方法用于连接两个或多个数组。
         }
    </script>
</head>

<body>
    请输入N个正整数
    <input id="sortData" type="text">
    <button onclick="runQuickSort()">执行</button>

    <p id="result"></p>
</body>
</html>
