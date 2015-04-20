Dispatcher = require('flux-riot').Dispatcher
AppConstants = require '../constants/app_constants.coffee'

dispatch = (type, data)->
  Dispatcher.handleViewAction
    type: type
    data: data

module.exports =
  saveTask: (task) ->
    dispatch AppConstants.ActionTypes.TASK_SAVE, task

  removeTask: (task) ->
    dispatch AppConstants.ActionTypes.TASK_REMOVE, task

  toggleTask: (task) ->
    dispatch AppConstants.ActionTypes.TASK_TOGGLE, task

  clearTasks: ->
    dispatch AppConstants.ActionTypes.TASK_CLEAR
