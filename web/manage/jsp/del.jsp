<%-- 
    Document   : del
    Created on : 2014-9-12, 19:09:06
    Author     : rjg
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学习间基本信息修改</title>
    </head>
     <jsp:useBean id="modify" class="newpackage.Test"  scope="page" />
    <body>
     
       
         <%
             String str="select *from roomtable";
             ResultSet ret=null;
             
             ret=modify.exeQ(str);
                         String [][]array = new String[10][10];
                          int i=0;
             if(ret==null)
                 out.print("没有数据");
             else
             {
                          while(ret.next()==true)
                         {
                             array[i][0]=ret.getString("number");
                             array[i][1]=ret.getString("size");
                             array[i][2]=ret.getString("peonum");
                            // out.println("<td>"+ret.getArray("number")+"</td><td>"+ret.getArray("size")+"</td><td>"+ret.getArray("peonum")+"</td>");
                             //out.println(ret.getArray(columnLabel));
                           i++;
                         }
             }
             session.setAttribute("table_number",array);
             modify.closeCL();
             modify.closeRs();
             modify.closeSM();
         %> 
    <center>
        <form >
             <table class="table_ifo" border="2px">
            <tr>
                <td>房间编号</td><td>房间大小(m^2)</td><td>房间容纳人数(人)</td><td>是否删除</td>
           </tr>
           <%
             int j;
             for(j=0;j<i;j++)
             {
           %>
           <tr>
               <td><%=array[j][0]%></td> <td><%=array[j][1]%></td> <td><%=array[j][2]%></td>
               <td><a href="/LearningRoom/DelRoom?i=<%=j%>" >删除</a></td>
           </tr>
          <%
             }
          %>
           </table>
        
       
         </form>
        </center>
    </body>
</html>