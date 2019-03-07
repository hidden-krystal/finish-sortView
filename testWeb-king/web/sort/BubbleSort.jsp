<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/26
  Time: 下午5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>冒泡排序算法</title>
    <meta charset="UTF-8">
    <style>
        #main {
            width: 600px;
            height: 200px;
            position: relative;
        }
    </style>

    <script language="JavaScript" type="text/javascript">
        function runBubbleSort(){
            var course = document.getElementById("course");

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

            bubbleSort(arr);


            // var temp;
            // console.log("长度为："+len);
            // for(var i = 0; i < len; i++){
            //     for(var j = 0; j < len - i - 1; j++){
            //         if(arr[j] > arr[j+1]){
            //             // console.log(arr[j]+">"+arr[j+1]);
            //             temp = arr[j];
            //             arr[j] = arr[j+1];
            //             arr[j+1] = temp;
            //             // console.log( "过程：" + arr);
            //         } else {
            //             // console.log( "过程：" + arr);
            //         }
            //     }
            //     var count = i + 1;
            //     console.log( "第"+count+"趟的结果为：" + arr);
            //     var txt = document.createTextNode("第"+count+"趟的结果为：" + arr);
            //     course.append(txt);
            //     // document.getElementById("course").innerText=("第"+count+"趟的结果为：" + arr);
            // }
            //
            // console.log("最终结果为:"+arr);
            // document.getElementById("result").innerText=("最终结果为:"+arr);
            // return arr;
        }

        function bubbleSort(arr) {

            animation();

            // 冒泡排序算法，对数组进行排序，同时记录每一步操作，保存在一个数组中
            function sort() {
                // virtualArr 用来存放 每一个步内容的数组
                var virtualArr = [arr.slice()]; //slice() 方法可从已有的数组中返回选定的元素。
                var max = arr.length;
                for (var i = 0; i < max; i++) {
                    var done = true;
                    for (var j = 0; j < max - i; j++) {
                        if (arr[j] > arr[j + 1]) {
                            var temp = arr[j];
                            arr[j] = arr[j + 1];
                            arr[j + 1] = temp;
                            done = false;
                            virtualArr.push(arr.slice());
                        }
                    };
                    if(done){
                        break;
                    };
                }
                console.log(virtualArr);
                return virtualArr;
            }

            // 绘画，调用一次就画出一步的图像
            function darw(arr){
                // console.log(arr);
                var canvas = document.getElementById('myCanvas');
                var ctx = canvas.getContext('2d'); //getContext() 方法返回一个用于在画布上绘图的环境。
                // 获取 canvas画板的高度(确定每个长方形的 y 值时需要)
                var maxWidth = canvas.height;
                // 每个长方形的宽度
                var width = 20;
                // 每个长方形之间的间隔
                var space =20;
                // 清空画布
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                // 设置字体
                ctx.font = "18px serif";
                // 在页面上，画出一步的内容
                for (var i = 0; i < arr.length; i++) {
                    ctx.fillStyle = '#61C5FE';
                    // x 的 值等于 第i个长方形 * （长方形的宽+每个长方形的间隔）
                    // y 的 值等于  画板的高度 - 第i的元素的值
                    ctx.fillRect(i * (width+space), maxWidth - arr[i], width, arr[i]);
                    ctx.fillStyle = '#240be4';
                    // maxWidth - arr[i]-5，这里多- 5，是为了能让文字，在长方形上方一点显示，看的明显些
                    ctx.fillText(arr[i], i * (width+space), maxWidth - arr[i]-5);
                }
            }

            // 动画
            function animation() {
                // 调用sort 方法，返回包括每一步内容的数组
                var virtualArr = sort();
                var interval =500;
                // 遍历得到的数组，每隔500ms，调用darw 方法，画出一步内容

                // virtualArr.forEach((item, index) => {
                //     setTimeout(darw(item), i * interval);
                // });
                for(var i = 0; i < virtualArr.length; i++){
                    setTimeout(darw(virtualArr), i * interval);
                }
            }

        }
    </script>
</head>

<body>

    请输入N个正整数
    <input id="sortData" type="text">
    <button onclick="runBubbleSort()">执行</button>

    <div id="course"></div>
    <p id="result"></p>

    <div id="main">
        <canvas id="myCanvas" width="600" height="200"> </canvas>
    </div>
</body>
</html>
