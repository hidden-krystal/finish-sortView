<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/28
  Time: 下午4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>顺序查找</title>
    
    <script language="JavaScript" type="text/javascript">
        function runSeqSearch() {
            var a = document.getElementById("searchData").value;
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
                seqSearch(arr,key);
            }
            // console.log("最终结果为：" + result);

        }

        function seqSearch(arr, data) {

            var array = arr;
            var key = data;
            var flag = false;
            var locate = new Array();

            for(var i = 0; i < array.length; i++){
                if(array[i] == key){
                    locate.push(i);
                    flag = true;
                }
            }
            if(!flag){
                console.log("没有找到这个数");
                document.getElementById("result").innerText=("没有找到这个数");
            }else {
                console.log("找到了这个数，下标是：" + locate);
                document.getElementById("result").innerText=("找到了这个数，下标是：" + locate);
            }
        }
    </script>
</head>
<body>
<div>
    请输入N个正整数
    <input id="searchData" type="text">
    <br><br>
    请输入需要查找的数字
    <input id="keyword" type="text">
    <button onclick="runSeqSearch()">执行</button>

    <p id="result"></p>
</div>
</body>
</html>
