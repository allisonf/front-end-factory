package demo.taglib

class FrontEndFactoryTagLib {
    //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = 'fef'


    def table = { attrs, body ->

        // does table-components become attrs.table.components???
        //List tableComponentsList = attrs.tablecomponents

        out << render(
                template: '/frontendFactory/table',
                model: [components: attrs['table-components'],
                        indexField: attrs['index-field'],
                        componentClassname: attrs['component-classname'], // needs to come from attrs in case model is empty
                        template: attrs.template] // this can default to fields plugin? in next version
        )
    }
}
