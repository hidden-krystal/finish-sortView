<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/3/9
  Time: 上午9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>D3.js学习</title>
    <script src="https://d3js.org/d3.v5.min.js" charset="utf-8"></script>
</head>
<body>
<svg width="960" height="600"></svg>
<script>
    var marge = {top:60,bottom:60,left:60,right:60}
    var svg = d3.select("svg");//得到SVG画布
    var width = svg.attr("width");//得到画布的宽
    var height = svg.attr("height");//得到画布的长
    var g = svg.append("g")
        .attr("transform","translate("+marge.top+","+marge.left+")");

    var dataset = [10,20,30,23,13,40,27,35,20];

    var xScale = d3.scaleBand()
        .domain(d3.range(dataset.length))
        .rangeRound([0,width-marge.left-marge.right]);
    var xAxis = d3.axisBottom(xScale);

    var yScale = d3.scaleLinear()
        .domain([0,d3.max(dataset)])
        .range([height-marge.top-marge.bottom,0]);
    var yAxis = d3.axisLeft(yScale);

    g.append("g")
        .attr("transform","translate("+0+","+(height-marge.top-marge.bottom)+")")
        .call(xAxis);
    g.append("g")
        .attr("transform","translate(0,0)")
        .call(yAxis);

    //绘制矩形和文字
    var gs = g.selectAll(".rect")
        .data(dataset)
        .enter()
        .append("g");

    //绘制矩形
    var rectPadding = 20;//矩形之间的间隙
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
        .on("mouseover",function(){
            var rect = d3.select(this)
                .transition()
                .duration(1500)
                .attr("fill","yellow");
        })
        .on("mouseout",function(){
            var rect = d3.select(this)
                .transition()
                .delay(1500)
                .duration(1500)
                .attr("fill","blue");
        })
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
</script>
</body>


</html>
