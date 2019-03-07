<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/3/6
  Time: 上午10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>约瑟夫斯问题</title>

    <script language="JavaScript" type="text/javascript">

        function runJosephus() {
            var a = document.getElementById("data").value;
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

            var key = document.getElementById("keyword").value;

            if(arr == null || key == ""){
                alert("数字序列或关键数字不应为空！！！");
                console.log("数字序列或关键数字不应为空！！！");
            }else{
                var res = josephus(arr,key);
                // if(res != -1){
                //     document.getElementById("result").innerText=("找到了这个数，下标是：" + res);
                // }else {
                //     document.getElementById("result").innerText=("没有找到这个数");
                // }
            }
        }

        function josephus(arr, m) {
            var Obj = function (index, value, next) {
                this.index = index;
                this.value = value;
                this.next = next;
            };
            var arrlen = arr.length;
            var n;
            for (var i = 0; i < arrlen; i++) {
                arr[i] = new Obj(i + 1, arr[i]);
            }
            for (var i = 0; i < arrlen; i++) {
                if (i >= arr.length - 1) {
                    arr[i].next = arr[0];
                } else {
                    arr[i].next = arr[i + 1];
                }
            }
            for (var i = 0; i < arrlen; i++) {
                for (var j = 0; j < m - 1; j++) {
                    n = n ? n : arr[0];
                    n = n.next;
                }
                m = n.value;
                console.log(n.index);
                for (var j = 0; j < arr.length; j++) {
                    if (arr[j] == n) {
                        if (j == 0) {
                            arr[arr.length - 1].next = n.next;
                        } else {
                            arr[j - 1].next = n.next;
                        }
                        n = n.next;
                        arr.splice(j,1)
                        break;
                    }
                }
            }
        }


    </script>
</head>
<body>
    请输入N个正整数
    <input id="data" type="text">
    <br><br>
    请输入关键字
    <input id="keyword" type="text">
    <button onclick="runJosephus()">执行</button>

    <p id="result"></p>
</body>
</html>
