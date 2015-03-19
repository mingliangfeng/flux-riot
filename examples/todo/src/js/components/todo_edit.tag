var todos = require('../actions/todos.coffee')

<todo-edit>
  <h1>{ title }</h1>
  <div>
    <div class='form-row'>
      <div>
        <label for='txtTitle'>Task</label>
        <input placeholder='your new task' type='text' name='txtTitle' value={ item.title } />
      </div>
    </div>

    <div class="actions">
      <button onclick={ save }>Create</button>
      <button onclick={ cancel }>Cancel</button>
    </div>
  </div>

  if (opts.taskId) {
    this.title = 'Edit Taks ' + opts.taskId
    var task = opts.store.getTask(opts.taskId)
    this.item = { id: task.id, title: task.title }
  } else {
    this.title = 'Create new Task'
    this.item = {}
  }

  save() {
    this.item.title = this.txtTitle.value
    todos.saveTask(this.item)
    riot.route('#')
  }

  cancel() {
    riot.route('#')
  }

</todo-edit>
