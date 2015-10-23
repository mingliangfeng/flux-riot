helper = require '../support/helper.coffee'
helper.dontMock 'stores/todo_store.coffee'
ActionSources = require('flux-riot').Constants.ActionSources
ActionTypes = helper.require_src('constants/app_constants.coffee').ActionTypes

describe 'todo_store', ->
  Dispatcher = todo_store = null

  beforeEach ->
    Dispatcher = require('flux-riot').Dispatcher

  it 'rigster a callback', ->
    spyOn Dispatcher, 'register'
    todo_store = helper.require_src 'stores/todo_store.coffee'
    expect(Dispatcher.register).toHaveBeenCalled()

  describe 'after register', ->
    beforeEach ->
      todo_store = helper.require_src 'stores/todo_store.coffee'

    describe 'toggle and remove', ->
      toggleTask = removeTask = null

      beforeEach ->
        todo_store = helper.require_src 'stores/todo_store.coffee'

        toggleTask =
          source: ActionSources.VIEW_ACTION
          action:
            type: ActionTypes.TASK_TOGGLE
            data: { done: false }

        removeTask =
          source: ActionSources.VIEW_ACTION
          action:
            type: ActionTypes.TASK_REMOVE
            data: todo_store.getAll()[0]

      it 'initialize store with 5 items', ->
        tasks = todo_store.getAll()
        expect(tasks.length).toBe 5

      it 'toggle task', ->
        Dispatcher.dispatch toggleTask
        expect(toggleTask.action.data.done).toBe true

      it 'remove task', ->
        spyOn todo_store, 'emitChange'
        tasks = todo_store.getAll()
        task = removeTask.action.data
        expect(task in tasks).toBe true

        Dispatcher.dispatch removeTask

        tasks = todo_store.getAll()
        expect(task in tasks).toBe false
        expect(tasks.length).toBe 4

        expect(todo_store.emitChange).toHaveBeenCalled()

    describe 'add task', ->
      saveTask = null

      beforeEach ->
        spyOn todo_store, 'emitChange'
        saveTask =
          source: ActionSources.VIEW_ACTION
          action:
            type: ActionTypes.TASK_SAVE
            data: { title: 'task' }

      it 'add valid task', ->
        Dispatcher.dispatch saveTask

        tasks = todo_store.getAll()
        expect(tasks.length).toBe 6
        expect(tasks[tasks.length - 1].title).toBe 'task'

        expect(todo_store.emitChange).toHaveBeenCalled()

      it 'add empty task', ->
        saveTask.action.data = ''
        Dispatcher.dispatch saveTask

        expect(todo_store.getAll().length).toBe 5
        expect(todo_store.emitChange).not.toHaveBeenCalled()
