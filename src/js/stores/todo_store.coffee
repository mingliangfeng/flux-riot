riot = require 'riot'
assign = require 'object-assign'
AppDispatcher = require '../dispatchers/app_dispatcher.coffee'
AppConstants = require '../constants/app_constants.coffee'
BaseStore = require './base_store.coffee'

# data storage
_data = [
  { id: 1, title: 'Custom tags', done: true },
  { id: 2, title: 'Minimal syntax', done: true },
  { id: 3, title: 'Virtual DOM', done: true },
  { id: 4, title: 'Full stack' },
  { id: 5, title: 'IE8'}
]

addItem = (title, done = false) ->
  _data.push
    title: title
    done: done
getItems = -> _data

# TodoStore
TodoStore = assign new BaseStore(),
  getAll: ->
    getItems()

  dispatchToken: AppDispatcher.register  (payload)->
    action = payload.action
    switch action.type
      when AppConstants.ActionTypes.ADD_TASK
        text = action.data.trim()
        # NOTE: if this action needs to wait on another store
        # AppDispatcher.waitFor [ OtherStore.dispatchToken ]
        if text != ''
          addItem text
          TodoStore.emitChange()
      when AppConstants.ActionTypes.TOGGLE_TASK
        todoItem = action.data
        todoItem.done = !todoItem.done
      when AppConstants.ActionTypes.REMOVE_TASK
        todoItem = action.data
        index = TodoStore.getAll().indexOf(todoItem)
        TodoStore.getAll().splice(index, 1)
        TodoStore.emitChange()
      # add more cases for other actionTypes...

module.exports = TodoStore
