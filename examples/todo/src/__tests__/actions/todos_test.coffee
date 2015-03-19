helper = require '../support/helper.coffee'
helper.dontMock 'actions/todos.coffee'

AppConstants = helper.require_src 'constants/app_constants.coffee'

describe 'todos', ->
  AppDispatcher = todos = null

  callback = -> AppDispatcher.handleViewAction.mock.calls
  params = -> callback()[0][0]

  beforeEach ->
    AppDispatcher = helper.require_src 'dispatchers/app_dispatcher.coffee'
    todos = helper.require_src 'actions/todos.coffee'

  it 'saveTask', ->
    todos.saveTask title: 'task content'
    expect(callback().length).toBe 1
    expect(params().type).toBe AppConstants.ActionTypes.TASK_SAVE
    expect(params().data.title).toBe 'task content'

  it 'removeTask', ->
    todos.removeTask 'task'
    expect(callback().length).toBe 1
    expect(params().type).toBe AppConstants.ActionTypes.TASK_REMOVE
    expect(params().data).toBe 'task'

  it 'toggleTask', ->
    todos.toggleTask 'task'
    expect(callback().length).toBe 1
    expect(params().type).toBe AppConstants.ActionTypes.TASK_TOGGLE
    expect(params().data).toBe 'task'

  it 'clearTasks', ->
    todos.clearTasks()
    expect(callback().length).toBe 1
    expect(params().type).toBe AppConstants.ActionTypes.TASK_CLEAR
