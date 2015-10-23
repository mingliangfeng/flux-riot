Dispatcher = require('flux-riot').Dispatcher
ActionTypes = require('../constants/app_constants.coffee').ActionTypes

dispatch = (type, data)->
  Dispatcher.handleViewAction
    type: type
    data: data

module.exports =
  saveTask: (task) ->
    dispatch ActionTypes.TASK_SAVE, task

  removeTask: (task) ->
    dispatch ActionTypes.TASK_REMOVE, task

  toggleTask: (task) ->
    dispatch ActionTypes.TASK_TOGGLE, task

  clearTasks: ->
    dispatch ActionTypes.TASK_CLEAR
