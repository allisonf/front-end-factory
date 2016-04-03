/**
 * Copyright 2016 Experimental Business Model, all rights reserved.
 */

var frontendFactory = {

    emptyAjaxCallback: function (event) {
        $.ajax(
            {
                url: event.url,
                success: function (response) {
                    //alert(response);
                    $('#table-v2-div').html(response);
                },
                error: function (request, status, error) {
                    alert(error);
                }
            }
        )
    },

    simpleDataAjaxCallback: function (event) {
        $.ajax(
            {
                url: event.url,
                data: {
                    componentClassname: event.componentClassname,
                    componentsJson: event.componentsJson,
                    components: event.components
                },
                success: function (response) {
                    //alert(response);
                    $('#table-v3-div').html(response);
                },
                error: function (request, status, error) {
                    alert(error);
                }
            }
        )
    },

    appendRowAjaxCallback: function (event) {
        $.ajax(
            {
                url: event.url,
                data: {
                    componentClassname: event.componentClassname,
                    componentsJson: event.componentsJson
                },
                success: function (response) {
                    //alert(response);
                    $('#table-v4-div').html(response);
                },
                error: function (request, status, error) {
                    alert(error);
                }
            }
        )
    },

    createRowAjaxCallback: function (event) {
        $.ajax(
            {
                url: event.url,
                data: {
                    componentClassname: event.componentClassname,
                    componentsJson: event.componentsJson,
                    indexOfNew: event.indexOfNew,
                    indexField: event.indexField,
                    isNewField: event.isNewField,
                    toBeProcessedField: event.toBeProcessedField
                },
                success: function (response) {
                    //alert(response);
                    //$('#table-v5-div').html(response);
                    $('#render-space-v5').html(response);
                },
                error: function (request, status, error) {
                    alert(error);
                }
            }
        )
    }
}
