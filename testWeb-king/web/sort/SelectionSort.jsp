<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/28
  Time: 下午5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选择排序算法</title>
    <script language="JavaScript" type="text/javascript">
        function runSelectionSort() {

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

            var minIndex,temp;

            for(i=0;i<len-1;i++){
                minIndex=i;
                for(j=i+1;j<len;j++){
                    if(arr[j]<arr[minIndex]){
                        minIndex=j;
                    }
                }
                temp=arr[i];
                arr[i]=arr[minIndex];
                arr[minIndex]=temp;

                var count = i + 1;
                console.log("第"+count+"趟的结果为"+arr);
            }

            console.log("最终结果为:"+arr);
            document.getElementById("result").innerText=("最终结果为:"+arr);
            return arr;

        }
    </script>
</head>

<body>
    请输入N个正整数
    <input id="sortData" type="text">
    <button onclick="runSelectionSort()">执行</button>

    <p id="result"></p>
</body>
</html>
