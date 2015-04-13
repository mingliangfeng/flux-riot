riot = require 'riot/riot'
flux_riot = require 'flux-riot'
todo_presenter = require '../presenters/todo_presenter.coffee'

flux_riot.BaseRouter.routes todo_presenter.list,
  'todos/edit/:id', todo_presenter.edit,
  'todos/add', todo_presenter.edit

module.exports =
  start: flux_riot.BaseRouter.start
