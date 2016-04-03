/**
 * Copyright 2016 Experimental Business Model, all rights reserved.
 */

var frontendFactory = {

    createRowCallback: function (event) {

        var data = {
            components: event.components,
            componentClassname: event.componentClassname,
            indexOfNewComponent: event.indexOfNewComponent,
            template: event.template,
            indexField: event.indexField
        };

        $.ajax(
            {
                url: event.url,
                data: data,
                success: function (response) {
                    //alert(response);
                    $('#' + event.frontendFactoryTableDivId).html(response);
                },
                error: function (request, status, error) {
                    alert(error);
                }
            }
        )
    }
}
