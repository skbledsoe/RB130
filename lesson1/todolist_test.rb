require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require 'simplecov'
SimpleCov.start

require_relative 'to_do_list'

class TodoListTest < MiniTest::Test 
  def setup
    @todo1 = Todo.new('Get groceries')
    @todo2 = Todo.new('Fold laundry')
    @todo3 = Todo.new('Pet the cat')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a 
    assert_equal(@todos, @list.to_a)
  end

  def test_size 
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop 
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_all_done
    assert_equal(false, @list.done?)
  end

  def test_error_raised_unless_todo_object
    assert_raises(TypeError) { @list.add('Hello') }
    assert_raises(TypeError) { @list.add(1) }
  end

  def test_shovel_method
    new_todo = Todo.new('Clean room')
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    new_todo = Todo.new('Clean room')
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) {@list.item_at(@todos.size)}
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(@todos.size) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo1.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(@todos.size) }
    @list.mark_all_done
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo1.done?)
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(@todos.size) }
    todo = @list.remove_at(1)
    assert_equal(@todo2, todo)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Get groceries
    [ ] Fold laundry
    [ ] Pet the cat
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    @list.mark_done_at(0)
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Get groceries
    [ ] Fold laundry
    [ ] Pet the cat
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Get groceries
    [X] Fold laundry
    [X] Pet the cat
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    count = 0
    @list.each { |todo| count += 1 if todo.is_a?(Todo) }

    assert_equal(count, 3)
  end

  def test_each_return_value
    assert_equal(@list, @list.each {|todo| nil})
  end

  def test_select 
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end
end