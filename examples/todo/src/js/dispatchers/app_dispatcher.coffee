AppConstants = require '../constants/app_constants.coffee'
Dispatcher = require('flux').Dispatcher
assign = require 'object-assign'

AppDispatcher = assign new Dispatcher(),
  handleServerAction: (action)->
    this.handleAction action, AppConstants.ActionSources.SERVER_ACTION

  handleViewAction: (action)->
    this.handleAction action, AppConstants.ActionSources.VIEW_ACTION

  handleAction: (action, source)->
    this.dispatch
      source: source
      action: action

module.exports = AppDispatcher
