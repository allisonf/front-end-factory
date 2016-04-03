<div id="table-v2-div" data-url="${createLink(controller: 'ajaxCallback', action: 'emptyAjaxServersideAction', absolute: true)}">
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
            frontendFactory.emptyAjaxCallback(
                {
                    url: $('#table-v2-div').data('url')
                }
            );
        });
    });
</asset:script>