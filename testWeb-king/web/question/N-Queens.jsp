<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/26
  Time: 下午5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>N皇后排列</title>
    <meta charset="UTF-8">
    <script type="text/javascript" > //算法
        function Queen(n){
            function queen2(a,cur){
                if(cur==a.length){
                    //console.log(a);
                    //压入的是a的即时数据(通过切片获得),而不是a对象;
                    result.push(a.slice());
                    return
                }
                for(var i=0;i<a.length;i++){
                    a[cur]=i;
                    flag=true;
                    for(var j=0;j<cur;j++){
                        var ab=i-a[j];
                        if(a[j]==i||(ab>0?ab:-ab)==cur-j){
                            flag=false;
                            break;
                        }
                    }
                    if(flag){
                        queen2(a,cur+1)
                    }
                }
            }
            var result = [];
            var A = [];
            for(var i= 0; i<n; i++){
                A[i]=1;
            }
            queen2(A,0);
            return result;
        }
    </script>

    <script>
        var Vid;
        function myfunction(){
            N = document.getElementById("X").value*1;
            var C2=["black","lightgrey"];

            if (N>10 || N<4){
                alert("数字超范围了,会死机的!请重新输入.");
                return;
            }

            window.clearInterval(Vid);

            result ='<svg xmlns="http://www.w3.org/2000/svg" version="1.1" height="600" width="600">'
            result +='<rect width="600" height="600" style="fill:beige;stroke-width:1;stroke:rgb(0,0,0)"/>'

            var length = 600/N;
            for(var i = 0; i<N; i++){
                for(var j = 0; j<N; j++){
                    var x =length*j;
                    var y = length*i;
                    var color =C2[(i+j)%2];
                    result += '<rect x="'+x+'" y="'+y+'" width="'+length+'" height="'+length+'" stroke="none" fill="'+color+'" />';

                }
            }
            result += '<defs>';
            result += '<g id="star">';
            result +='<rect width="200" height="200" style="fill:none;stroke:black;stroke-width:1" />';
            //result +='<polygon points="100,15 40,185 190,65 10,65 160,185"';
            //result +='style="fill:red;stroke:yellow;stroke-width:5;fill-rule:evenodd;" />';
            result += '<text fill="orange" stroke-width="0" x="66.64868" y="88.32677" '
            result += 'font-size="24" font-family="sans-serif" text-anchor="start" xml:space="preserve" '
            result += 'transform="matrix(6.8,0,0,7.6,-432,-513)" stroke="#000">♕</text>'
            result +='</g>';
            result +='</defs>';
            result += '<g id = "QS"></g>';
            //result +='<use xlink:href="#star" transform="translate(60,60) scale(0.3)" />';
            result += '</svg>'
            document.getElementById("sg1").innerHTML = result;
            var qs=Queen(N);
            var vs=qs.length;
            var D = 0;
            function drwl(){
                document.getElementById("result").innerHTML = qs[D % vs];
                var view = '';
                for(var c=0; c<N; c++){
                    x=length*qs[D % vs][c];
                    y=length*c;
                    scale = length/200;
                    //'+x+'
                    view +='<use xlink:href="#star" transform="translate('+x+','+y+') scale('+scale+')" />';
                }
                document.getElementById("QS").innerHTML = view;

                D++;
            }
            Vid=setInterval(drwl, 1000);
        }
    </script>
</head>

<body>
    <p>请输入X(4-10)：</p>
    <b>X:</b><input id="X" type="number" value="8" ></input>
    <button type="button" onclick="myfunction()">绘图</button>
    <div id="sg1">
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" height="600" width="600">
            <rect width="600" height="600" style="fill:rgb(0,0,255);stroke-width:1;stroke:rgb(0,0,0)"/>
            <line x1="0" y1="0" x2="600" y2="600" />
            <line x1="0" y1="600" x2="600" y2="0" />
        </svg>
    </div>
<div id="result" style="color:#0000FF; font-family: '微软雅黑'; font-size: 24pt;"></div>
</body>
</html>


