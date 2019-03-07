<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/3/6
  Time: 上午7:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>凸包问题</title>

    <script language="JavaScript" type="text/javascript">
        function runConvexHull() {
            var a = document.getElementById("data").value;
            var data = new Array(20);
            var arr = new Array();
            var coordinate = new Array();
            var ans = new Array();
            var visit = new Array();

            data = a.split(";");
            console.log(data);
            var n = data.length;
            for(var i = 0; i < n; i++){
                arr[i]= data[i].split(",");
            }
            console.log(arr);
            for(var a = 0; a < n; a++){
                coordinate[a]=[arr[a][0], arr[a][1]];
                ans[a] = [" "," "];
            }
            for (var i = 0; i < n; i++){
                for(var j = 0; j < 2; j++){
                    coordinate[i][j] = parseInt(coordinate[i][j]); //将字符串数组转化为数字数组
                }
                visit[i] = 0;
            }
            console.log(coordinate);

            visit[0] = 1;
            visit[n - 1] = 1;
            // sort(p, p + n, cmpxy);
            coordinate = coordinate.sort(cmpxy);
            DealLeft(0, n - 1, visit, coordinate); //查找上凸包;
            DealLeft(n - 1, 0, visit, coordinate);
            var t = 0;
            for (var i = 0; i < n; i++)
            {
                if (visit[i] == 1)
                {
                    ans[t][0] = coordinate[i][0];
                    ans[t][1] = coordinate[i][1];
                    t++;
                }
            }

            //顺时针输出
            var mark = new Array();
            mark[0] = mark[t - 1] = 1; //数组mark避免重复检查降低效率
            for (var i = 1; i < t - 1; i++)
            {
                mark[i] = 0;
            }
            console.log(ans[0][1] + " " + ans[0][1]);
            // cout << ans[0].x << " " <<ans[0].y<< endl;
            for (var i =1; i < t - 1; i++)
            {
                var d = Djudge(ans[0], ans[t-1], ans[i]);
                if (d >= 0)
                {
                    console.log(ans[i][0] + " " + ans[i][1]);
                    // cout << ans[i].x << " " << ans[i].y << endl;
                    mark[i] = 1;
                }
            }
            console.log(ans[t - 1][1] + " " + ans[t - 1][1]);
            // cout << ans[t - 1].x << " " << ans[t - 1].y << endl;
            for (var i = 1; i < t; i++)
            {
                if (mark[i] != 1)
                {
                    var d = Djudge(ans[0], ans[t - 1], ans[i]);
                    if (d < 0)
                    {
                        console.log(ans[i][0] + " " + ans[i][1]);
                        // cout << ans[i].x << " " << ans[i].y << endl;
                    }
                }
            }
            // var result = bucketSort(arr , 2);
        }

        function Djudge(a1, a2, a3)
        {
            var calculate = a1[0]*a2[1] + a3[0]*a1[1] + a2[0]*a3[1] - a3[0]*a2[1] - a2[0]*a1[1] - a1[0]*a3[1];
            return calculate;
        }
        function cmpxy(a, b) //按x轴排序,如果x相同,按y轴排序
        {
            if (a[0] != b[0])
                return a[0] < b[1];
            else
                return a[1] < b[1];
        }
        function DealLeft(first, last, visit, coordinate)
        {
            var max = 0, index = -1;
            var i = first;
            if (first < last)
            {
                for (i = first+1; i < last; i++) //注意两端,对于first和last,没必要再进行计算
                {
                    var calcu = Djudge(coordinate[first], coordinate[i], coordinate[last]);
                    if (calcu == 0) {
                          visit[i] = 1;
                    } //
                    if (calcu > max)
                    {
                        max = calcu;
                        index = i;
                    }

                }
            }
            else
            {
                for (i-1; i >last; i--) //如果first>last,重复上述过程,注意这里下界不是0.
                {
                    var calcu = Djudge(coordinate[first], coordinate[i], coordinate[last]);
                    if (calcu == 0) {visit[i] = 1;} //
                    if (calcu >  max)
                    {
                        max = calcu;
                        index = i;
                    }
                }
            }
            if (index != -1)
            {
                visit[index] = 1; //对取到的点进行标注  
                DealLeft(first, index, visit, coordinate);
                DealLeft(index, last, visit, coordinate);//分治的部分
            }
        }
    </script>
</head>
<body>
    请输入一段坐标（例如：2,4;3,5）:
    <input id="data" type="text">
    <button onclick="runConvexHull()">执行</button>
</body>
</html>
