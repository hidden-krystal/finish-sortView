<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/3/1
  Time: 下午6:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>字符串匹配算法</title>

    <script language="JavaScript" type="text/javascript">

        function runStringMatchingBySimple() {
            var a = document.getElementById("searchData").value;
            var keyword = document.getElementById("keyword").value;
            var arr = new Array();
            var key = new Array();

            arr = a.split("");
            key = keyword.split("");
            var len1 = arr.length;
            var len2 = key.length;

            console.log(arr);
            console.log("字符串长度为："+len1);
            console.log(key);
            console.log("关键字符长度为："+len2);

            var result = findIndex(arr, key);

            if (result != -1) {
                console.log("匹配成功，且开始的下标为：" + result);
                document.getElementById("result").innerText=("匹配成功，且开始的下标为：" + result);
            }else {
                console.log("匹配失败");
                document.getElementById("result").innerText=("匹配失败");
            }
        }

        function runStringMatchingByKMP() {
            var a = document.getElementById("searchData").value;
            var keyword = document.getElementById("keyword").value;
            var arr = new Array();
            var key = new Array();

            arr = a.split("");
            key = keyword.split("");
            var len1 = arr.length;
            var len2 = key.length;

            console.log(arr);
            console.log("字符串长度为："+len1);
            console.log(key);
            console.log("关键字符长度为："+len2);

            var result = KMP(arr, key);

            if (result != -1) {
                console.log("匹配成功，且开始的下标为：" + result);
                document.getElementById("result").innerText=("匹配成功，且开始的下标为：" + result);
            }else {
                console.log("匹配失败");
                document.getElementById("result").innerText=("匹配失败");
            }

        }

        function findIndex(mStr, sStr) {
            var mLen = mStr.length;
            var sLen = sStr.length;

            if (mLen < sLen) {
                return -1;
            }

            for (var i = 0; i < (mLen - sLen + 1); i++) {
                for (var j = 0; j < sLen; j++) {
                    if (mStr[i + j] !== sStr[j]) {
                        break;
                    }
                    if (j === sLen - 1) {
                        return i;
                    }
                }
            }
            return -1;
        }

        /**
         * 计算返回子串str的next数组
         * */
        function getNext(str) {
            var len = str.length,
                next = new Array(len).fill(0);//默认下一跳回到0
            for (var i=0; i<len; i++) {
                var subStr = str.slice(0, i);
                for(var j=0; j < i - 1 ; j++) {
                    //判断前缀和后缀的情况，存储当j位不匹配时，下一跳的位置，自动更新保证最大值
                    if(subStr.slice(0, j + 1) === subStr.slice(i - j - 1)) {
                        next[i] = j + 1;
                    }
                }
            }
            return next;
        }
        /**
         * @param sourceStr 主字符串
         * @param searchStr 模式字符串
         * */
        function KMP(sourceStr, searchStr) {
            var sourceLen = sourceStr.length,
                searchLen = searchStr.length,
                next = getNext(searchStr);
            //i为源字符串的指针，j为目标字符串的指针
            var i = 0;
            var j = 0;

            while(i < sourceLen && j < searchLen) {
                if (sourceStr[i] === searchStr[j]) {
                    ++i;
                    ++j;
                } else {
                    //这里用于判断当前指针的位置，如果指针已经在0了，表示模式字符串的第一位都不匹配，主字符串的指针往后移一位
                    if(j === 0 ) {
                        ++i;
                        continue;
                    }
                    j = next[j];
                }
            }

            if(j === searchLen) {
                return i - j;
            } else {
                return -1;
            }
        }


    </script>
</head>
<body>
<div>
    请输入字符串:
    <input id="searchData" type="text">
    <br><br>
    请输入需要查找的字符串:
    <input id="keyword" type="text">
    <br><br>
    <button onclick="runStringMatchingBySimple()">执行朴素模式匹配</button>
    <button onclick="runStringMatchingByKMP()">执行KMP模式匹配</button>

    <p id="result"></p>
</div>
</body>
</html>
