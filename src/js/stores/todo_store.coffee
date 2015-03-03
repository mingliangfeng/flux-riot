riot = require 'riot'
assign = require 'object-assign'
AppDispatcher = require '../dispatchers/app_dispatcher.coffee'
AppConstants = require '../constants/app_constants.coffee'
BaseStore = require './base_store.coffee'

# data storage
_tasks = [
  { id: 1, title: 'Custom tags', done: true },
  { id: 2, title: 'Minimal syntax', done: true },
  { id: 3, title: 'Virtual DOM', done: true },
  { id: 4, title: 'Full stack' },
  { id: 5, title: 'IE8'}
]

addTask = (title, done = false) ->
  _tasks.push
    title: title
    done: done
getTasks = -> _tasks

# TodoStore
TodoStore = assign new BaseStore(),
  getAll: -> getTasks()

  dispatchToken: AppDispatcher.register  (payload)->
    action = payload.action
    switch action.type
      when AppConstants.ActionTypes.ADD_TASK
        text = action.data.trim()
        # NOTE: if this action needs to wait on another store
        # AppDispatcher.waitFor [ OtherStore.dispatchToken ]
        if text != ''
          addTask text
          TodoStore.emitChange()
      when AppConstants.ActionTypes.TOGGLE_TASK
        task = action.data
        task.done = !task.done
      when AppConstants.ActionTypes.REMOVE_TASK
        task = action.data
        index = TodoStore.getAll().indexOf(task)
        TodoStore.getAll().splice(index, 1)
        TodoStore.emitChange()
      # add more cases for other actionTypes...

module.exports = TodoStore
