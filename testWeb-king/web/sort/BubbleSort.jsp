<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/20
  Time: 下午5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>冒泡排序算法</title>
    <meta charset="UTF-8">
    <style>
        #boxes{
            border:1px solid grey;
            width:1320px;
            height:300px;
            margin-top:10px;
            position:relative;
        }
        .box{
            background:red;
            width:20px;
            line-height:30px;
            text-align:center;
            font-family:Microsoft Yahei;
            font-size:15px;
            color:white;
            margin:0 1px;
            position:absolute;
        }
    </style>

    <script src="https://d3js.org/d3.v5.min.js" charset="utf-8"></script>

    <script language="JavaScript" type="text/javascript">

        function runBubbleSort(){
            let course = document.getElementById("course");

            let a = document.getElementById("sortData").value;
            let data = new Array(20);
            let arr = new Array();
            data = a.split(",");
            console.log(data);
            let len = data.length;
            for (let i = 0; i < len; i++){
                arr[i] = parseInt(data[i]); //将字符串数组转化为数字数组
                // let divElement = document.createElement("div");
                // let parentElement = document.getElementById("boxes");
                // divElement.style.left = i * 20 + i * 2 + "px";
                // divElement.style.top = 300 - 3 * arr[i] + "px";
                // divElement.style.height = 3 * arr[i] + "px";
                // divElement.setAttribute("class","box");
                // parentElement.appendChild(divElement);
            }
            console.log(arr);
            bubbleSort(arr);
            // sort(arr);
        }

        function sort(numbers){
            let parentElement = document.getElementById("boxes");
            let i = 0, j = 0;
            let time = setInterval(function() {
                if (i < numbers.length) {
                    if (j < numbers.length - i) {
                        if (numbers[j] > numbers[j + 1]) {
                            let temp = numbers[j];
                            numbers[j] = numbers[j + 1];
                            numbers[j + 1] = temp;
                            parentElement.innerHTML = "";
                            for (let k = 0; k < numbers.length; k++) {
                                let textNode = document.createTextNode(numbers[k]);
                                let divElement = document.createElement("div");
                                divElement.appendChild(textNode);
                                divElement.style.left = k * 20 + k * 2 + "px";
                                divElement.style.top = 300 - 3 * numbers[k] + "px";
                                divElement.style.height = 3 * numbers[k] + "px";
                                divElement.setAttribute("class","box");
                                parentElement.appendChild(divElement);
                            }
                        }
                        j++;
                    }
                    else{
                        i++;
                        j = 0;
                    }
                }
                else {
                    clearInterval(time);
                    return;
                }
            }, 100);
        }
    </script>
</head>

<body>

    请输入N个正整数
    <input id="sortData" type="text">
    <button onclick="runBubbleSort()">执行</button>

    <%--<div id="boxes"></div>--%>
    <svg width="960" height="600"></svg>
<script>
    function draw(dataset) {
        let marge = {top:60,bottom:20,left:60,right:60};

        let svg = d3.select("svg");//得到SVG画布
        let width = svg.attr("width");//得到画布的宽
        let height = svg.attr("height");//得到画布的长
        let g = svg.append("g")
            .attr("transform","translate("+marge.top+","+marge.left+")");

        console.log("得到："+dataset);

        let xScale = d3.scaleBand()
            .domain(d3.range(dataset.length))
            .rangeRound([0,width-marge.left-marge.right]);
        let xAxis = d3.axisBottom(xScale);

        let yScale = d3.scaleLinear()
            .domain([0,d3.max(dataset)])
            .range([height-marge.top-marge.bottom,0]);
        let yAxis = d3.axisLeft(yScale);

        g.append("g")
            .attr("transform","translate("+0+","+(height-marge.top-marge.bottom)+")")
            .call(xAxis);
        g.append("g")
            .attr("transform","translate(0,0)")
            .call(yAxis);

        //绘制矩形和文字
        let gs = g.selectAll(".rect")
            .data(dataset)
            .enter()
            .append("g");

        //绘制矩形
        let rectPadding = 20;//矩形之间的间隙
        gs.append("rect")
            .attr("x",function(d,i){
                return xScale(i)+rectPadding/2;
            })
            .attr("y",function(d){
                return yScale(d);
            })
            .attr("width",function(){
                return xScale.step()-rectPadding;
            })
            .attr("height",function(d){
                return height-marge.top-marge.bottom-yScale(d);
            })
            .attr("fill","blue")

        //绘制文字
        gs.append("text")
            .attr("x",function(d,i){
                return xScale(i)+rectPadding/2;
            })
            .attr("y",function(d){
                return yScale(d);
            })
            .attr("dx",function(){
                (xScale.step()-rectPadding)/2;
            })
            .attr("dy",20)
            .text(function(d){
                return d;
            })
    }

    function bubbleSort(arr) {
        console.log("hhh:"+arr);
        let len = arr.length;
        let temp;
        let svg = d3.select("svg");//得到SVG画布
        draw(arr);

        for(let i = 0; i < len; i++){
            for(let j = 0; j < len - i - 1; j++){
                if(arr[j] > arr[j+1]){
                    temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                    setTimeout(function(){
                        svg.html("");
                        draw(arr);
                    },1000);
                }
            }
        }
        return arr;
    }

</script>
</body>
</html>
