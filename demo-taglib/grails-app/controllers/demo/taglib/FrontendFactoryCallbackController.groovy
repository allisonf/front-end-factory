package demo.taglib

import com.fasterxml.jackson.databind.ObjectMapper

class FrontendFactoryCallbackController {

    def createRow() {

        String template = params.template
        String indexField = params.indexField
        String componentClassname = params.componentClassname
        Class componentClass = Class.forName(componentClassname)

        int indexOfNewComponent = params.indexOfNewComponent.toInteger()

        ObjectMapper mapper = new ObjectMapper()

        def mappedComponents = params.components.collect { it ->
            mapper.readValue(it, componentClass)
        }
//        def components = mapper.readValue(params.components, List<componentClass>)

        components = components.collect { component ->

            if (component."$indexField" >= indexOfNewComponent) {

                component."$indexField" += 1
            }

            component
        }

        components.add(indexOfNewComponent, componentClass.newInstance(["$indexField": indexOfNewComponent]))

        render (template: '/frontendFactory/table',
                model: [components: components,
                        indexField: indexField,
                        componentClassname: componentClassname,
                        template: template
                ])
    }
}
