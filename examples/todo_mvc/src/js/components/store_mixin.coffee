module.exports = (tag, store, callback)->
  tag.store = store

  tag.on 'mount', -> store.addChangeListener callback
  tag.on 'unmount', -> store.removeChangeListener callback
