require('./todo_list.tag')
var todo_action_creator = require('../actions/todo_action_creator.coffee')

<todo-app>

  <h3>{ opts.title }</h3>

  <todo-list items={ items }></todo-list>

  <div class="actions">
    <button onclick={ add }>Add #{ items.length + 1 }</button>
  </div>

  this.store = opts.store

  add() {
    riot.route('todos/add')
  }

  getDataFromStore() {
    this.items = this.store.getAll()
  }

  updateFromStore() {
    this.getDataFromStore()
    this.update()
  }

  this.on('mount', function() {
    this.store.addChangeListener(this.updateFromStore)
  })

  this.on('unmount', function() {
    this.store.removeChangeListener(this.updateFromStore)
  })

  this.getDataFromStore()

</todo-app>
