helper = require './support/helper.coffee'
helper.dontMock 'base_store.js'

global.riot = require 'riot/riot'

describe 'base_store', ->
  base_store = flux_riot = action = null

  beforeEach ->
    flux_riot = global.flux_riot = {}
    helper.require_src 'base_store.js'
    action = jasmine.createSpy('action')
    base_store = new flux_riot.BaseStore()

  it 'BaseStore add event', ->
    base_store.addChangeListener action
    base_store.emitChange()
    expect(action).toHaveBeenCalled()

  it 'BaseStore remove event', ->
    action = -> throw new Error('should not be called')
    base_store.addChangeListener action
    base_store.removeChangeListener action
    base_store.emitChange()
