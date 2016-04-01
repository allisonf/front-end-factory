package demo.remote.function

import com.fasterxml.jackson.databind.ObjectMapper

class DemoController {

    def index() {

        CommandObject cmdObject = new CommandObject()
        cmdObject.elements << new Element(index: 0, data: 1)
        cmdObject.elements << new Element(index: 1, data: 2)
        cmdObject.elements << new Element(index: 2, data: 3)
        cmdObject.elements << new Element(index: 3, data: 4)

        [cmdObject: cmdObject]
    }

    def simpleAjaxServersideAction() {

        [msg: 'Message from simpleAjaxCall action']
    }

    def templatedAjaxServersideAction() {

        render template: '/demo/templatedAjaxTemplate', model: [msg: 'Message from templatedAjaxCall action']
    }

    def viewSentDataAjaxServersideAction(String msg) {

        render template: '/demo/viewSentDataAjaxTemplate', model: [msg: msg]
    }

    def viewSentDataAndUrlAjaxServersideAction(String msg) {

        render template: '/demo/viewSentDataAndUrlAjaxTemplate', model: [msg: msg]
    }

    def viewSentCmdObjectAndUrlServersideAction() {

        String cmdObjectClassname = params.cmdObjectClassname
        Class cmdObjectClass = Class.forName(cmdObjectClassname)

        ObjectMapper mapper = new ObjectMapper()
        CommandObject cmdObject = mapper.readValue(params.cmdObject, cmdObjectClass)

        cmdObject.elements << new Element(index: 4, data: 5)

        render template: '/demo/viewSentCmdObjectAndUrlTemplate', model: [cmdObject: cmdObject]
    }

    // Add a new element at index
    // In real version, use expand list functions
    def clickableRenderedComponentsServersideAction() {

        String cmdObjectClassname = params.cmdObjectClassname
        Class cmdObjectClass = Class.forName(cmdObjectClassname)

        int indexOfNew = params.indexOfNew.toInteger()

        ObjectMapper mapper = new ObjectMapper()
        CommandObject cmdObject = mapper.readValue(params.cmdObject, cmdObjectClass)

        cmdObject.elements = cmdObject.elements.collect { element ->

            if (element.index >= indexOfNew) {

                element.index += 1
            }

            element
        }

        // TODO: Do I need indexOfNew - 1???
        cmdObject.elements.add(indexOfNew, new Element(index: indexOfNew))

        render template: '/demo/clickableRenderedComponentsTemplate', model: [templateCmdObject: cmdObject]
    }

}
