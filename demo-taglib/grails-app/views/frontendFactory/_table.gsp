<%@ page import="grails.converters.JSON" %>



<div    class="frontendFactoryTable"
        id="frontendFactoryTable${id}"
        template="${template}"
        components="${components as JSON}"
        component-classname="${componentClassname}"
        index-field="${indexField}"
        data-url="${createLink(controller: 'frontendFactoryCallback', action: 'create', absolute: 'true')}"
        >
    <table>
        <tbody>
        <g:each in="${components}" var="component">
            <tr class="clickable-row"
                index-of-new-component="${component."$indexField"}">
                <g:render template="${template}" model="[component: component]" />
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

%{--Make sure deffered scripts is in layout--}%
<asset:script type="text/javascript">
    %{--var url3 = $('#clickableRenderedComponents').attr('data-url');//data("url");--}%
%{--var cmdObject3 = $('#clickableRenderedComponentsTemplate').attr('data-ajax');//data("ajax");--}%
    %{--var cmdObjectClassname3 = $('#clickableRenderedComponents').attr('data-ajax-classname');//data("ajax-classname");--}%
    %{--var indexOfNew = $('#clickableRenderedComponents').attr('data-index-of-new');//data("index-of-new");--}%

    %{--// for each frontendFactoryTable--}%

    %{--var frontendFactoryTableObjects = {}--}%
    %{--for each (var table in $('.frontendFactoryTable')) {--}%
        %{--var id = table.attr('id');--}%
        %{--frontendFactoryTableObjects[id] = {--}%
            %{--url: $('#'+id).data('url'),--}%
            %{--componentClassname:--}%
        %{--}--}%
    %{--}--}%
    %{--var frontendFactoryTableObj = {--}%
        %{--url: $('.frontendFactoryTable').data('url'),--}%
        %{--cmdObjectClassname: cmdObjectClassname3,--}%
        %{--indexOfNew: indexOfNew--}%
    %{--};--}%

    $(document.ready(function() {
        $(document).on('click', '.clickable-row', function () {
            var frontendFactoryTableDiv = $(this).parents('.frontendFactoryTable')[0]
            frontendFactory.createRowCallback({
                url: frontendFactoryTableDiv.data('url'),
                template: frontendFactoryTableDiv.attr('template'),
                indexField: frontendFactoryTableDiv.attr('index-field'),
                frontendFactoryTableDivId: frontendFactoryTableDiv.attr('id'),
                componentClassName: frontendFactoryTableDiv.attr('component-classname'),
                components: frontendFactoryTableDiv.attr('components'),
                indexOfNewComponent: $(this).data('index-of-new-component'),
            });
        });
    });


    %{--$(document).ready(function() {--}%
        %{--$(document).on('click', '#simpleAjaxButton', frontendFactory.simpleAjaxCallback);--}%
        %{--$(document).on('click', '#templatedAjaxButton', frontendFactory.templatedAjaxCallback);--}%
        %{--$(document).on('click', '#viewSentDataAjaxButton', viewSentDataObj, frontendFactory.viewSentDataAjaxCallback);--}%
        %{--$(document).on('click', '#viewSentDataAndUrlAjaxButton', viewSentDataAndUrlObj, frontendFactory.viewSentDataAndUrlAjaxCallback);--}%
        %{--$(document).on('click', '#viewSentCmdObjectAndUrlAjaxButton', viewSentCmdObjectAndUrlObj, frontendFactory.viewSentCmdObjectAndUrlAjaxCallback);--}%
        %{--$(document).on('click', '.clickable-row', function () {--}%
                %{--clickableRenderedComponentsObj.cmdObject = $('#clickableRenderedComponentsTemplate').attr("data-ajax");--}%
                %{--clickableRenderedComponentsObj.indexOfNew = $(this).data("index-of-new");--}%
                %{--frontendFactory.clickableRenderedComponentsCallback(clickableRenderedComponentsObj);--}%
        %{--});--}%
    %{--});--}%

</asset:script>