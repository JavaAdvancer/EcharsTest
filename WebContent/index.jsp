<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<title>图表测试</title>
</head>
<body>
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		//指定图表的配置项和数据
		// 显示标题，图例和空的坐标轴
		myChart.setOption({
			 title: {
	                text: 'ECharts 异步数据加载入门示例'
	            },
	            tooltip: {},
	            legend: {
	                data:['销量']
	            },
	            xAxis: {
	                data: []
	            },
	            yAxis: {},
	            series: [{
	                name: '销量',
	                type: 'bar',
	                data: []
	            }]
		});
		myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
		var names=[];    //类别数组（实际用来盛放X轴坐标值）
        var nums=[];    //销量数组（实际用来盛放Y坐标值）
        
        $.ajax({
        	type: "post",
        	async: true,
        	url: "testServlet",
        	data:{},
        	dataType:"json",
        	success: function(result){
        		if(result){
        			for(var i=0;i<result.length;i++){
        				names.push(result[i].name);  //挨个取出类别并填入类别数组
        				console.log(result[i].name);
        			}
        			for(var i=0;i<result.length;i++){
        				nums.push(result[i].num);//挨个取出销量并填入销量数组
        				console.log(result[i].num);
        			}
        			myChart.hideLoading(); 
        			myChart.setOption({
        				 xAxis: {
                             data: names
                         },
                         series: [{
                             // 根据名字对应到相应的系列
                             name: '销量',
                             data: nums
                         }]
        			});
        		}
        	},
        	error: function(errorMsg){
        		alert("图表请求数据失败！");
        		myChart.hideLoading();
        	}
        })
	</script>
</body>
</html>









