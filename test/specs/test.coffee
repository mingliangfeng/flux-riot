describe 'A spec', ->
  flux_riot = require('../../dist/flux-riot.js')
  base_store = action = null
  
  beforeEach ->
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
