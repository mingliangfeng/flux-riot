riot = require 'riot'
todo_store = require '../stores/todo_store.coffee'
require '../components/todo_app.tag'
require '../components/todo_edit.tag'

app_tag = null

unmount = -> app_tag.unmount() if app_tag
mount = (tag, opts)->
  app_container = document.getElementById('app-container')
  riot.mount '#app-container', tag, opts

module.exports =
  list: ->
    unmount()
    app_tag = mount('todo-app', {
      title: "Todo App",
      store: todo_store
    })[0]

  edit: (id)->
    unmount()
    app_tag = mount('todo-edit', { taskId: id, store: todo_store })[0]
