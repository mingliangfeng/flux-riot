require('./todo_item.tag')

<todo-list>
  <ul>
    <todo-item each={ item in opts.items } item={ item }></todo-item>
  </ul>
</todo-list>
