<%--

 Copyright 2016 Experimental Business Model, all rights reserved.

--%>
<%@ page import="grails.converters.JSON" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Simple Ajax</title>
    <g:javascript library="jquery"/>
</head>
<body>
<div id="simpleAjaxBox">
    DEFAULT SIMPLE
</div>
<div>
    <button id="simpleAjaxButton">Simple Ajax</button>
</div>

<div id="templatedAjaxBox">
    DEFAULT TEMPLATED
</div>
<div>
    <button id="templatedAjaxButton">Templated Ajax</button>
</div>

<div id="viewSentDataAjaxBox">
    DEFAULT VIEW SENT DATA
</div>
<div>
    <button id="viewSentDataAjaxButton">View Sent Data Ajax</button>
</div>

<div id="viewSentDataAndUrlAjaxBox">
    DEFAULT VIEW SENT DATA AND URL
</div>
<div>
    <button id="viewSentDataAndUrlAjaxButton"
            data-url="${createLink(controller: 'demo', action: 'viewSentDataAndUrlAjaxServersideAction', absolute: 'true')}">
        View Sent Data and Url Ajax
    </button>
</div>

<div id="viewSentCmdObjectAndUrlAjaxBox">
    %{-- Initial state... to be overridden, through ajax, with same template but expanded model --}%
    <g:render template="viewSentCmdObjectAndUrlTemplate" model="${cmdObject}" />
</div>
<div>
    <button id="viewSentCmdObjectAndUrlAjaxButton"
            data-url="${createLink(controller: 'demo', action: 'viewSentCmdObjectAndUrlServersideAction', absolute: 'true')}"
            ajax-data="${cmdObject as JSON}"
            ajax-data-classname="${cmdObject.class.name}">
        View Sent Cmd Object and Url Ajax
    </button>
</div>

<div id="clickableRenderedComponents"
     data-url="${createLink(controller: 'demo', action: 'clickableRenderedComponentsServersideAction', absolute: 'true')}"
     %{--data-ajax="${cmdObject as JSON}"--}%
     data-ajax-classname="${cmdObject.class.name}">
    <g:render template="clickableRenderedComponentsTemplate" model="[templateCmdObject: cmdObject]" />
</div>

<asset:script type="text/javascript">

    var viewSentDataObj = {
        msg: "view sent data!"
    };

    var url1 = $('#viewSentDataAndUrlAjaxButton').attr('data-url');

    var viewSentDataAndUrlObj = {
        url: url1,
        msg: "view sent data!"
    };

    var url2 = $('#viewSentCmdObjectAndUrlAjaxButton').attr('data-url');
    var cmdObject = $('#viewSentCmdObjectAndUrlAjaxButton').attr('ajax-data');
    var cmdObjectClassname = $('#viewSentCmdObjectAndUrlAjaxButton').attr('ajax-data-classname');

    var viewSentCmdObjectAndUrlObj = {
        url: url2,
        cmdObject: cmdObject,
        cmdObjectClassname: cmdObjectClassname
    };

    var url3 = $('#clickableRenderedComponents').attr('data-url');//data("url");
    %{--var cmdObject3 = $('#clickableRenderedComponentsTemplate').attr('data-ajax');//data("ajax");--}%
    var cmdObjectClassname3 = $('#clickableRenderedComponents').attr('data-ajax-classname');//data("ajax-classname");
    var indexOfNew = $('#clickableRenderedComponents').attr('data-index-of-new');//data("index-of-new");

    var clickableRenderedComponentsObj = {
        url: url3,
        %{--cmdObject: cmdObject3,--}%
        cmdObjectClassname: cmdObjectClassname3,
        indexOfNew: indexOfNew
    };

    %{--$(document).ready(function() {--}%
        %{--$("#simpleAjaxButton").click(frontendFactory.simpleAjaxCallback);--}%
        %{--$("#templatedAjaxButton").click(frontendFactory.templatedAjaxCallback);--}%
        %{--$("#viewSentDataAjaxButton").click(viewSentDataObj, frontendFactory.viewSentDataAjaxCallback);--}%
        %{--$("#viewSentDataAndUrlAjaxButton").click(viewSentDataAndUrlObj, frontendFactory.viewSentDataAndUrlAjaxCallback);--}%
        %{--$("#viewSentCmdObjectAndUrlAjaxButton").click(viewSentCmdObjectAndUrlObj, frontendFactory.viewSentCmdObjectAndUrlAjaxCallback);--}%
        %{--$(".clickable-row").click(function () {--}%
            %{--clickableRenderedComponentsObj.indexOfNew = $(this).data("index-of-new");--}%
            %{--frontendFactory.clickableRenderedComponentsCallback(clickableRenderedComponentsObj);--}%
        %{--});--}%

    %{--});--}%
    $(document).ready(function() {
        $(document).on('click', '#simpleAjaxButton', frontendFactory.simpleAjaxCallback);
        $(document).on('click', '#templatedAjaxButton', frontendFactory.templatedAjaxCallback);
        $(document).on('click', '#viewSentDataAjaxButton', viewSentDataObj, frontendFactory.viewSentDataAjaxCallback);
        $(document).on('click', '#viewSentDataAndUrlAjaxButton', viewSentDataAndUrlObj, frontendFactory.viewSentDataAndUrlAjaxCallback);
        $(document).on('click', '#viewSentCmdObjectAndUrlAjaxButton', viewSentCmdObjectAndUrlObj, frontendFactory.viewSentCmdObjectAndUrlAjaxCallback);
        $(document).on('click', '.clickable-row', function () {
                clickableRenderedComponentsObj.cmdObject = $('#clickableRenderedComponentsTemplate').attr("data-ajax");
                clickableRenderedComponentsObj.indexOfNew = $(this).data("index-of-new");
                frontendFactory.clickableRenderedComponentsCallback(clickableRenderedComponentsObj);
        });
    });

</asset:script>
</body>
</html>