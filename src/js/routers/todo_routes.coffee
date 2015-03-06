riot = require 'riot'
require './base_route.coffee'
todo_presenter = require '../presenters/todo_presenter.coffee'

list = -> todo_presenter.list()

add = -> todo_presenter.edit()

edit = (id)-> todo_presenter.edit(id)

routes = riot.route.to \
  '', list,
  'todos/edit/:id', edit,
  'todos/add', add

module.exports = routes
