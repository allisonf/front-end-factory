<table>
    <tbody>
        <g:each in="${components}" var="component">
            <tr>
                <td>Expense:</td>
                <td>${component.description}</td>
                <td>${component.value}</td>
            </tr>
        </g:each>
    </tbody>
</table>