<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@taglib uri="http://java.sun.com/jstl/sql" prefix="sql" %>
<%@taglib uri="/action" prefix="a" %>

<title>Insert title here</title>
</head>
<body>
表达式：算术${1+2}<br/>
比较: ${1<2} :${1 lt 2}  
<jsp:useBean id="userBean"  class="bean.userBean" scope="page"></jsp:useBean>
<jsp:setProperty property="name" name="userBean" value="帅哥"/>
获取属性：<jsp:getProperty property="name" name="userBean"/> :<%=userBean.getName() %>: ${userBean['name']}
<jsp:setProperty property="name" name="userBean" value="帅哥1"/>


<c:set target="${userBean}" property="name">孤傲苍狼</c:set>
获取属性：<jsp:getProperty property="name" name="userBean"/>
<h3>fn:toLowerCase函数使用范例：</h3>
        <%--fn:toLowerCase函数将一个字符串中包含的所有字符转换为小写形式，并返回转换后的字符串，
        它接收一个字符串类型的参数。fn:toLowerCase("")的返回值为空字符串--%>
        <%--fn:toLowerCase("Www.CNBLOGS.COM") 的返回值为字符串“www.cnblogs.com” --%>
        c:toLowerCase("Www.CNBLOGS.COM")的结果是：${fn:toLowerCase("Www.CNBLOGS.COM") }
        <hr/>
        <c:remove var="userBean"/>
        <c:catch var="errorInfo">
        	<jsp:getProperty property="name" name="userBean"/>
        </c:catch>
        异常：<c:out value="${errorInfo }"/><br/>
      异常 errorInfo.getMessage：<c:out value="${errorInfo.message }"></c:out><br/>
      异常 errorInfo.getCause： <c:out value="${errorInfo.cause }"></c:out><br/>
      异常 errorInfo.getStackTrace：    <c:out value="${errorInfo.stackTrace }"></c:out>
        <c:if test="${errorInfo ne null }" var="resutl" scope="page">
        	结果<c:out value="${resutl}"></c:out>
        </c:if>
   <br/>
        
   <h3>if标签的例子:</h1>     
    	<c:set var="score" value="0"></c:set>
        <c:choose>
        	<c:when test="${score>=90 }">牛逼啊</c:when>
        	<c:when test="${score>=70 }">可以啊</c:when>
        	<c:otherwise>弱鸡</c:otherwise>
        </c:choose>
    <h3>循环标签</h1>    
        <%
			List<String> list=new ArrayList<String>();
        	list.add("one");
        	list.add("two");
        	list.add("three");
        	list.add("four");
        	list.add("five");
        	list.add("six");
        	list.add("sevent");
        	request.setAttribute("list", list);
        %>
        <c:out value="不带起始和结束"><br></c:out>
        <c:forEach var="va" items="${list}">
        	<c:out value="${va}"></c:out>
        </c:forEach>
        <br/><c:out value="begin起始位置，end结束位置，step自增数 varStatus当前信息"></c:out><br/>
        <c:forEach var="va" items="${list}" begin="0" end="5" step="2" varStatus="s">
                    值:<c:out value="${va}"/>
                    下标：<c:out value="${s.index}" />
                    是否是第一： <c:out value="${s.first}" />
                    是否是最后一个： <c:out value="${s.last}" />
        <br/>
        </c:forEach>
    	<br/>
    	<h3>字符串的循环</h3>
    	var：元素；items：要循环的字符串；delims：分隔符；begin起始位置；end结束位置;step自增；varStatus位置信息。
    	可以根据分隔符进行分割成数组在进行循环<br/>
    	<c:forTokens items="1*2*3*4*5*6*7" var="v" delims="*" begin="1" end="5" step="1" varStatus="s">
    	元素:<c:out value="${v}"></c:out>
    	所在位置，即索引：<c:out value="${s.index}" />
    	总共已迭代的次数：<c:out value="${s.count}" />
    	是否为第一个位置：<c:out value="${s.first}" />
    	是否为最后一个位置：<c:out value="${s.last}" />
    	<br/>
    	</c:forTokens>
    	<br/>
    	<%-- <c:import url="https://www.baidu.com/"></c:import> --%>
    	
    	<h3>自定义标签库</h3>
    	自定义方法： ${a:action("傻嘛你") } <br/>
    	自定义标签类： <a:demo1 count="3">傻吗你</a:demo1><br/>
    	
    	
    	<h3>xml标签库</h3>
    	<c:import url="http://localhost:8080/jspStudey/test.xml" var="bookInfo"/>
    	<c:import url="http://localhost:8080/jspStudey/test.xsl" var="xslt"/>
    	<x:parse xml="${bookInfo }" var="output"/>
    	 <%-- <x:out select="$output/books/book[1]/name" /> --%>
    	 <x:transform xml="${bookInfo }" xslt="${xslt}"/>
    	 
    	 
    	 <h3>sql标签</h3>
    	 <sql:setDataSource var="con" 
    	 driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" 
    	 url="jdbc:sqlserver://localhost:1433;databaseName=work" user="sa" password="sasa"/>
    	 <sql:query var="result" dataSource="${con }" >select * from stu;</sql:query>
    	 <c:forEach var="row" items="${result.rows }">
    	 	<c:out value="${row.stuId }"></c:out>
    	 	<c:out value="${row.stuname }"/>
    	 </c:forEach>
 		<%--  <sql:update dataSource="${con }" var="result" >insert into stu values(1006,'gaoxiao2',20,80);</sql:update> --%>   	 
		<c:set var="empId" value="1003"></c:set>
		<sql:update dataSource="${con}" var="count" >
  			delete from stu where stuId=?;
 			<sql:param value="${empId}" />
		</sql:update>
		<c:if test="${count eq 0}">没有删除数据</c:if>
</html>