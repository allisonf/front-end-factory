package ajax.taglib

class AjaxTagLib {
    //static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "ajax"

    // V1: Simple attributes passthrough
    def tableV1 = { attrs, body ->

        out << render(template: '/ajax/tableV1', model: attrs)
    }

    // V2: Clickable row renders new content, unrelated to present content
    def tableV2 = { attrs, body ->

        out << render(template: '/ajax/tableV2', model: attrs)
    }

    def tableV3 = { attrs, body ->

        Class componentClass = attrs.'component-class'
        String componentClassname = componentClass.name

        Map model = [
                components: attrs.components,
                componentClassname: componentClassname
        ]

        out << render(template: '/ajax/tableV3', model: model)
    }

    def tableV4 = { attrs, body ->

        Class componentClass = attrs.'component-class'
        String componentClassname = componentClass.name

        Map model = [
                components: attrs.components,
                componentClassname: componentClassname
        ]

        out << render(template: '/ajax/tableV4', model: model)
    }

    def tableV5 = { attrs, body ->

        Class componentClass = attrs.'component-class'
        String componentClassname = componentClass.name

        String indexField = attrs.'index-field' ?: 'index'
        String isNewField = attrs.'is-new-field' ?: 'isNew'
        String toBeProcessedField = attrs.'to-be-processed-field' ?: 'toBeProcessed'

        Map model = [
                //componentsV5: attrs.components,
                components: attrs.components,
                componentClassname: componentClassname,
                indexField: indexField,
                isNewField: isNewField,
                toBeProcessedField: toBeProcessedField
        ]

        out << render(template: '/ajax/tableV5', model: model)

    }
}
