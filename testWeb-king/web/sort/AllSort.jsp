<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/3/5
  Time: 上午9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>排序</title>
    <!--<link href="index.css" rel="stylesheet" type="text/css"/> -->
    <style type="text/css">
        .container{  /*容器*/
            position: relative;  /*相对位置*/
            width: 800px;
            margin: 0 auto;
        }
        .control{
            margin-bottom: 20px;
        }
        .circle{
            margin: 0 auto;
            width: 50px;
            height: 50px;
        }
        input[type="number"]{
            width: 60px;
        }
        /*
        rect:hover{
            fill: #4169E1;
        } */
    </style>
</head>
<body>
<div class="container">
    <div class="control">
        数组长度:
        <input type="number" id="number">
        <input type="button" name="click" value="随机生成数组" id="getArr">
        <select id="order">
            <option>升序</option>
            <option>降序</option>
        </select>
        <select id="select">
            <option>冒泡排序</option>
            <option>直接插入排序</option>
            <option>希尔排序</option>
            <option>快速排序</option>
            <option>选择排序</option>
            <option>堆排序</option>
            <option>归并排序</option>
            <option>桶排序</option>
            <option>基数排序</option>
        </select>
        动画时间间隔(ms):
        <input type="number" value="1000" id="deley">
        <input type="button" name="click" value="开始排序" id="button">
    </div>
    <svg id="svg" width="800" height="500"></svg>
</div>

