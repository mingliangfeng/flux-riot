var todo_action_creator = require('../actions/todo_action_creator.coffee')

<todo-item>
  <li class={ todo-item: true, completed: item.done }>
    <label>
      <input type="checkbox" checked={ item.done } onclick={ toggle }> { item.title }
    </label>
    <a href="javascript:void(0)" onclick={ remove }>Remove</a>
    <a href="javascript:void(0)" onclick={ edit }>Edit</a>
  </li>

  this.item = opts.item

  toggle() {
    todo_action_creator.toggleTask(this.item)
    // return true to make sure checkbox in correct state, for checkbox only?
    return true
  }

  remove() {
    todo_action_creator.removeTask(this.item)
  }

  edit() {
    riot.route('todos/edit/' + this.item.id)
  }

</todo-item>
