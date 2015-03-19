keymirror = require 'keymirror'

module.exports =
  ActionSources: keymirror
    SERVER_ACTION: null
    VIEW_ACTION:   null

  ActionTypes: keymirror
    TASK_SAVE:     null
    TASK_REMOVE:  null
    TASK_TOGGLE:  null
    TASK_CLEAR:   null
