riot = require 'riot/riot'
BaseRouter = require('flux-riot').BaseRouter
todo_presenter = require '../presenters/todo_presenter.coffee'

BaseRouter.routes todo_presenter.list,
  'todos/add', todo_presenter.edit,
  'todos/edit/:id', todo_presenter.edit

module.exports =
  start: BaseRouter.start
