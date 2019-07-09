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

  void addTodo(Todo todo) {
    //sampleTodos.add(todo);
  }

  void markTodoAsDone(int pos) {
//    Todo done = sampleTodos.removeAt(pos);
//    done.status = 1;
//    sampleDones.add(done);
  }

  void markDoneAsTodo(int pos) {
//    Todo todo = sampleDones.removeAt(pos);
//    todo.status = 0;
//    sampleTodos.add(todo);
  }

  void clearDoneTodos() {}
}
