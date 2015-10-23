helper = require '../support/helper.coffee'
helper.dontMock 'actions/todos.coffee'

ActionTypes = helper.require_src('constants/app_constants.coffee').ActionTypes

describe 'todos', ->
  Dispatcher = todos = null

  callback = -> Dispatcher.handleViewAction.mock.calls
  params = -> callback()[0][0]

  beforeEach ->
    Dispatcher = require('flux-riot').Dispatcher
    spyOn Dispatcher, 'handleViewAction'
    todos = helper.require_src 'actions/todos.coffee'

  it 'saveTask', ->
    todos.saveTask title: 'task content'
    expect(Dispatcher.handleViewAction).toHaveBeenCalledWith
      type: ActionTypes.TASK_SAVE,
      data:
        title: 'task content'

  it 'removeTask', ->
    todos.removeTask 'task'
    expect(Dispatcher.handleViewAction).toHaveBeenCalledWith
      type: ActionTypes.TASK_REMOVE,
      data: 'task'

  it 'toggleTask', ->
    todos.toggleTask 'task'
    expect(Dispatcher.handleViewAction).toHaveBeenCalledWith
      type: ActionTypes.TASK_TOGGLE,
      data: 'task'

  it 'clearTasks', ->
    todos.clearTasks()
    expect(Dispatcher.handleViewAction).toHaveBeenCalledWith
      type: ActionTypes.TASK_CLEAR
