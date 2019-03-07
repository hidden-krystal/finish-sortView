<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/27
  Time: 下午7:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>堆排序算法</title>
    <script language="JavaScript" type="text/javascript">
        function runHeapSort() {
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

            var result = heapSort(arr);

            console.log("最终结果为：" + result);
            document.getElementById("result").innerText=("最终结果为:"+result);
        }

        function heapSort(array) {
            // console.time('堆排序耗时');
            //建堆
            var heapSize = array.length, temp;
            for (var i = Math.floor(heapSize / 2) - 1; i >= 0; i--) {
                heapify(array, i, heapSize);
            }
            //堆排序
            for (var j = heapSize - 1; j >= 1; j--) {
                temp = array[0];
                array[0] = array[j];
                array[j] = temp;
                console.log("过程1为：" + array);
                heapify(array, 0, --heapSize);
            }
            // console.timeEnd('堆排序耗时');
            return array;
        }
        function heapify(arr, x, len) {
            var l = 2 * x + 1, r = 2 * x + 2, largest = x, temp;
            if (l < len && arr[l] > arr[largest]) {
                largest = l;
            }
            if (r < len && arr[r] > arr[largest]) {
                largest = r;
            }
            if (largest != x) {
                temp = arr[x];
                arr[x] = arr[largest];
                arr[largest] = temp;
                console.log("过程2为：" + arr);
                heapify(arr, largest, len);
            }
        }
    </script>
</head>
<body>
    请输入N个正整数
    <input id="sortData" type="text">
    <button onclick="runHeapSort()">执行</button>

    <p id="result"></p>
</body>
</html>
