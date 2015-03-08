riot = require 'riot'
base_route = require './base_route.coffee'
todo_presenter = require '../presenters/todo_presenter.coffee'

base_route.routes todo_presenter.list,
  'todos/edit/:id', todo_presenter.edit,
  'todos/add', todo_presenter.edit

module.exports =
  start: base_route.start
