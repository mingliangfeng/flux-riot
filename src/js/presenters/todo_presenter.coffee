riot = require 'riot'
todo_store = require '../stores/todo_store.coffee'
require '../components/todo_app.tag'
require '../components/todo_edit.tag'

app_container = document.getElementById('app-container')
app_tag = null

unmount = -> app_tag.unmount() if app_tag
mount = (tag, opts)-> riot.mount app_container, tag, opts

module.exports =
  list: ->
    unmount()
    app_tag = mount 'todo-app', {
      title: "Todo App",
      store: todo_store
    }

  edit: ->
    unmount()
    app_tag = mount 'todo-edit'
