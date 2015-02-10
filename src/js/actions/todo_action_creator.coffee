AppDispatcher = require '../dispatchers/app_dispatcher'
AppConstants = require '../constants/app_constants'

module.exports =
  addItem: (text) ->
    AppDispatcher.handleViewAction
      type: AppConstants.ActionTypes.ADD_TASK
      text: text

  clearList: ->
    console.warn 'clearList action not yet implemented...'

  completeTask: (task) ->
    console.warn 'completeTask action not yet implemented...'
