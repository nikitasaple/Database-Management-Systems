<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Your Issue</title>
</head>
<body>
<form:form action="addIssue.htm" commandName="issue" method="post"><table>
<tr>
   <td>Name : </td>
   <td><form:input path="name" size="30" />  <font color="red"><form:errors path="name"/></font>  </td>
</tr><tr>
   <td>Subject:</td>
   <td><form:input path="subj" size="30" />
    <font color="red"><form:errors path="subj"/></font> </td>  
</tr><tr>
   <td>Description:</td>
   <td><form:input path="desc" size="30" />
   <font color="red">    <form:errors path="desc"/> </font>
   </td>
</tr><tr>
   <td colspan="2"><input type="submit" value="Create User" /></td>
</tr>
</table></form:form>
</body>
</html>