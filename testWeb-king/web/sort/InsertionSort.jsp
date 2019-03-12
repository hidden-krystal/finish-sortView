<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/25
  Time: 下午6:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入排序算法</title>

    <script language="JavaScript" type="text/javascript">
        function runInsertionSort() {
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

            for (var i = 1; i < len; i++) {
                var key = arr[i];
                var j = i - 1;
                while ( arr[j] > key) {
                    arr[j + 1] = arr[j];
                    j--;
                }
                arr[j + 1] = key;
                console.log("第" + i + "趟的结果为：" + arr);
            }

            console.log("最终结果为：" + arr);
            document.getElementById("result").innerText=("最终结果为:"+arr);


        }
    </script>
</head>

<body>
    请输入N个正整数
    <input id="sortData" type="text">
    <button onclick="runInsertionSort()">执行</button>

    <p id="result"></p>
</body>
</html>
