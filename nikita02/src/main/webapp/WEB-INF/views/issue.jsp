<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Issue Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>
	Add a Issue
</h1>

<c:url var="addAction" value="/issue/add" ></c:url>

<form:form action="${addAction}" commandName="issue">
<table>
	<c:if test="${!empty issue.firstName}">
	<tr>
		<td>
			<form:label path="issueID">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="issueID" readonly="true"  size="8"  disabled="true" />
			<form:hidden path="issueID" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="firstName">
				<spring:message text="firstName"/>
			</form:label>
		</td>
		<td>
			<form:input path="firstName" required = "true"/>
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="lastName">
				<spring:message text="LastName"/>
			</form:label>
		</td>
		<td>
			<form:input path="lastName" required = "true"/>
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="subject">
				<spring:message text="Subject"/>
			</form:label>
		</td>
		<td>
			<form:input path="subject" required = "true"/>
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="description">
				<spring:message text="Description"/>
			</form:label>
		</td>
		<td>
			<form:input path="description" required = "true"/>
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="status">
				<spring:message text="Status"/>
			</form:label>
		</td>
		<td>
			<form:input path="status" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty issue.firstName}">
				<input type="submit"
					value="<spring:message text="Edit Issue"/>" />
			</c:if>
			<c:if test="${empty issue.firstName}">
				<input type="submit"
					value="<spring:message text="Add Issue"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Issues List</h3>
<c:if test="${!empty listIssues}">
	<table class="tg">
	<tr>
		<th width="80">Issue ID</th>
		<th width="120">First Name</th>
		<th width="120">Last Name</th>
		<th width="80">Subject</th>
		<th width="80">Description</th>
		<th width="80">Status</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listIssues}" var="issue">
		<tr>
			<td>${issue.issueID}</td>
			<td>${issue.firstName}</td>
			<td>${issue.lastName}</td>
			<td>${issue.subject}</td>
			<td>${issue.description}</td>
			<td>${issue.status}</td>
			
			
			<td><a href="<c:url value='/edit/${issue.issueID}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${issue.issueID}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
