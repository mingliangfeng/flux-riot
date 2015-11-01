describe 'store_mixin', ->
  storeMixin = require('../../dist/flux-riot.js').storeMixin
  riot = require('riot/riot')

  store_mock = null

  beforeEach ->
    store_mock = jasmine.createSpyObj('store', ['addChangeListener', 'removeChangeListener'])

  it 'storeMixin', ->
    tag = riot.observable({})
    callback = ->
    storeMixin(tag, store_mock, callback)

    expect(tag.store).toBe store_mock

    tag.trigger('mount')
    expect(store_mock.addChangeListener).toHaveBeenCalledWith(callback)

    tag.trigger('unmount')
    expect(store_mock.removeChangeListener).toHaveBeenCalledWith(callback)
