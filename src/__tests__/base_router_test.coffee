helper = require './support/helper.coffee'
helper.dontMock 'base_router.js'

global.location = { hash: '' }
global.riot = require 'riot'

describe 'base_router', ->
  base_router = flux_riot = action = null

  beforeEach ->
    flux_riot = global.flux_riot = {}
    helper.require_src 'base_router.js'
    action = jasmine.createSpy('action')

  it 'BaseRouter.start for root', ->
    flux_riot.BaseRouter.routes action
    flux_riot.BaseRouter.start()
    expect(action).toHaveBeenCalled()

  it 'BaseRouter.start for path', ->
    flux_riot.BaseRouter.routes (->), 'path', action
    global.location.hash = '#path'
    flux_riot.BaseRouter.start()
    expect(action).toHaveBeenCalled()

  it 'BaseRouter.routes', ->
    action2 = jasmine.createSpy('action2')
    flux_riot.BaseRouter.routes (->), 'path', action
    global.riot.route 'path'
    expect(action).toHaveBeenCalled()

  it 'BaseRouter.routes with parameters', ->
    action2 = jasmine.createSpy('action2')
    flux_riot.BaseRouter.routes (->), \
      'path/:id', action,
      'path/:action/:id', action2
    global.riot.route 'path/9'
    expect(action).toHaveBeenCalledWith('9')

    global.riot.route 'path/edit/9'
    expect(action2).toHaveBeenCalledWith('edit', '9')
