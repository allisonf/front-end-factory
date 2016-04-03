<%--

 Copyright 2016 Experimental Business Model, all rights reserved.

--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="ajax.taglib.ComponentCommand" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>AJAX TAGLIB!</title>
</head>

<body>

<h1>Table V1: Simple attributes passthrough</h1>
<ajax:tableV1 components="${components}" />

<br /> <br />

<h1>Table V2: (Clickable) Empty Ajax call replaces data</h1>
<ajax:tableV2 components="${components}" />

<h1>Table V3: (Clickable) Ajax call passes components for editing</h1>
<ajax:tableV3 components="${components}" component-class="${ComponentCommand}"/>

<h1>Table V4: (Clickable) Ajax call appends component</h1>
<ajax:tableV4 components="${components}" component-class="${ComponentCommand}" />


<h1>Table V5: (Clickable) Ajax call creates new components</h1>
<div id="render-space-v5">
    <ajax:tableV5 components="${components}"
                  component-class="${ComponentCommand}" />
</div>


</body>
</html>