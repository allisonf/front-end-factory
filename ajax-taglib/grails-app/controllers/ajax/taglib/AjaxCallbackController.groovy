package ajax.taglib

import com.fasterxml.jackson.databind.ObjectMapper

class AjaxCallbackController {

    def emptyAjaxServersideAction() {

        List<ComponentCommand> components = []
        components << new ComponentCommand(description: 'Rent', value: 650)
        components << new ComponentCommand(description: 'Electricity', value: 95)
        components << new ComponentCommand(description: 'Gas', value: 123)
        components << new ComponentCommand(description: 'Food', value: 320)

        render template: '/ajax/tableV2', model: [components: components]
    }

    def simpleDataAjaxServersideAction() {

        ObjectMapper mapper = new ObjectMapper()
        List components = mapper.readValue(params.componentsJson, List)

        // Do a mod
        components.each {
            it.value += 7
        }

        render template: '/ajax/tableV3', model: [components: components]
    }

    def appendRowAjaxServersideAction() {


        String componentClassname = params.componentClassname
        Class componentClass = Class.forName(componentClassname)

        ObjectMapper mapper = new ObjectMapper()
        List components = mapper.readValue(params.componentsJson, List)

        // Do append
        components << componentClass.newInstance()

        render template: '/ajax/tableV4', model: [components: components]
    }

    def createRowAjaxServersideAction() {

        String indexField = params.indexField
        int indexOfNew = params.indexOfNew.toInteger()

        String componentClassname = params.componentClassname
        Class componentClass = Class.forName(componentClassname)

        ObjectMapper mapper = new ObjectMapper()
        List components = mapper.readValue(params.componentsJson, List)

        List shiftedComponents = components.collect { component ->

            if (component."$indexField" >= indexOfNew) {

                component."$indexField" += 1
            }

            component
        }

        def newComponent = componentClass.newInstance()
        newComponent."$indexField" = indexOfNew

        shiftedComponents.add(indexOfNew, newComponent)

        render template: '/ajax/tableV5', model: [
//                componentsV5: shiftedComponents,
                components: shiftedComponents,
                componentClassname: componentClassname,
                indexField: indexField,
                isNewField: params.isNewField,
                toBeProcessedField: params.toBeProcessedField
        ]
    }
}
