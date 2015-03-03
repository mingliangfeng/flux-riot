jest.dontMock '../helper.coffee'
helper = require '../helper.coffee'
helper.dontMock 'actions/todos.coffee'

AppConstants = helper.require_src 'constants/app_constants.coffee'

describe 'todos', ->
  AppDispatcher = todos = null

  beforeEach ->
    AppDispatcher = helper.require_src 'dispatchers/app_dispatcher.coffee'
    todos = helper.require_src 'actions/todos.coffee'

  it 'addTask', ->
    todos.addTask 'task content'
    expect(AppDispatcher.handleViewAction.mock.calls.length).toBe 1

    paras = AppDispatcher.handleViewAction.mock.calls[0][0]
    expect(paras.type).toBe AppConstants.ActionTypes.ADD_TASK
    expect(paras.data).toBe 'task content'

  it 'removeTask', ->
    todos.removeTask 'task'
    expect(AppDispatcher.handleViewAction.mock.calls.length).toBe 1

    paras = AppDispatcher.handleViewAction.mock.calls[0][0]
    expect(paras.type).toBe AppConstants.ActionTypes.REMOVE_TASK
    expect(paras.data).toBe 'task'

  it 'toggleTask', ->
    todos.toggleTask 'task'
    expect(AppDispatcher.handleViewAction.mock.calls.length).toBe 1

    paras = AppDispatcher.handleViewAction.mock.calls[0][0]
    expect(paras.type).toBe AppConstants.ActionTypes.TOGGLE_TASK
    expect(paras.data).toBe 'task'

  it 'clearTasks', ->
    todos.clearTasks()
    expect(AppDispatcher.handleViewAction.mock.calls.length).toBe 1

    paras = AppDispatcher.handleViewAction.mock.calls[0][0]
    expect(paras.type).toBe AppConstants.ActionTypes.CLEAR_TASKS
