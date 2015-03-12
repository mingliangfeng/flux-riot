AppDispatcher = require '../dispatchers/app_dispatcher.coffee'
AppConstants = require '../constants/app_constants.coffee'

dispatch = (type, data)->
  AppDispatcher.handleViewAction
    type: type
    data: data

module.exports =
  addTask: (text) ->
    dispatch AppConstants.ActionTypes.ADD_TASK, text

  removeTask: (task) ->
    dispatch AppConstants.ActionTypes.REMOVE_TASK, task

  toggleTask: (task) ->
    dispatch AppConstants.ActionTypes.TOGGLE_TASK, task

  clearTasks: ->
    dispatch AppConstants.ActionTypes.CLEAR_TASKS
