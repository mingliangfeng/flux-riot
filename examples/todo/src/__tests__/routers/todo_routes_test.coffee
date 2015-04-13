helper = require '../support/helper.coffee'
helper.dontMock 'routers/todo_routes.coffee'

riot = require 'riot/riot'

describe 'todo_routes', ->
  todo_presenter = todo_routes = null

  beforeEach ->
    todo_routes = helper.require_src 'routers/todo_routes.coffee'
    todo_presenter = helper.require_src 'presenters/todo_presenter.coffee'

  it 'root routes', ->
    todo_routes.start ''
    setTimeout ->
      expect(todo_presenter.list.mock.calls.length).toBe 1
    , 500

  it 'add routes', ->

    riot.route 'todos/add'
    setTimeout ->
      expect(todo_presenter.edit.mock.calls.length).toBe 1
      paras = todo_presenter.edit.mock.calls[0][0]
      expect(paras).toBe undefined
    , 500

  it 'edit routes', ->
    riot.route 'todos/edit/1'
    setTimeout ->
      expect(todo_presenter.edit.mock.calls.length).toBe 1
      paras = todo_presenter.edit.mock.calls[0][0]
      expect(paras).toBe '1'
    , 500
