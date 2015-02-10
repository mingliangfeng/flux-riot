<todo-app>

  <h3>{ opts.title }</h3>

  <todo-list items={ items } />

  <form onsubmit={ add }>
    <input name="input" onkeyup={ edit }>
    <button disabled={ !text }>Add #{ items.filter(filter).length + 1 }</button>
  </form>

  @items = opts.items

  @edit = (e)->
    @text = e.target.value

  @add = (e)->
    if @text
      @items.push title: this.text
      @text = @input.value = ''

  # an example how to filter items on the list
  @filter = (item)-> !item.hidden

  @toggle = (e)->
    item = e.item
    item.done = !item.done
    true

</todo-app>
