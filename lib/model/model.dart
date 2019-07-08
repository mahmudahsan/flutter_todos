/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */

class Todo {
  int id;
  String text;
  DateTime created;
  DateTime updated;
  int status;

  Todo({this.id, this.text, this.created, this.updated, this.status});
}

// Sample Data
List<Todo> sampleTodos = [
  Todo(id: 1, text: 'Sample Task 1', created: DateTime.now(), status: 0),
];

List<Todo> sampleDones = [
  Todo(id: 0, text: 'Sample Task 0', created: DateTime.now(), status: 1),
];

class Model {
  static Model sharedInstance = Model._();

  Model._();

  List<Todo> getTodos() {
    return sampleTodos;
  }

  List<Todo> getDones() {
    return sampleDones;
  }

  void addTodo(Todo todo) {
    sampleTodos.add(todo);
  }

  void markTodoAsDone(int pos) {
    Todo done = sampleTodos.removeAt(pos);
    done.status = 1;
    sampleDones.add(done);
  }

  void markDoneAsTodo(int pos) {
    Todo todo = sampleDones.removeAt(pos);
    todo.status = 0;
    sampleTodos.add(todo);
  }

  void clearDoneTodos() {}
}
