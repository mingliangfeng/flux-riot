jest.dontMock '../helper.coffee'
helper = require '../helper.coffee'
helper.dontMock 'stores/base_store.coffee'
helper.dontMock 'stores/todo_store.coffee'

AppConstants = helper.require_src 'constants/app_constants.coffee'

describe 'todo_store', ->
  AppDispatcher = todo_store = null

  actionAddTask =
    source: AppConstants.ActionSources.VIEW_ACTION
    action:
      type: AppConstants.ActionTypes.ADD_TASK
      data: 'task'

  beforeEach ->
    AppDispatcher = helper.require_src 'dispatchers/app_dispatcher.coffee'
    todo_store = helper.require_src 'stores/todo_store.coffee'

  it 'rigster a callback', ->
    expect(AppDispatcher.register.mock.calls.length).toBe 1

  it 'initialize store with 5 items', ->
    tasks = todo_store.getAll()
    expect(tasks.length).toBe 5

  it 'add task', ->
    spyOn todo_store, 'emitChange'
    callback = AppDispatcher.register.mock.calls[0][0]
    callback actionAddTask
    tasks = todo_store.getAll()
    expect(tasks.length).toBe 6
    expect(tasks[tasks.length - 1].title).toBe 'task'

    expect(todo_store.emitChange).toHaveBeenCalled()
