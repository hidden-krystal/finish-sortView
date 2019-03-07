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
    <title>基数排序算法</title>

    <script language="JavaScript" type="text/javascript">


        /**
         * /**
         * 基数排序适用于：
         * (1)数据范围较小，建议在小于100
         * (2)每个数值都要大于等于0
         * @author damonare
         * @param arr 待排序数组
         * @param maxDigit 最大位数
         */
        function runRadixSort() {
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

            var result = radixSort(arr, 2);

            console.log("最终结果为：" + result);
            document.getElementById("result").innerText=("最终结果为:"+result);
        }

        function radixSort(arr, maxDigit) {
            var mod = 10;
            var dev = 1;
            var counter = [];
            console.time('基数排序耗时');
            for (var i = 0; i < maxDigit; i++, dev *= 10, mod *= 10) {
                for(var j = 0; j < arr.length; j++) {
                    var bucket = parseInt((arr[j] % mod) / dev);
                    if(counter[bucket]== null) {
                        counter[bucket] = [];
                    }
                    counter[bucket].push(arr[j]);
                }
                var pos = 0;
                for(var j = 0; j < counter.length; j++) {
                    var value = null;
                    if(counter[j]!=null) {
                        while ((value = counter[j].shift()) != null) {
                            arr[pos++] = value;
                        }
                    }
                }
            }
            console.timeEnd('基数排序耗时');
            return arr;
        }
    </script>
</head>
<body>
    请输入0-99内的正整数
    <input id="sortData" type="text">
    <button onclick="runRadixSort()">执行</button>

    <p id="result"></p>
</body>
</html>
