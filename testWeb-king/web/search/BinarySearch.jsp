<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/3/4
  Time: 上午10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>二分查找算法</title>
    <script language="JavaScript" type="text/javascript">
        function runBinarySearch() {
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
                var res = binarySearch(arr,key);
                if(res != -1){
                    document.getElementById("result").innerText=("找到了这个数，下标是：" + res);
                }else {
                    document.getElementById("result").innerText=("没有找到这个数");
                }
            }
        }

        function binarySearch(arr,target) {
            var start   = 0;
            var end     = arr.length-1;

            while (start<=end){
                var mid = parseInt(start+(end-start)/2);
                if(target==arr[mid]){
                    console.log("找到了这个数，下标是：" + mid);
                    return mid;
                }else if(target>arr[mid]){
                    start   = mid+1;
                }else{
                    end     = mid-1;
                }
            }
            return -1;
        }
    </script>
</head>
<body>
    请输入N个正整数
    <input id="searchData" type="text">
    <br><br>
    请输入需要查找的数字
    <input id="keyword" type="text">
    <button onclick="runBinarySearch()">执行</button>

    <p id="result"></p>
</body>
</html>
