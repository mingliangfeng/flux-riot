riot = require 'riot'

CHANGE_EVENT = 'CHANGE_EVENT'

class BaseStore
  constructor: ->
    riot.observable @

  addChangeListener: (callback)->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback)->
    @off CHANGE_EVENT, callback

  emitChange: ->
    @trigger CHANGE_EVENT

module.exports = BaseStore
