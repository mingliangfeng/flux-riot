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
    expect(todo_presenter.list.mock.calls.length).toBe 1

  # as jest mocks setTimeout, have to use runs / waitsFor
  # see http://jasmine.github.io/1.3/introduction.html#section-Asynchronous_Support
  it 'add routes', ->
    runs ->
      riot.route 'todos/add'

    waitsFor ->
      return todo_presenter.edit.mock.calls.length == 1
    , 'presenter to be called', 1000

    runs ->
      calls = todo_presenter.edit.mock.calls
      expect(calls.length).toBe 1
      paras = calls[0][0]
      expect(paras).toBe undefined

  it 'edit routes', ->
    runs ->
      riot.route 'todos/edit/1'

    waitsFor ->
      return todo_presenter.edit.mock.calls.length == 1
    , 'presenter to be called', 1000

    runs ->
      calls = todo_presenter.edit.mock.calls
      expect(calls.length).toBe 1
      paras = calls[0][0]
      expect(paras).toBe '1'
