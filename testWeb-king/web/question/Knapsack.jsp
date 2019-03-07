<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/28
  Time: 下午8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>0/1背包问题</title>

    <script language="JavaScript" type="text/javascript">
        function runKnapsack() {
            var maxWeight = document.getElementById("maxWeight").value;
            var weight = document.getElementById("weight").value;
            var thevalue = document.getElementById("theValue").value;
            var weightsString = new Array();
            var valuesString = new Array();
            weightsString = weight.split(",");
            valuesString = thevalue.split(",");
            var len1 = weightsString.length;
            var len2 = valuesString.length;
            var weights = new Array();
            var values = new Array();

            var visit = new Array();
            for(var i = 0; i < len1; i++){
                visit[i] = false;
            }
            var currWeight = 0;
            var seq = new Array();

            if (maxWeight == ""){
                console.log("请输入背包的最大承重");
            } else if (len1 != len2){
                console.log("物品应同时拥有重量和价值，请重新输入重量和价值序列");
            } else {
                console.log(len1 + "---" + len2);
                console.log("背包最大承重为：" + maxWeight);
                console.log("重量为：" + weights);
                console.log("价值为：" + values);

                for (var i = 0; i < len1; i++){
                    weights[i] = parseInt(weightsString[i]); //将字符串数组转化为数字数组
                    values[i] = parseInt(valuesString[i]);
                }

                knapsack(maxWeight, weights, values, visit, currWeight, seq);
            }
        }

        function knapsack(maxWeight, weights, values, visit, currWeight, seq) {
            for(var i = 0; i < weights.length; i++){
                if(!visit[i]){
                    if (currWeight + weights[i] > maxWeight)
                        continue;
                    visit[i] = true;
                    seq.push(i);		//将当前步加入到序列中
                    // currWeight = currWeight + weights[i];
                    knapsack(maxWeight, weights, values, visit, (currWeight + weights[i]), seq);		//基于当前状态深度遍历
                    seq.pop();		//从序列中删除
                    visit[i] = false;
                }
            }

            outputResult(weights, values, visit, currWeight, seq);
            // return ;

        }

        function outputResult(weights, values, visit, currWeight, seq) {
            console.log("当前背包的重量为：" + currWeight);
            var sumVal = 0;
            for(var i = 0 ; i < weights.length; i++){
                if (visit[i]){
                    sumVal = sumVal + values[i];
                }
            }
            console.log("当前背包的总价值为：" + sumVal);
            console.log("当前结果集（编号）为：" + seq);
            console.log("------------------------------------------");
        }
    </script>
</head>
<body>
<div>
    请输入背包的最大承重：
    <input id="maxWeight" type="text"><br>
    请输入物品的重量序列：
    <input id="weight" type="text"><br>
    请输入物品的价值序列：
    <input id="theValue" type="text"><br>
    <button onclick="runKnapsack()">执行</button>

    <p id="result"></p>
</div>
</body>
</html>
