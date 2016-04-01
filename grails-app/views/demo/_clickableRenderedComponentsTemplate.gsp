<%@ page import="grails.converters.JSON" %>

<div    id="clickableRenderedComponentsTemplate"
        data-ajax="${templateCmdObject as JSON}">
    <h1>Clickable Rendered Components Ajax</h1>
    <table>
        <tbody>
        <g:each in="${templateCmdObject.elements}" var="element">
            <tr class="clickable-row" data-index-of-new="${element.index}">
                <td>
                    Element:
                </td>
                <td>
                    ${element.data}
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
%{--<asset:script type="text/javascript">--}%


    %{--var url3 = $('#clickableRenderedComponents').data("url");--}%
    %{--var cmdObject3 = $('#clickableRenderedComponents').data("ajax");--}%
    %{--var cmdObjectClassname3 = $('#clickableRenderedComponents').data("ajax-classname");--}%

    %{--var clickableRenderedComponentsObj = {--}%
        %{--url: url3,--}%
        %{--cmdObject: cmdObject3,--}%
        %{--cmdObjectClassname: cmdObjectClassname3--}%
    %{--};--}%

    %{--$(".clickable-row").click(function () {--}%
        %{--clickableRenderedComponentsObj.index = $(this).data("index");--}%
        %{--clickableRenderedComponentsCallback(clickableRenderedComponentsObj);--}%
    %{--});--}%

%{--</asset:script>--}%