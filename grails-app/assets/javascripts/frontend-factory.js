/**
 * Copyright 2016 Experimental Business Model, all rights reserved.
 */

var frontendFactory = {

    simpleAjaxCallback: function (event) {
        // 1) Call Grails action and get the rendered html
        // Ajax call
        $.ajax(
            {
                url: 'http://localhost:8080/demo/simpleAjaxServersideAction',
                //dataType: 'html',
                //data: {
                //    data: 'HELLO FROM frontend-factory.js',
                //},
                // 2) Fill index.gsp div with that html (#greetingBox)
                success: function (response) {
                    //alert(response);
                    $('#simpleAjaxBox').html(response);
                }
                ,
                error: function (request, status, error) {
                    alert(error);
                }
            //,
            //complete: function(data) {
            //}
        });
    },

    templatedAjaxCallback: function (event) {
        $.ajax(
            {
                url: 'http://localhost:8080/demo/templatedAjaxServersideAction',
                success: function (response) {
                    //alert(response);
                    $('#templatedAjaxBox').html(response);
                },
                error: function (request, status, error) {
                    alert(error);
                }
            }
        )
    },

    viewSentDataAjaxCallback: function (event) {
        $.ajax(
            {
                url: 'http://localhost:8080/demo/viewSentDataAjaxServersideAction',
                data: event.data,
                success: function (response) {
                    //alert(response);
                    $('#viewSentDataAjaxBox').html(response);
                },
                error: function (request, status, error) {
                    alert(error);
                }
            }
        )
    },

    viewSentDataAndUrlAjaxCallback: function (event) {

        $.ajax(
            {
                url: event.data.url,
                data: event.data,
                success: function (response) {
                    //alert(response);
                    $('#viewSentDataAndUrlAjaxBox').html(response);
                },
                error: function (request, status, error) {
                    alert(error);
                }
            }
        )
    },

    viewSentCmdObjectAndUrlAjaxCallback: function (event) {

        $.ajax(
            {
                url: event.data.url,
                data: event.data,
                success: function (response) {
                    //alert(response);
                    $('#viewSentCmdObjectAndUrlAjaxBox').html(response);
                },
                error: function (request, status, error) {
                    alert(error);
                }
            }
        )
    },

    clickableRenderedComponentsCallback: function (event) {

        var data = {
            cmdObject: event.cmdObject,
            cmdObjectClassname: event.cmdObjectClassname,
            indexOfNew: event.indexOfNew
        };

        $.ajax(
            {
                url: event.url,
                data: data,
                success: function (response) {
                    //alert(response);
                    $('#clickableRenderedComponents').html(response);
                },
                error: function (request, status, error) {
                    alert(error);
                }
            }
        )
    }

}

