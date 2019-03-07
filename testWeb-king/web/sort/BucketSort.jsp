<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/27
  Time: 下午7:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>桶排序算法</title>

    <script language="JavaScript" type="text/javascript">
        function runBucketSort() {
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

            var result = bucketSort(arr , 2);

            console.log("最终结果为：" + result);
            document.getElementById("result").innerText=("最终结果为:"+result);
        }

        function bucketSort(array, num) {
            if (array.length <= 1) {
                return array;
            }
            var len = array.length, buckets = [], result = [], min = max = array[0], space, n = 0;

            var index = Math.floor(len / num) ;
            while(index<2){

                num--;
                index = Math.floor(len / num) ;
            }

            console.time('桶排序耗时');
            for (var i = 1; i < len; i++) {
                min = min <= array[i] ? min : array[i];
                max = max >= array[i] ? max : array[i];
            }
            space = (max - min + 1) / num;  //步长
            for (var j = 0; j < len; j++) {
                var index = Math.floor((array[j] - min) / space);
                if (buckets[index]) { // 非空桶，插入排序
                    var k = buckets[index].length - 1;
                    while (k >= 0 && buckets[index][k] > array[j]) {
                        buckets[index][k + 1] = buckets[index][k];
                        k--;
                    }
                    buckets[index][k + 1] = array[j];
                } else { //空桶，初始化
                    buckets[index] = [];
                    buckets[index].push(array[j]);
                }
            }
            while (n < num) {
                result = result.concat(buckets[n]);
                n++;
            }
            console.timeEnd('桶排序耗时');
            return result;
        }
    </script>
</head>
<body>
    请输入N个正整数
    <input id="sortData" type="text">
    <button onclick="runBucketSort()">执行</button>

    <p id="result"></p>
</body>
</html>
