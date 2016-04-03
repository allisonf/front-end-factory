<%@ page import="grails.converters.JSON" %>

<div id="table-v4-div"
     data-url="${createLink(controller: 'ajaxCallback', action: 'appendRowAjaxServersideAction', absolute: true)}"
     data-components-json="${components as JSON}"
     data-component-classname="${componentClassname}">
    <table>
        <tbody>
        <g:each in="${components}" var="component">
            <tr class="clickable-row">
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
        $(document).on('click', '.clickable-row', function () {
            var tableV4Div = document.getElementById('table-v4-div');
            frontendFactory.appendRowAjaxCallback(
                {
                    url: tableV4Div.dataset.url,
                    componentsJson: tableV4Div.dataset.componentsJson,
                    componentClassname: tableV4Div.dataset.componentClassname
                }
            );
        });
    });
</asset:script>