<%@ page import="grails.converters.JSON" %>

<div id="table-v5-div"
     data-url="${createLink(controller: 'ajaxCallback', action: 'createRowAjaxServersideAction', absolute: true)}"
     %{--data-components-json="${componentsV5 as JSON}"--}%
     data-components-json="${components as JSON}"
     data-component-classname="${componentClassname}"
     data-index-field="${indexField}"
     data-is-new-field="${isNewField}"
     to-be-processed-field="${toBeProcessedField}">
    <table>
        <tbody>
        %{--<g:each in="${componentsV5}" var="component">--}%
        <g:each in="${components}" var="component">
            <tr class="clickable-v5-row" data-index-of-new="${component."$indexField"}">
                <td>Expense:</td>
                <td>${component.description}</td>
                <td>${component.value}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<asset:script type="text/javascript">
    $(document).ready( function () {
        $(document).on('click', '.clickable-v5-row', function () {
            var tableV5Div = document.getElementById('table-v5-div');
            frontendFactory.createRowAjaxCallback(
                {
                    url: tableV5Div.dataset.url,
                    componentsJson: tableV5Div.dataset.componentsJson,
                    componentClassname: tableV5Div.dataset.componentClassname,
                    indexOfNew: $(this).data("index-of-new"),
                    indexField: tableV5Div.dataset.indexField,
                    isNewField: tableV5Div.dataset.isNewField,
                    toBeProcessedField: tableV5Div.dataset.toBeProcessedField
                }
            );
        });
    });
</asset:script>