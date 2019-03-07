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
    <title>希尔排序算法</title>

    <script language="JavaScript" type="text/javascript">
        function runShellSort() {
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

            var result = shellSort(arr);

            console.log("最终结果为：" + result);
            document.getElementById("result").innerText=("最终结果为:"+result);
        }

        function shellSort(arr) {
            var len = arr.length,
                temp,
                gap = 1;
            // console.time('希尔排序耗时:');
            while(gap < len/5) { //动态定义间隔序列
                gap =gap*5+1;
            }
            for (gap; gap > 0; gap = Math.floor(gap/5)) {
                for (var i = gap; i < len; i++) {
                    temp = arr[i];
                    for (var j = i-gap; j >= 0 && arr[j] > temp; j-=gap) {
                        arr[j+gap] = arr[j];
                    }
                    arr[j+gap] = temp;
                    console.log("过程为：" + arr);
                }
            }

            // console.timeEnd('希尔排序耗时:');
            return arr;
        }
    </script>
</head>
<body>
    请输入N个正整数
    <input id="sortData" type="text">
    <button onclick="runShellSort()">执行</button>

    <p id="result"></p>
</body>
</html>
