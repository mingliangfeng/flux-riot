helper = require '../support/helper.coffee'
helper.dontMock 'stores/todo_store.coffee'

AppConstants = helper.require_src 'constants/app_constants.coffee'

describe 'todo_store', ->
  AppDispatcher = todo_store = callback =null
  saveTask = toggleTask = removeTask = null

  beforeEach ->
    AppDispatcher = helper.require_src 'dispatchers/app_dispatcher.coffee'
    todo_store = helper.require_src 'stores/todo_store.coffee'
    callback = AppDispatcher.register.mock.calls[0][0]

    saveTask =
      source: AppConstants.ActionSources.VIEW_ACTION
      action:
        type: AppConstants.ActionTypes.TASK_SAVE
        data: { title: 'task' }

    toggleTask =
      source: AppConstants.ActionSources.VIEW_ACTION
      action:
        type: AppConstants.ActionTypes.TASK_TOGGLE
        data: { done: false }

    removeTask =
      source: AppConstants.ActionSources.VIEW_ACTION
      action:
        type: AppConstants.ActionTypes.TASK_REMOVE
        data: todo_store.getAll()[0]

  it 'rigster a callback', ->
    expect(AppDispatcher.register.mock.calls.length).toBe 1

  it 'initialize store with 5 items', ->
    tasks = todo_store.getAll()
    expect(tasks.length).toBe 5

  describe 'add task', ->
    it 'add valid task', ->
      spyOn todo_store, 'emitChange'

      callback saveTask
      tasks = todo_store.getAll()
      expect(tasks.length).toBe 6
      expect(tasks[tasks.length - 1].title).toBe 'task'

      expect(todo_store.emitChange).toHaveBeenCalled()

    it 'add empty task', ->
      spyOn todo_store, 'emitChange'
      saveTask.action.data = ''
      callback saveTask
      expect(todo_store.getAll().length).toBe 5
      expect(todo_store.emitChange).not.toHaveBeenCalled()

  it 'toggle task', ->
    callback toggleTask
    expect(toggleTask.action.data.done).toBe true

  it 'remove task', ->
    spyOn todo_store, 'emitChange'
    tasks = todo_store.getAll()
    task = removeTask.action.data
    expect(task in tasks).toBe true

    callback removeTask

    tasks = todo_store.getAll()
    expect(task in tasks).toBe false
    expect(tasks.length).toBe 4

    expect(todo_store.emitChange).toHaveBeenCalled()
