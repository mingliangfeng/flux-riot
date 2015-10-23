helper = require './support/helper.coffee'
helper.dontMock 'dispatcher.js'

global.riot = require 'riot/riot'

describe 'dispatcher', ->
  flux_riot = flux_dispatcher = null

  beforeEach ->
    flux_riot = global.flux_riot = {}
    helper.require_src 'dispatcher.js'
    flux_dispatcher = require('flux').Dispatcher

  it 'dispatcher handleViewAction', ->
    flux_riot.Dispatcher.handleViewAction({})
    calls = flux_dispatcher.prototype.dispatch.mock.calls
    expect(calls.length).toBe 1
    paras = calls[0][0]
    expect(paras).toEqual { source: 'VIEW_ACTION', action: {} }

  it 'dispatcher handleServerAction', ->
    flux_riot.Dispatcher.handleServerAction({})
    calls = flux_dispatcher.prototype.dispatch.mock.calls
    expect(calls.length).toBe 1
    paras = calls[0][0]
    expect(paras).toEqual { source: 'SERVER_ACTION', action: {} }
