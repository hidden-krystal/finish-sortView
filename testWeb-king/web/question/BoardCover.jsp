<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/3/4
  Time: 上午11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>棋盘覆盖问题</title>

    <script type="text/javascript">
        window.onload=function()
        {//棋盘设置
            var chess = document.getElementById('chess');
            var input = document.getElementsByTagName('input')[3];
            input.onclick=function()
            {
                var N = document.getElementsByTagName('input')[0].value;
                var table=document.createElement('table');
                chess.appendChild(table);
                table.style.border='2px solid';
                table.style.borderCollapse='collapse';
                for(var i=0;i<N;i++)
                {
                    var tr=document.createElement('tr');
                    table.appendChild(tr);
                    tr.style.height = "20px";
                    tr.style.border='1px solid #ccc';
                    for(var j=0;j<N;j++)
                    {
                        var td=document.createElement('td');
                        tr.appendChild(td);
                        td.style.width = "20px";
                        td.style.border='1px solid #ccc';
                    }
                }
            };
            var Out=document.getElementsByTagName('input')[4];
            var Matrix = new Array();
            for(var i=0;i<100; i++)
            { //初始化棋盘矩阵
                Matrix[i] = new Array();
                for(var j=0;j<100;j++)
                {
                    Matrix[i][j]=0;
                }
            }
            Out.onclick=function()
            { //棋盘生成
                var r,c;
                var X=document.getElementsByTagName('input')[1].value;
                var Y=document.getElementsByTagName('input')[2].value;
                var N=document.getElementsByTagName('input')[0].value;
                chessBoard(0,0,X-1,Y-1,N);
                for (r = 0; r < N; r++)
                {
                    for (c = 0; c < N; c++)
                    {
                        var q=Matrix[r][c];
                        var table=document.getElementsByTagName('table')[0];
                        table.rows[r].cells[c].style.background='rgb('+13*q%256+','+43*q%256+','+73*q%256+')';
                    }
                }
            };
            var nCount = 0;
            function chessBoard(tr,tc,dr,dc,size)
            {
                var s,t;
                if (size == 1) return;
                s =size/2;
                t = ++nCount ;
                if (dr < tr + s && dc < tc +s)
                    chessBoard(tr,tc,dr,dc,s);
                else
                {
                    Matrix[tr+s-1][tc+s-1] = t;
                    chessBoard(tr,tc,tr+s-1,tc+s-1,s);
                }
                if (dr < tr + s && dc >= tc + s )
                    chessBoard(tr,tc+s,dr,dc,s);
                else
                {
                    Matrix[tr+s-1][tc+s] = t;
                    chessBoard(tr,tc+s,tr+s-1,tc+s,s);
                }
                if (dr >= tr + s && dc < tc + s)
                    chessBoard(tr+s,tc,dr,dc,s);
                else
                {
                    Matrix[tr+s][tc+s-1] = t;
                    chessBoard(tr+s,tc,tr+s,tc+s-1,s);
                }
                if (dr >= tr + s && dc >= tc + s)
                    chessBoard(tr+s,tc+s,dr,dc,s);
                else
                {
                    Matrix[tr+s][tc+s] = t;
                    chessBoard(tr+s,tc+s,tr+s,tc+s,s);
                }
            }
        }
    </script>
</head>
<body>
    <div id="num">
        <p>设置棋盘大小：
            <input type="text" name="Num" size="4" />
        </p>
        <p>请输入特殊方格的位置：</p>
        <p>
            x:<input type="text" name="X" size="25"/><br />
            y:<input type="text" name="Y" size="25" />
        </p>
        <p>
            <input type="button" value="生成棋盘" />
            <input type="button" value="覆盖棋盘" />
        </p>
    </div>
    <div id="chess">
    </div>
</body>
</html>


