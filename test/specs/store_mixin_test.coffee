helper = require './support/helper.coffee'
helper.dontMock 'store_mixin.js'

global.riot = require 'riot/riot'

describe 'store_mixin', ->
  store_mixin = flux_riot = store_mock = null

  beforeEach ->
    flux_riot = global.flux_riot = {}
    helper.require_src 'store_mixin.js'
    store_mixin = flux_riot.storeMixin
    store_mock = jasmine.createSpyObj('store', ['addChangeListener', 'removeChangeListener'])

  it 'storeMixin', ->
    tag = riot.observable({})
    callback = ->
    store_mixin(tag, store_mock, callback)

    expect(tag.store).toBe store_mock

    tag.trigger('mount')
    expect(store_mock.addChangeListener).toHaveBeenCalledWith(callback)

    tag.trigger('unmount')
    expect(store_mock.removeChangeListener).toHaveBeenCalledWith(callback)
