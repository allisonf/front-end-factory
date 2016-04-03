<%--

 Copyright 2016 Experimental Business Model, all rights reserved.

--%>

<%@ page import="demo.taglib.ArbitraryCommand" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>INDEX!</title>
</head>

<body>
%{--table-id must be unique among fef:tables--}%
    <fef:table table-id="1"
               components="${components}"
               component-classname="${ArbitraryCommand.name}"
               index-field="index"
               template=""



    >

    </fef:table>

</body>
</html>