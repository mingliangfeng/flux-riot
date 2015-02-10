AppDispatcher = require '../dispatchers/app_dispatcher'
AppConstants = require '../constants/app_constants'
EventEmitter = require('events').EventEmitter
assign = require 'object-assign'

# data storage
_data = []
addItem = (title, completed = false) ->
  _data.push
    title: title
    completed: completed
getItems = -> _data

DataStore = assign(EventEmitter.prototype,
  getAll: ->
    { tasks: getItems() }
  addChangeListener: (callback) ->
    @on AppConstants.CHANGE_EVENT, callback
    return
  removeChangeListener: (callback) ->
    @removeListener AppConstants.CHANGE_EVENT, callback
  emitChange: ->
    @emit AppConstants.CHANGE_EVENT
  dispatcherIndex: AppDispatcher.register((payload) ->
    action = payload.action
    switch action.type
      when AppConstants.ActionTypes.ADD_TASK
        text = action.text.trim()
        # NOTE: if this action needs to wait on another store:
        # DataStore.waitFor([OtherStore.dispatchToken]);
        if text != ''
          addItem text
          DataStore.emitChange()
      # add more cases for other actionTypes...
  ))


module.exports = DataStore
