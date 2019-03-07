<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/2/26
  Time: 上午11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>算法动态演示首页</title>
    <meta charset="UTF-8">

    <script language="javascript" type="text/javascript">
        function showNQueens() {
            window.location.href="./question/N-Queens.jsp";
        }

        function showBubble() {
            window.location.href="./sort/BubbleSort.jsp"; //在原来的窗体中直接跳转用
        }

        function showSelection() {
            window.location.href="./sort/SelectionSort.jsp";
        }

        function showInsertion() {
            window.location.href="./sort/InsertionSort.jsp";
        }

        function showMerge() {
            window.location.href="./sort/MergeSort.jsp";
        }

        function showQuick() {
            window.location.href="./sort/QuickSort.jsp";
        }

        function showShell() {
            window.location.href="./sort/ShellSort.jsp";
        }

        function showBucket() {
            window.location.href="./sort/BucketSort.jsp";
        }

        function showCount() {
            window.location.href="./sort/CountSort.jsp";
        }

        function showHeap() {
            window.location.href="./sort/HeapSort.jsp";
        }

        function showRadix() {
            window.location.href="./sort/RadixSort.jsp";
        }

        function showSeq() {
            window.location.href="./search/SequentialSearch.jsp";
        }

        function showString() {
            window.location.href="./string/StringMatching.jsp";
        }

        function showKnapsack() {
            window.location.href="./question/Knapsack.jsp";
        }

        function showHamilton() {
            window.location.href="./question/HamiltonLoop.jsp";
        }

        function showClosest() {
            window.location.href="./question/ClosestPair.jsp";
        }

        function showBinary() {
            window.location.href="./search/BinarySearch.jsp";
        }

        function showBoard() {
            window.location.href="./question/BoardCover.jsp";
        }

        function showConvex() {
            window.location.href="./question/ConvexHull.jsp";
        }

        function showTraverse() {
            window.location.href="./map/TraverseMap.jsp";
        }

        function showJosephus() {
            window.location.href="./question/Josephus.jsp";
        }
    </script>
  </head>

  <body>
  <div style="background: black; padding: 10px 30px">
    <span style="color: white ">Krystal</span><span style="color: aqua">-</span><span style="color: aqua">QingXin</span>
    <span style="float: right;color: white">Sometimes ever, sometimes never.</span>
  </div>
    <h1 align="center">算法动态可视化</h1>
  <div>
    <button id="bubbleSort" onclick="showBubble()">冒泡排序算法</button>
    <button id="selectionSort" onclick="showSelection()">选择排序算法</button>
    <button id="nQueens" onclick="showNQueens()">N皇后算法</button>
    <button id="insertionSort" onclick="showInsertion()">插入排序算法</button>
    <button id="mergeSort" onclick="showMerge()">归并排序算法</button>
    <button id="quickSort" onclick="showQuick()">快速排序算法</button>
    <button id="shellSort" onclick="showShell()">希尔排序算法</button>
    <button id="bucketSort" onclick="showBucket()">桶排序算法</button>
    <button id="countSort" onclick="showCount()">计数排序算法</button>
    <button id="heapSort" onclick="showHeap()">堆排序算法</button>
    <button id="radixSort" onclick="showRadix()">基数排序算法</button>
    <button id="seqSearch" onclick="showSeq()">顺序查找</button>
    <button id="stringMatching" onclick="showString()">串匹配</button>
    <button id="knapsack" onclick="showKnapsack()">0/1背包问题</button>
    <button id="hamiltonLoop" onclick="showHamilton()">哈密顿回路问题</button>
    <button id="closestPair" onclick="showClosest()">最近对问题</button>
    <button id="binarySearch" onclick="showBinary()">二分查找算法</button>
    <button id="boardCover" onclick="showBoard()">棋盘覆盖问题</button>
    <button id="convexHull" onclick="showConvex()">凸包问题</button>
    <button id="traverseMap" onclick="showTraverse()">树的遍历</button>
    <button id="josephus" onclick="showJosephus()">约瑟夫斯问题</button>
  </div>
  </body>
</html>
