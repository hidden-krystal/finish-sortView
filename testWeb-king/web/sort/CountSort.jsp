<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/24
  Time: 下午7:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>计数排序算法</title>

    <script language="JavaScript" type="text/javascript">
        function runCountSort() {
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

            var result = countSort(arr);

            console.log("最终结果为：" + result);
            document.getElementById("result").innerText=("最终结果为:"+result);
        }

        // function countSort(array) {
        //     var len = array.length,
        //         B = [],
        //         C = [],
        //         min = max = array[0];
        //     // console.time('计数排序耗时');
        //     for (var i = 0; i < len; i++) {
        //         min = min <= array[i] ? min : array[i];
        //         max = max >= array[i] ? max : array[i];
        //         C[array[i]] = C[array[i]] ? C[array[i]] + 1 : 1;
        //         console.log(C)
        //     }
        //
        //     // 计算排序后的元素下标
        //     for (var j = min; j < max; j++) {
        //         C[j + 1] = (C[j + 1] || 0) + (C[j] || 0);
        //         console.log(C)
        //     }
        //     for (var k = len - 1; k >= 0; k--) {
        //         B[C[array[k]] - 1] = array[k];
        //         C[array[k]]--;
        //         console.log(B)
        //     }
        //     // console.timeEnd('计数排序耗时');
        //     return B;
        // }

        function countSort(array) {
            var len = array.length,
                B = [],
                C = [],
                min = max = array[0];
            console.time('计数排序耗时');
            for (var i = 0; i < len; i++) {
                min = min <= array[i] ? min : array[i];
                max = max >= array[i] ? max : array[i];
                C[array[i]] = C[array[i]] ? C[array[i]] + 1 : 1;
            }
            for (var k = 0; k <len; k++) {
                var length = C[k];
　　　　         for(var m = 0 ;m <length ; m++){
                    B.push(k);
                }
            }
            console.timeEnd('计数排序耗时');
            return B;
        }

    </script>
</head>
<body>
    请输入N个正整数
    <input id="sortData" type="text">
    <button onclick="runCountSort()">执行</button>

    <p id="result"></p>
</body>
</html>
