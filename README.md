# flux-riot

> A thin layer on top of flux and riotjs, to bring flux architecture to your riot apps.

See [flux](https://github.com/facebook/flux) and [riotjs](https://github.com/muut/riotjs)


## Running the code

```bash
$ git clone https://github.com/mingliangfeng/flux-riot.git
$ cd flux-riot
$ npm install
$ npm test
$ npm start

```


## Run TODO example

```bash
$ cd flux-riot/examples/todo
$ npm install
$ npm test
$ npm start

```


## Create initial project structure to use flux-riot

See [generator-flux-riot](https://github.com/mingliangfeng/generator-flux-riot)


## Components

### flux_riot.BaseStore
Observable base store to be extended. Exposes addChangeListener, removeChangeListener, and emitChange functions. e.g.

Create new store:
```
var TodoStore = assign(new flux_riot.BaseStore(), {
  dispatchToken: Dispatcher.register(function(payload) {
    var action = payload.action
    switch (action.type) {
      case ActionTypes.TASK_SAVE
        ...
        TodoStore.emitChange()
    }
  })
})

```

Register and unregister store listener from view:
```
# inside riot tag
...
this.on('mount', function() {
  store.addChangeListener(this.storeChanged)
})

this.on('unmount', function() {
  store.removeChangeListener(this.storeChanged)
})

```


### flux_riot.storeMixin
Helper to mixin store to a riot tag, exposes method storeMixin(tag, store, storeChangeHandler) and does 3 things:

1. assign store to store property of tag instance;
2. listen to mount event and register store listener;
3. listen to unmount event and unregister store listener.

e.g.
```
# inside riot tag
...
flux_riot.storeMixin(this, opts.store, this.updateFromStore)

```

### flux_riot.BaseRouter
A thin layer on top of riot.router, provides a declarative way to define routes.

1. flux_riot.BaseRouter.routes(root_action, [path, action, [..]])

  e.g.
  ```
  BaseRouter.routes(list,
    'todos/add', edit,
    'todos/edit/:id', edit
  )

  ```
2. flux_riot.BaseRouter.start()

  Study the current hash “in place” using previously defined routes. An optional callback can be passed in to override the defined routes.


### flux_riot.Dispatcher
Adds handleServerAction and handleViewAction methods to flux.Dispatcher for convinience. e.g.
```
# inside action creators
...
Dispatcher.handleViewAction(type: ActionTypes.TASK_SAVE, data: data)

```


## License

flux-riot is licensed under the MIT license.
