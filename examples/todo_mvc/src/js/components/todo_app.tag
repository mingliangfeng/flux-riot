require('./todo_list.tag')
var todos = require('../actions/todos.coffee')
var store_mixin = require('./store_mixin.coffee')

<todo-app>

  <h3>{ opts.title }</h3>

  <todo-list items={ items }></todo-list>

  <div class="actions">
    <button onclick={ add }>Add #{ items.length + 1 }</button>
  </div>

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

  store_mixin(this, opts.store, this.updateFromStore)

  this.getDataFromStore()

</todo-app>