<script type="text/javascript">
    "use strict";//严格模式，通过严格模式，在函数内部选择进行较为严格的全局或局部的错误条件检测，可以提早知道代码中的存在的错误，
    (function(){
        let animation_flag = false;//正在执行动画
        //计算加入事件队列的时刻，与执行延时函数的次数，相等时表示动画执行完毕
        let show_count = 0,deley_count = 0;
        let deley_space = 1000;//动画延时间隔
        let select = document.getElementById("select");
        let button = document.getElementById("button");
        let orderSelect = document.getElementById("order");
        let getArrDom = document.getElementById("getArr");
        let numberDom = document.getElementById("number");
        let deleyDom = document.getElementById("deley");

        //随机生成指定长度，固定区间的数组
        let random = function(n,max,min){
            let arr = [];
            if(typeof max !== "number"||max<100){
                max = 100;
            }
            if(typeof min !== "number"){
                min = 0;
            }
            for(let i=0;i<n;i++){
                arr[i] = parseInt(Math.random()*(max-min+1))+min;
            }
            return arr;
        };

        //将数组用SVG显示数组
        let showArr = function(arr,m,n){
            let svg = document.getElementById("svg");
            let rectStr = "",textStr = "",lineStr = "";//矩形、文本和线的HTML字符串
            let height = svg.getAttribute("height"),width = svg.getAttribute("width");//画布宽高,SVG.getAttribute根据所提供的ID名来获得元素的属性值。
            let rectWidth = 0, rectHeight = 0, spaceWidth = 0;//矩形宽度、间隔宽度
            let margin_level = 20,margin_veticle = 40;//水平、垂直边距
            let maxValue = 0;
            rectWidth = (width-margin_level*2)/(arr.length)*0.6;
            spaceWidth = rectWidth*2/3;
            svg.innerHTML = "";

            let getMax = function(arr){
                let max = 0;
                for(let i=0;i<arr.length;i++){
                    if(max < arr[i]){
                        max = arr[i];
                    }
                }
                return max;
            };
            let getHeight = function(h){
                return (height-2*margin_veticle)*(h/maxValue);
            };
            maxValue = getMax(arr);

            //画线和数字
            for(let i=0;i<arr.length;i++){
                let cx = 0, cy = 0;//当前结点的定位像素坐标
                let color = "#51eaea";
                rectHeight = getHeight(arr[i]);
                cx = i * (spaceWidth + rectWidth) + margin_level;
                cy = height - rectHeight - margin_veticle;

                if(i===m){
                    color = "#837dff";
                }else if(i===n){
                    color = "#bf81ff";
                }
                if(i===m&&i===n){
                    color = "#ffd581";
                }
                let font_size = rectWidth/2>20?20:rectWidth/2; //数字显示字体大小
                rectStr += '<rect x="'+cx+'" y="'+cy+'" width="'+rectWidth+'" height="'+rectHeight+'" fill="'+color+'"/>';
                //lineStr += '<line x1="'+startcx+'" y1="'+startcy+'" x2="'+endcx+
                //	'" y2="'+endcy+'" style="stroke:#999;stroke-width:2" />';

                //矩形上数字
                textStr += '<text x="'+(cx+rectWidth/2)+'" y="'+(cy-6)+'" fill="#171717"  style="font-size:'+font_size+'pt;text-anchor: middle">'+arr[i]+'</text>';
                //坐标系下数字
                textStr += '<text x="'+(cx+rectWidth/2)+'" y="'+(height-25+font_size)+'" fill="#171717"  style="font-size:'+font_size+'pt;text-anchor: middle">'+(i+1)+'</text>';
            }
            lineStr += '<line x1="0" y1="0" x2="0" y2="'+(height-30)+'" style="stroke:#666;stroke-width:4" />'
                +'<line x1="0" y1="'+(height-margin_veticle+10)+'" x2="'+width+'" y2="'+(height-margin_veticle+10)+'" style="stroke:#666;stroke-width:2" />';
            svg.innerHTML = lineStr+rectStr+textStr;
        };
        //延时动画
        let showSort = function(arr,m,n){
            let array = [];
            for(let i=0;i<arr.length;i++){
                array[i] = arr[i];
            }
            let callback = function(array,m,n){
                animation_flag = true;
                showArr(array,m,n);
                deley_count++;
                if(deley_count>=show_count){
                    setTimeout(function(){
                        showArr(array);
                        animation_flag = false;//动画执行完毕
                        console.log("排序完成");
                        show_count=0;
                        deley_count=0;
                    },deley_space);
                }
            };
            setTimeout(callback,deley_space*show_count++,array,m,n);
        };
        //各种排序算法
        let Sort = function(){
            //判断是否为数组
            let isArray = function(arr){
                if(Object.prototype.toString.call(arr) === "[object Array]"){
                    return true;
                }else{
                    return false;
                }
            };
            //冒泡排序, arr:Array type：Boolean(true为升序，false为降序),默认为升序,showSort:排序可视化
            let bubbleSort = function(arr,type,showSort){
                //输入检测
                if(!isArray(arr)){
                    throw Error("the input of bubbleSort is not a array");
                    return;
                }
                //深拷贝，不改动输入数组
                let out = [];
                for(let i=0;i<arr.length;i++){
                    out[i] = arr[i];
                }
                //order==false为升序，否则为降序
                let order = type!==true?1:-1;
                for(let i=1;i<out.length;i++){
                    for(let j=0;j<out.length-i;j++){
                        if(typeof showSort === "function"){  //typeof操作符返回一个字符串，表示未经计算的操作数的类型。
                            showSort(out,j,j+1);
                        }
                        if(order*out[j] > order*out[j+1]){
                            let tem = out[j];
                            out[j] = out[j+1];
                            out[j+1] = tem;
                        }
                        if(typeof showSort === "function"){
                            showSort(out,null,null);
                        }
                    }
                }
                //console.log(out);
                return out;
            };
            //插入排序
            let insertSort = function(arr,type,showSort){
                //输入检测
                if(!isArray(arr)){
                    throw Error("the input of bubbleSort is not a array");
                    return;
                }
                //深拷贝，不改动输入数组
                let out = [];
                for(let i=0;i<arr.length;i++){
                    out[i] = arr[i];
                }
                //order==false为升序，否则为降序
                let order = type!==true?1:-1;
                for(let i=1;i<out.length;i++){
                    let temp = out[i];
                    for(let j=i-1;j>=0;j--){
                        if(order*out[j]>order*temp){
                            out[j+1] = out[j];
                            out[j] = temp;
                            if(typeof showSort === "function"){
                                showSort(out,j,null);
                            }
                        }else{
                            break;//找到比temp小的则跳出循环
                        }
                    }
                    out[j+1] = temp;//在比temp小的值后面插入temp值
                    if(typeof showSort === "function"){
                        showSort(out,j+1,j+1);
                    }
                }
                return out;
            }
            //希尔排序
            let shellSort = function(arr,type,showSort){
                //输入检测
                if(!isArray(arr)){
                    throw Error("the input of bubbleSort is not a array");
                    return;
                }
                //深拷贝，不改动输入数组
                let out = [];
                for(let i=0;i<arr.length;i++){
                    out[i] = arr[i];
                }
                //order==false为升序，否则为降序
                let order = type!==true?1:-1;
                let half = parseInt(out.length/2);
                for(let d=half;d>=1;d=parseInt(d/2) ){
                    for(let i=d;i<out.length;i++){
                        for(let j=i-d;j>=0;j-=d){
                            if(typeof showSort === "function"){
                                showSort(out,j,j+d);
                            }
                            if(order*out[j+d] < order*out[j]){
                                let tem = out[j+d];
                                out[j+d] = out[j];
                                out[j] = tem;
                            }
                            if(typeof showSort === "function"){
                                showSort(out,null,null);
                            }
                        }
                    }
                }
                return out;
            }
            //快速排序
            let quickSort = function(arr,type,showSort){
                //输入检测
                if(!isArray(arr)){
                    throw Error("the input of bubbleSort is not a array");
                    return;
                }
                //深拷贝，不改动输入数组
                let out = [];
                for(let i=0;i<arr.length;i++){
                    out[i] = arr[i];
                }
                //order==false为升序，否则为降序
                let order = type!==true?1:-1;
                //快速排序
                let quick = function(out,first,end){
                    if(first<end){
                        let i=first, j=end, temp=0;
                        //一个循环完成一趟扫描
                        while(i<j){
                            while(i<j&& order*out[i]< order*out[j]){
                                if(typeof showSort === "function"){
                                    showSort(out,i,j);
                                }
                                j--;
                            }
                            if(i<j){
                                if(typeof showSort === "function"){
                                    showSort(out,i,j);
                                }
                                temp = out[i];
                                out[i] = out[j];
                                out[j] = temp;
                                if(typeof showSort === "function"){
                                    showSort(out,null,null);
                                }
                                i++;
                            }
                            while(i<j&& order*out[i]<order*out[j]){
                                if(typeof showSort === "function"){
                                    showSort(out,j,i);
                                }
                                i++;
                            }
                            if(i<j){
                                if(typeof showSort === "function"){
                                    showSort(out,j,i);
                                }
                                temp = out[i];
                                out[i] = out[j];
                                out[j] = temp;
                                if(typeof showSort === "function"){
                                    showSort(out,null,null);
                                }
                                j--;
                            }
                        }
                        if(typeof showSort === "function"){
                            showSort(out,i,i);
                        }
                        quick(out,first,i-1);
                        quick(out,i+1,end);
                    }
                    return out;
                }

                return quick(out,0,out.length-1);
            }
            //选择排序
            let selectSort = function(arr,type,showSort){
                //输入检测
                if(!isArray(arr)){
                    throw Error("the input of bubbleSort is not a array");
                    return;
                }
                //深拷贝，不改动输入数组
                let out = [];
                for(let i=0;i<arr.length;i++){
                    out[i] = arr[i];
                }
                //order==false为升序，否则为降序
                let order = type!==true?1:-1;
                for(let i=0;i<out.length;i++){
                    let index = i;
                    for(let j=i;j<out.length;j++){
                        if(typeof showSort === "function"){
                            showSort(out,index,j);
                        }
                        if(order*out[j]<order*out[index]){
                            index = j;
                        }
                    }
                    let temp = out[i];
                    out[i] = out[index];
                    out[index] = temp;
                    if(typeof showSort === "function"){
                        showSort(out,null,null);
                    }
                }

                return out;
            }
            //堆排序
            let heapSort = function(arr,type,showSort){
                //输入检测
                if(!isArray(arr)){
                    throw Error("the input of bubbleSort is not a array");
                    return;
                }
                //深拷贝，不改动输入数组
                let out = [];
                for(let i=0;i<arr.length;i++){
                    out[i] = arr[i];
                };
                //order==false为升序，否则为降序
                let order = type!==true?1:-1;
                let len = out.length;
                //建立堆
                let sift = function(out, k, m){
                    let i = k, j = 2*k+1;
                    while(j <= m && j!=len){
                        if(j<m && out[j+1] && order*out[j]<order*out[j+1]){
                            j++;
                        }
                        if(order*out[i] > order*out[j]){
                            break;
                        }else{
                            if(typeof showSort === "function"){
                                showSort(out,i,j);
                            }
                            let temp = out[i];
                            out[i] = out[j];
                            out[j] = temp;
                            if(typeof showSort === "function"){
                                showSort(out,null,null);
                            }
                            i = j;
                            j = 2*i+1;
                        }
                    }
                };

                let half = parseInt(len/2);
                //初始建堆
                for(let i=half-1;i>=0;i--){
                    sift(out, i, len);
                }
                for(let i=0;i<len-1;i++){
                    if(typeof showSort === "function"){
                        showSort(out,0,len-1-i);
                    }
                    let temp = out[0];
                    out[0] = out[len-1-i];
                    out[len-1-i] = temp;
                    if(typeof showSort === "function"){
                        showSort(out,null,null);
                    }
                    sift(out, 0, len-1-i-1);
                }

                return out;
            }
            //归并排序
            let mergeSort = function(arr,type,showSort){
                //输入检测
                if(!isArray(arr)){
                    throw Error("the input of bubbleSort is not a array");
                    return;
                }
                //深拷贝，不改动输入数组
                let out = [];
                for(let i=0;i<arr.length;i++){
                    out[i] = arr[i];
                }
                let order = type!==true?1:-1;
                //一次归并算法
                let merge = function(out, array, s, m, t){
                    let i=s, j=m+1, k=s;//i:左边数组的索引，j:右边数组的索引，k:归并结果数组的索引
                    //没有数组遍历完
                    while(i<=m && j<=t){
                        if(order*out[i]<order*out[j]){
                            if(typeof showSort === "function"){
                                showSort(array,i,j);
                            }
                            array[k++] = out[i++];
                            if(typeof showSort === "function"){
                                showSort(array,k-1,k-1);
                            }
                        }else{
                            if(typeof showSort === "function"){
                                showSort(array,i,j);
                            }
                            array[k++] = out[j++];
                            if(typeof showSort === "function"){
                                showSort(array,k-1,k-1);
                            }
                        }
                    }
                    //如果左数组没有遍历完，将左数组剩余数据压入arr
                    if(i<=m){
                        while(i<=m){
                            if(typeof showSort === "function"){
                                showSort(array,null,i);
                            }
                            array[k++] = out[i++];
                            if(typeof showSort === "function"){
                                showSort(array,null,null);
                            }
                        }
                    }else{
                        while(j<=t){
                            if(typeof showSort === "function"){
                                showSort(array,null,j);
                            }
                            array[k++] = out[j++];
                            if(typeof showSort === "function"){
                                showSort(array,k-1,k-1);
                            }
                        }
                    }
                    //console.log(arr);
                    return array;
                };
                //一趟归并排序算法
                let mergePass = function(out, array, h){
                    let len = out.length;
                    let i = 0;
                    while(i+2*h<=len){
                        merge(out, array, i , i+h-1, i+2*h-1);
                        i += 2*h;
                    }
                    if(i+h<len){
                        merge(out, array, i, i+h-1, len-1);
                    }else{
                        while(i<len){
                            array[i] = out[i];
                            i++;
                        }
                    }
                    //console.log(arr);
                    return array;
                }
                //非递归归并排序
                let mergeSortUnrecursion = function(out){
                    let len = out.length;
                    let array = [];
                    for(let i=0;i<arr.length;i++){
                        array[i] = out[i];
                    }
                    let h = 1;
                    while(h<len){
                        mergePass(out, array, h);
                        h = 2*h;
                        mergePass(array, out, h);
                        h = 2*h;
                    }
                    //console.log(out);
                    return out;
                }
                //递归归并排序
                let mergeSortRecursion = function(out,array, s, t){
                    if(s === t){
                        array[s] = out[s];
                    }else{
                        let m = parseInt((s+t)/2);
                        mergeSortRecursion(out, array, s, m);
                        mergeSortRecursion(out, array, m+1, t);
                        merge(array, out, s, m, t);
                        //将out复制给array,继续下一轮归并
                        for(let i=0;i<out.length;i++){
                            array[i] = out[i];
                        }
                    }
                    return out;
                }
                let array = [];
                return mergeSortUnrecursion(out,array, 0, arr.length-1);
            }
            //桶排序
            let bucketSort = function(arr,type,showSort){
                //输入检测
                if(!isArray(arr)){
                    throw Error("the input of bubbleSort is not a array");
                    return;
                }
                //深拷贝，不改动输入数组
                let out = [];
                for(let i=0;i<arr.length;i++){
                    out[i] = arr[i];
                }
                //order==false为升序，否则为降序
                let order = type!==true?1:-1;
                let len = out.length;

                let bucket = [], q = [];
                for(let i=0;i<len;i++){
                    let m = out[i];
                    if(bucket[m] === undefined){
                        bucket[m] = 1;
                    }else{
                        bucket[m]++;
                    }
                }
                //out数组索引
                out.splice(0,out.length);
                let index = 0;
                if(type!==true){
                    //升序
                    for(let i=0;i<bucket.length;i++){
                        let temp = bucket[i];
                        while(temp>=1){
                            out[index++] = i;
                            if(typeof showSort === "function"){
                                showSort(out,null,null);
                            }
                            temp--;
                        }
                    }
                }else{
                    //降序
                    for(let i=bucket.length-1;i>=0;i--){
                        let temp = bucket[i];
                        while(temp>=1){
                            out[index++] = i;
                            if(typeof showSort === "function"){
                                showSort(out,null,null);
                            }
                            temp--;
                        }
                    }
                }


                return out;
            }
            //基数排序
            let radixSort = function(arr,type,showSort){
                //输入检测
                if(!isArray(arr)){
                    throw Error("the input of bubbleSort is not a array");
                    return;
                }
                //深拷贝，不改动输入数组
                let out = [];
                for(let i=0;i<arr.length;i++){
                    out[i] = arr[i];
                }
                //order==false为升序，否则为降序
                let order = type!==true?1:-1;
                let len = out.length;
                //求所有数中最大的
                let max = 0;
                for(let i=0;i<len;i++){
                    if(out[i]>max){
                        max = out[i];
                    }
                }
                //计算所有数中最大的是几位数
                let max_pow = 1;
                while(max>=10){
                    max_pow++;
                    max = parseInt(max/10);
                }
                //升序，分配
                let distributeUp = function(out, queue, pow){
                    queue.splice(0,queue.length);
                    for(let i=0;i<len;i++){
                        let m = parseInt(out[i]/pow)%10;
                        if(Object.prototype.toString.call(queue[m]) !== "[object Array]"){
                            queue[m] = [];
                        }
                        queue[m].push(out[i]);
                    }
                }
                //升序，收集
                let collectUp = function(out, queue){
                    out.splice(0,out.length);
                    for(let i=0;i<10;i++){
                        while(queue[i]!==undefined && queue[i].length>0){
                            out.push(queue[i].shift());
                        }
                    }
                }
                //降序，分配
                let distributeDown = function(out, queue, pow){
                    queue.splice(0,queue.length);
                    for(let i=len-1;i>=0;i--){
                        let m = parseInt(out[i]/pow)%10;
                        if(Object.prototype.toString.call(queue[m]) !== "[object Array]"){
                            queue[m] = [];
                        }
                        queue[m].push(out[i]);
                    }
                }
                //降序，收集
                let collectDown = function(out, queue){
                    out.splice(0,out.length);
                    for(let i=9;i>=0;i--){
                        while(queue[i]!==undefined && queue[i].length>0){
                            out.push(queue[i].pop());
                        }
                    }
                }

                let queue = [];
                if(type!==true){
                    //升序
                    for(let i=0;i<max_pow;i++){
                        distributeUp(out, queue, Math.pow(10,i));
                        collectUp(out, queue);
                    }
                }else{
                    //降序
                    for(let i=0;i<max_pow+1;i++){
                        distributeDown(out, queue, Math.pow(10,i));
                        collectDown(out, queue);
                    }
                }
                if(typeof showSort === "function"){
                    showSort(out,null,null);
                }

                return out;
            };
            let obj = {
                bubbleSort: bubbleSort,
                insertSort: insertSort,
                shellSort: shellSort,
                quickSort: quickSort,
                selectSort: selectSort,
                heapSort: heapSort,
                mergeSort: mergeSort,
                bucketSort: bucketSort,
                radixSort: radixSort
            };
            return obj;
        };
        //初始化函数
        let init = function(){
            //实例化排序对象
            let sort = new Sort();
            let arr = [];
            let number = Number(numberDom.value.trim());
            if(number!==NaN&&number>0){
                arr = random(number,number,1);
                showArr(arr);
            }else{
                arr = random(10,100,1);//随机生成待排序的数组
                //刷新显示初始数组
                showArr(arr);
            }
            arr = [2,8,7,4,1,5,12,3,4];
            console.log("待排序的数组",arr);
            showArr(arr);

            //随机生成指定长度的数组
            getArrDom.addEventListener("click",function(){
                if(animation_flag===true){
                    return;
                }
                let number = Number(numberDom.value.trim());
                if(number!==NaN&&number>0){
                    arr = random(number,number,1);
                    console.log("随机生成的数组：",arr);
                    showArr(arr);
                }else{
                    alert("请输入正确的数组长度");
                }
            });
            //点击开始排序
            button.addEventListener("click",function(){
                //在动画中点击无效
                if(animation_flag===true){
                    return;
                }
                deley_space = Number(deleyDom.value.trim());//输入的动画时间间隔，控制动画快慢(单位ms)
                let order = orderSelect.selectedIndex===0?false:true;//选择的排序顺序
                let index = select.selectedIndex;//选择的排序方法
                let traversalArr = [];
                //按选择的排序方式和顺序排序
                switch(index){
                    case 0: traversalArr = sort.bubbleSort(arr,order,showSort);
                        console.log("冒泡排序:",traversalArr);
                        break;
                    case 1: traversalArr = sort.insertSort(arr,order,showSort);
                        console.log("插入排序:",traversalArr);
                        break;
                    case 2: traversalArr = sort.shellSort(arr,order,showSort);
                        console.log("希尔排序:",traversalArr);
                        break;
                    case 3: traversalArr = sort.quickSort(arr,order,showSort);
                        console.log("快速排序:",traversalArr);
                        break;
                    case 4: traversalArr = sort.selectSort(arr,order,showSort);
                        console.log("选择排序:",traversalArr);
                        break;
                    case 5: traversalArr = sort.heapSort(arr,order,showSort);
                        console.log("堆排序:",traversalArr);
                        break;
                    case 6: traversalArr = sort.mergeSort(arr,order,showSort);
                        console.log("归并排序:",traversalArr);
                        break;
                    case 7: traversalArr = sort.bucketSort(arr,order,showSort);
                        console.log("桶排序:",traversalArr);
                        break;
                    case 8: traversalArr = sort.radixSort(arr,order,showSort);
                        console.log("基数排序:",traversalArr);
                        break;
                    default: //alert("选择遍历方式出错");
                        break;
                }
            });
        };
//初始化
        init();

    })();
</script>
</body>
</html>


