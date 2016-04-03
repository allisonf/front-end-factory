package ajax.taglib

class MainController {

    def index() {

        List<ComponentCommand> components = []
        components << new ComponentCommand(index: 0, description: 'Rent', value: 550)
        components << new ComponentCommand(index: 1, description: 'Electricity', value: 90)
        components << new ComponentCommand(index: 2, description: 'Gas', value: 110)
        components << new ComponentCommand(index: 3, description: 'Food', value: 250)

        [components: components]
    }
}
