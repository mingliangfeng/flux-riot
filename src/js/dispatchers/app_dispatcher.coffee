AppConstants = require '../constants/app_constants'
Dispatcher = require('flux').Dispatcher
assign = require 'object-assign'

AppDispatcher = assign new Dispatcher(),

  handleServerAction: (action)->
    this.handleAction action, AppConstants.SERVER_ACTION

  handleViewAction: (action)->
    this.handleAction action, AppConstants.VIEW_ACTION

  handleAction: (action, source)->
    this.dispatch
      source: source
      action: action

module.exports = AppDispatcher
