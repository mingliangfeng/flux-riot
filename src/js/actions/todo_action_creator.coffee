AppDispatcher = require '../dispatchers/app_dispatcher.coffee'
AppConstants = require '../constants/app_constants.coffee'

dispatch = (type, data)->
  AppDispatcher.handleViewAction
    type: type
    data: data

module.exports =
  showList: ->
    
  addTask: (text) ->
    dispatch AppConstants.ActionTypes.ADD_TASK, text

  removeTask: (todoItem) ->
    dispatch AppConstants.ActionTypes.REMOVE_TASK, todoItem

  clearList: ->
    console.warn 'clearList action not yet implemented...'

  toggleTask: (todoItem) ->
    dispatch AppConstants.ActionTypes.TOGGLE_TASK, todoItem
