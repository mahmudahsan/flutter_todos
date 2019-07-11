/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter_todos/model/model.dart';
import 'package:flutter_todos/model/db.dart';

class DBWrapper {
  static final DBWrapper sharedInstance = DBWrapper._();

  DBWrapper._();

  Future<List<Todo>> getTodos() async {
    List list = await DB.sharedInstance.retrieveTodos();
    return list;
  }

  Future<List<Todo>> getDones() async {
    List list = await DB.sharedInstance.retrieveTodos(status: TodoStatus.done);
    return list;
  }

  void addTodo(Todo todo) async {
    await DB.sharedInstance.createTodo(todo);
  }

  void markTodoAsDone(Todo todo) async {
    todo.status = TodoStatus.done.index;
    todo.updated = DateTime.now();
    await DB.sharedInstance.updateTodo(todo);
  }

  void markDoneAsTodo(Todo todo) async {
    todo.status = TodoStatus.active.index;
    todo.updated = DateTime.now();
    await DB.sharedInstance.updateTodo(todo);
  }

  void deleteTodo(Todo todo) async {
    await DB.sharedInstance.deleteTodo(todo);
  }

  void deleteAllDoneTodos() async {
    await DB.sharedInstance.deleteAllTodos();
  }
}
