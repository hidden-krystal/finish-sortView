<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/3/6
  Time: 上午10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>树的遍历</title>
    <style type="text/css">
        .container{
            width: 600px;
            height: 800px;
            margin: 0 auto;
        }
        .node{
            width: 100px;
            min-height: 100px;
        }
        .circle{
            margin: 0 auto;
            width: 50px;
            height: 50px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="control">
        <select id="select">
            <option>深度优先-前序遍历</option>
            <option>深度优先-后序遍历</option>
            <option>广度优先遍历</option>
        </select>
        <input type="button" name="click" value="开始遍历" id="button">
    </div>
    <svg id="svg" width="600" height="600"></svg>
</div>

<!-- <script type="text/javascript" src="singlyLinkedList.js"></script> -->
<script type="text/javascript">
    (function(){
        var treeData = {
            data: 1,
            childrens:[
                {
                    data: 2,
                    childrens:[
                        {
                            data: 4,
                            childrens:[
                                {
                                    data: 11,
                                    childrens:[]
                                },
                                {
                                    data: 12,
                                    childrens:[]
                                }
                            ]
                        },
                        {
                            data: 5,
                            childrens:[]
                        },
                        {
                            data: 6,
                            childrens:[]
                        }
                    ]
                },
                {
                    data: 3,
                    childrens:[
                        {
                            data: 7,
                            childrens:[
                                {
                                    data: "A",
                                    childrens:[]
                                },
                                {
                                    data: "B",
                                    childrens:[]
                                }
                            ]
                        },
                        {
                            data: 8,
                            childrens:[]
                        },
                        {
                            data: 9,
                            childrens:[
                                {
                                    data: 13,
                                    childrens:[
                                        {
                                            data: 14,
                                            childrens:[]
                                        },
                                        {
                                            data: 15,
                                            childrens:[]
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            data: 10,
                            childrens:[]
                        }
                    ]
                }
            ]
        }
//二叉树
        var BinaryTree = function(){
            //前序遍历递归实现
            var PreOrderTraversalRecursion = function(node){
                console.log(node.data);
                for(var i = 0;i<node.childrens.length;i++){
                    this.PreOrderTraversalRecursion(node.childrens[i]);
                }
                return;
            }
            //后序遍历递归实现
            var PostOrderTraversalRecursion = function(node){
                for(var i = 0;i<node.childrens.length;i++){
                    this.PostOrderTraversalRecursion(node.childrens[i]);
                }
                console.log(node.data);
                return;
            }
            //前序遍历非递归实现
            var PreOrderTraversal = function(rootNode){
                var stack = [];//存放结果的栈
                var temp = [];//暂存结点的栈
                temp.push(rootNode);
                while(temp.length>0){
                    var node = temp.shift();
                    stack.push(node);
                    var childrens = node.childrens;
                    if(childrens && childrens.length>0){
                        for(var i =childrens.length-1;i >= 0;i--){
                            temp.unshift(childrens[i]);
                        }
                    }
                }
                var result = [];
                while(stack.length>0){
                    result.push( stack.shift().data );
                }
                return result;
            }
            //后序遍历非递归实现
            var PostOrderTraversal = function(rootNode){
                var stack = [];//存放结果的栈
                var temp = [];//暂存结点的栈
                temp.push(rootNode);
                //暂存数组不为空，即未遍历所有结点时一直循环
                while(temp.length>0){
                    var node = temp.pop();
                    stack.push(node);
                    var childrens = node.childrens;
                    //如果栈顶结点存在子节点，则全部入栈
                    if(childrens && childrens.length>0){
                        for(var i = 0;i<childrens.length;i++){
                            temp.push(childrens[i]);
                        }
                    }
                }
                var result = [];//存放遍历结果的数组
                while(stack.length>0){
                    result.push( stack.pop().data );
                }
                return result;
            }
            /*//前序遍历非递归实现1
            var PreOrderTraversal1 = function(rootNode){
                var stack = [];//暂存结点的栈
                var result = [],count = 0;//存放遍历结果的数组
                var p = rootNode;
                var  = null;
                while(p!==null && stack.length>0){
                    while(ppre!==null){
                        result[count++]=p.data;
                        stack.push(p);
                        if(p.childrens.length>0){
                            p = p.childrens[0];
                        }else{
                            p = null;
                        }
                    }
                    if(stack.length>0){
                        p = stack[stack.length-1];
                        var len = p.childrens.length;
                        if(len===0 && pre===p.childrens[len-1] ){
                            stack.pop();
                            p = stack[stack.length-1].childrens[]
                        }else{
                            //当前结点有子节点，压栈
                            for(let i = p.childrens.length-1;i>=1;i--){
                                stack.push(p.childrens[i]);
                            }
                        }
                        pre = p;
                        p = p.childrens[1];
                    }
                }
                stack.push(rootNode);

                return result;
            }*/
            //后序遍历非递归实现1
            var PostOrderTraversal1 = function(rootNode){
                var stack = [];//暂存结点的栈
                var result = [],count = 0;//存放遍历结果的数组
                var pre = null, cur = null;//前一个遍历的结点，当前遍历的结点
                stack.push(rootNode);
                while(stack.length>0){
                    cur = stack[stack.length-1];//取当前结点
                    var len = cur.childrens.length;
                    if(len===0||pre === cur.childrens[len-1]){
                        //当前结点没有子节点或子节点已经遍历完毕
                        var pre = stack.pop();
                        result[count++] = pre.data;
                    }else{
                        //当前结点有子节点，压栈
                        for(var i = cur.childrens.length-1;i>=0;i--){
                            stack.push(cur.childrens[i]);
                        }
                    }
                }
                return result;
            };
            //层序遍历
            var LeverOrderTraversal1 = function(tree){
                var rootNode = JSON.parse( JSON.stringify(tree) );
                var result = [],floor=0;
                var queue = [],index = 0;//队列、遍历索引和队列中结点的数量
                rootNode.floor = 1;
                rootNode.widthRatio = 1;//占画布宽度的比例
                queue.push(rootNode);
                rootNode.father = rootNode;
                rootNode.which = 0;
                while(index!=queue.length){
                    var node = queue[index++];
                    var len = node.childrens.length;
                    if(len>0){
                        for(var i=0;i<len;i++){
                            node.childrens[i].floor = node.floor+1;
                            node.childrens[i].which = i;
                            node.childrens[i].widthRatio = node.widthRatio/len;
                            node.childrens[i].father = node;
                            queue.push(node.childrens[i]);
                        }
                    }
                    if(queue.length>100) break;
                }
                for(var i=0;i<queue.length;i++){
                    result[i] = queue[i];
                }

                return result;
            }
            return {
                PreOrderTraversalRecursion: PreOrderTraversalRecursion,
                PostOrderTraversalRecursion: PostOrderTraversalRecursion,
                PreOrderTraversal: PreOrderTraversal,
                PostOrderTraversal: PostOrderTraversal,
                PostOrderTraversal1: PostOrderTraversal1,
                LeverOrderTraversal1: LeverOrderTraversal1
            }
        }

        /*var tree = new BinaryTree();
        tree.PreOrderTraversalRecursion(treeData);
        console.log("\n");
        tree.PostOrderTraversalRecursion(treeData);
        console.log("前序优先前序遍历：",tree.PreOrderTraversal(treeData));
        console.log("深度优先后序遍历：",tree.PostOrderTraversal(treeData));
        console.log("深度优先后序遍历1：",tree.PostOrderTraversal1(treeData));
        console.log("层序遍历/广度优先遍历：",tree.LeverOrderTraversal1(treeData));*/

        var showTree = function(){
            var svg = document.getElementById("svg");
            var circleStr = "",lineStr = "",textStr = "";//圆、线和文本的HTML字符串
            var tree = new BinaryTree();
            var nodes = tree.LeverOrderTraversal1(treeData);//层序遍历生成数组
            console.log(nodes);
            //计算画树需要的画布尺寸
            var size = (function(nodes){
                var numArr = [];
                for(var i =0;i<nodes.length;i++){
                    if(numArr[nodes[i].floor-1]===undefined){
                        numArr[nodes[i].floor-1]=0;
                    }
                    numArr[nodes[i].floor-1]++;
                }
                //console.log(numArr);
                var max = 0;
                for(var i =0;i<numArr.length;i++){
                    if(numArr[i] > max){
                        max = numArr[i];
                    }
                }
                //console.log(max);
                var size = {
                    width: max*100,
                    height: numArr.length*80+80
                }
                return size;
            })(nodes);
            //设置SVG画布尺寸
            svg.setAttribute("width",size.width);
            svg.setAttribute("height",size.height);
            svg.parentNode.style.width = size.width+"px";
            var width = size.width;

            var occupyWidth = 0,preFloor = 0;//当前层之前结点占用的宽度，之前的层数
            //遍历所有树的结点，生成圆、线和文本的HTML字符串
            for(var i =0;i<nodes.length;i++){
                //如果依然处于当前层，则累加占用宽度，否则将占用宽度置零，更新层数
                if(preFloor === nodes[i].floor){
                    occupyWidth += nodes[i-1].width*width;
                }else{
                    occupyWidth = 0;
                    preFloor = nodes[i].floor;
                }

                var cx = 0, cy = 0;//当前结点的定位像素坐标
                cx = occupyWidth + width*nodes[i].width/2;
                cy = nodes[i].floor * 80;
                nodes[i].cx = cx;
                nodes[i].cy = cy;
                lineStr += '<line x1="'+nodes[i].cx+'" y1="'+nodes[i].cy+'" x2="'+nodes[i].father.cx+
                    '" y2="'+nodes[i].father.cy+'" style="stroke:black;stroke-width:2" />';
                circleStr += '<circle cx="'+cx+'" cy="'+cy+'" r="20" fill="#9F79EE"/></circle>';
                //调整文本缩进
                var textcx = nodes[i].data>9?(nodes[i].cx-10):(nodes[i].cx-5),
                    textcy = (nodes[i].cy+6);
                textStr += '<text x="'+textcx+'" y="'+textcy+'" fill="white">'+nodes[i].data+'</text>';
            }
            svg.innerHTML = lineStr+circleStr+textStr;
        }
//showTree();


        var showTreeTraverse = function(id){
            var svg = document.getElementById("svg");
            svg.innerHTML = "";
            var circleStr = "",lineStr = "",textStr = "";//圆、线和文本的HTML字符串
            var tree = new BinaryTree();
            var nodes = tree.LeverOrderTraversal1(treeData);//层序遍历生成数组
            //console.log(nodes);
            console.log(id);
            //计算画树需要的画布尺寸
            var size = (function(nodes){
                var numArr = [];
                for(var i =0;i<nodes.length;i++){
                    if(numArr[nodes[i].floor-1]===undefined){
                        numArr[nodes[i].floor-1]=0;
                    }
                    numArr[nodes[i].floor-1]++;
                }
                //console.log(numArr);
                var max = 0;
                for(var i =0;i<numArr.length;i++){
                    if(numArr[i] > max){
                        max = numArr[i];
                    }
                }
                //console.log(max);
                var size = {
                    width: max*100,
                    height: numArr.length*80+80
                }
                return size;
            })(nodes);
            //设置SVG画布尺寸
            svg.setAttribute("width",size.width);
            svg.setAttribute("height",size.height);
            svg.parentNode.style.width = size.width+"px";
            var width = size.width;

            //遍历所有树的结点，生成圆、线和文本的HTML字符串
            for(var i =0;i<nodes.length;i++){
                var nodeColor = nodes[i].data === id?"#080808":"#9F79EE";

                var cx = 0, cy = 0;//当前结点的定位像素坐标
                var father = nodes[i].father;
                if(i === 0){
                    father.cx = width/2;
                }
                //父节点宽度的最左边
                var start = father.cx - width*father.widthRatio/2;
                //当前结点的横坐标
                cx = start + width*nodes[i].widthRatio*(nodes[i].which + 0.5);
                console.log(start,cx);
                cy = nodes[i].floor * 80;
                nodes[i].cx = cx;
                nodes[i].cy = cy;
                lineStr += '<line x1="'+cx+'" y1="'+cy+'" x2="'+nodes[i].father.cx+
                    '" y2="'+nodes[i].father.cy+'" style="stroke:black;stroke-width:2" />';
                circleStr += '<circle cx="'+cx+'" cy="'+cy+'" r="20" fill="'+nodeColor+'"/></circle>';
                //调整文本缩进
                var textcx = nodes[i].data>9?(nodes[i].cx-10):(nodes[i].cx-5),
                    textcy = (nodes[i].cy+6);
                textStr += '<text x="'+textcx+'" y="'+textcy+'" fill="white">'+nodes[i].data+'</text>';
            }
            svg.innerHTML = lineStr+circleStr+textStr;
        }


        var tree = new BinaryTree();
        var nodes = tree.LeverOrderTraversal1(treeData);//层序遍历生成数组
        console.log(nodes);
        var traversalArr = tree.PostOrderTraversal(treeData);
        showTreeTraverse(null,nodes);
//var traversalArr = tree.PreOrderTraversal(treeData);
        var select = document.getElementById("select");
        var button = document.getElementById("button");

        button.addEventListener("click",function(){
            if(button.click===false){
                return;
            }else{
                button.click = false;
            }
            var nodes = tree.LeverOrderTraversal1(treeData);//层序遍历生成数组
            var traversalArr = tree.PostOrderTraversal(treeData);
            var index = select.selectedIndex ;
            console.log(index);
            switch(index){
                case 0: traversalArr = tree.PreOrderTraversal(treeData)
                    break;
                case 1: traversalArr = tree.PostOrderTraversal(treeData)
                    break;
                case 2: traversalArr = (function(){
                    var arr = tree.LeverOrderTraversal1(treeData);
                    for(var i =0;i<arr.length;i++){
                        arr[i] = arr[i].data;
                    }
                    return arr;
                })();
                    break;

            }
            //注意，这里故意
            for(var i =0;i<=traversalArr.length;i++){
                setTimeout(function(i){
                    showTreeTraverse(traversalArr[i],nodes);
                    if(i>=traversalArr.length){
                        button.click = true;
                        console.log("OK");
                    }
                },400*i,i);
            }
        });

    })();

</script>
</body>
</html>
