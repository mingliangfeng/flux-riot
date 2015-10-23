assign = require 'object-assign'
Dispatcher = require('flux-riot').Dispatcher
ActionTypes = require('../constants/app_constants.coffee').ActionTypes
flux_riot = require 'flux-riot'

# data storage
gid = 1
_tasks = [
  { id: gid++, title: 'Custom tags', done: true },
  { id: gid++, title: 'Minimal syntax', done: true },
  { id: gid++, title: 'Virtual DOM', done: true },
  { id: gid++, title: 'Full stack' },
  { id: gid++, title: 'IE8'}
]

addTask = (title, done = false) ->
  _tasks.push
    id: gid++
    title: title
    done: done
getTasks = -> _tasks

# TodoStore
TodoStore = assign new flux_riot.BaseStore(),
  getAll: -> getTasks()

  getTask: (id)->
    for task in TodoStore.getAll()
      return task if task.id == parseInt(id)

  dispatchToken: Dispatcher.register (payload)->
    action = payload.action
    switch action.type
      when ActionTypes.TASK_SAVE
        data = action.data
        # NOTE: if this action needs to wait on another store
        # Dispatcher.waitFor [ OtherStore.dispatchToken ]
        if data.id
          task = TodoStore.getTask(data.id)
          task.title = data.title
          TodoStore.emitChange()
        else if data.title
          addTask data.title
          TodoStore.emitChange()
      when ActionTypes.TASK_TOGGLE
        task = action.data
        task.done = !task.done
      when ActionTypes.TASK_REMOVE
        task = action.data
        index = TodoStore.getAll().indexOf(task)
        TodoStore.getAll().splice(index, 1)
        TodoStore.emitChange()
      # add more cases for other actionTypes...

module.exports = TodoStore
