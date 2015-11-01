describe 'base_router', ->
  BaseRouter = require('../../dist/flux-riot.js').BaseRouter
  riot = require('riot/riot')
  action = null

  beforeEach ->
    action = jasmine.createSpy('action')

  it 'BaseRouter.start for root', ->
    BaseRouter.routes action
    BaseRouter.start()
    expect(action).toHaveBeenCalled()

  it 'BaseRouter.start for path', ->
    BaseRouter.routes (->), 'path', action
    window.location.hash = 'path'
    BaseRouter.start()
    expect(action).toHaveBeenCalled()

  it 'BaseRouter.routes', ->
    BaseRouter.routes (->), 'path', action
    riot.route 'path'
    expect(window.location.hash).toBe '#path'
    expect(action).toHaveBeenCalled()

  it 'BaseRouter.routes with parameters', ->
    action2 = jasmine.createSpy('action2')
    BaseRouter.routes (->), \
      'path/:id', action,
      'path/:action/:id', action2
    riot.route 'path/9'
    expect(action).toHaveBeenCalledWith('9')

    riot.route 'path/edit/9'
    expect(action2).toHaveBeenCalledWith('edit', '9')
