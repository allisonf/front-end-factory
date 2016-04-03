<%@ page import="grails.converters.JSON" %>

<div id="table-v3-div"
     data-url="${createLink(controller: 'ajaxCallback', action: 'simpleDataAjaxServersideAction', absolute: true)}"
     data-components-json="${components as JSON}"
     data-components="${components}",
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
        %{--document.getElementById('electriccars');--}%
            %{--var tableV3Div = $('#table-v3-div')--}%
            var tableV3Div = document.getElementById('table-v3-div');
            frontendFactory.simpleDataAjaxCallback(
                {
                    url: tableV3Div.dataset.url,
                    componentsJson: tableV3Div.dataset.componentsJson,
                    components: tableV3Div.dataset.components,
                    componentClassname: tableV3Div.dataset.componentClassname
                }
            );
        });
    });
</asset:script>