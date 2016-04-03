package demo.taglib

class MainController {

    def index() {

        List components = []
        components << new ArbitraryCommand(name: 'Meals', value: 1)
        components << new ArbitraryCommand(name: 'Rent', value: 2)
        components << new ArbitraryCommand(name: 'Utilities', value: 3)
        components << new ArbitraryCommand(name: 'Auto', value: 4)

        [components: components]
    }
}
