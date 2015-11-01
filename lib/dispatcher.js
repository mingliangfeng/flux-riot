flux_riot.Dispatcher = (function() {

  var Constants = {
    ActionSources: {
      SERVER_ACTION: 'SERVER_ACTION',
      VIEW_ACTION: 'VIEW_ACTION'
    }
  }

  var Dispatcher = require('flux').Dispatcher
  var assign = require('object-assign')

  var dispatcher = assign(new Dispatcher(), {
    handleServerAction: function(action) {
      return this.handleAction(action, Constants.ActionSources.SERVER_ACTION)
    },

    handleViewAction: function(action) {
      return this.handleAction(action, Constants.ActionSources.VIEW_ACTION)
    },

    handleAction: function(action, source) {
      return this.dispatch({
        source: source,
        action: action
      })
    }
  })

  return dispatcher

})()
