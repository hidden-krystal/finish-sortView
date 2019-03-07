<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/27
  Time: 下午6:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>归并排序算法</title>

    <script language="JavaScript" type="text/javascript">
        function runMergeSort() {
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

            var theEnd = mergeSort(arr);

            console.log("最终结果为：" + theEnd);
            document.getElementById("result").innerText=("最终结果为:"+theEnd);

        }

        function mergeSort(arr) { //采用自上而下的递归方法
            var len = arr.length;
            if(len < 2) {
                return arr;
            }
            var middle = Math.floor(len / 2),  //向下取整
                left = arr.slice(0, middle),  //从已有的数组中返回选定的元素。
                right = arr.slice(middle);
            return merge(mergeSort(left), mergeSort(right));
        }

        function merge(left, right){
            var result = [];
            // console.time('归并排序耗时');
            while (left.length && right.length) {
                if (left[0] <= right[0]) {
                    result.push(left.shift()); //shift()方法用于把数组的第一个元素从其中删除，并返回第一个元素的值。
                } else {
                    result.push(right.shift());
                }
            }

            while (left.length){
                result.push(left.shift());
            }
            while (right.length){
                result.push(right.shift());
            }
            // console.timeEnd('归并排序耗时');
            return result;
        }

    </script>
</head>
<body>
    请输入N个正整数
    <input id="sortData" type="text">
    <button onclick="runMergeSort()">执行</button>

    <p id="result"></p>
</body>
</html>
