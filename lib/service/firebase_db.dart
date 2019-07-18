/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:cloud_firestore/cloud_firestore.dart';

const collectionTodos = 'todos';

class MyFirebase {
  MyFirebase._();

  static final MyFirebase instance = MyFirebase._();

  void getAllTodos() {
    Firestore.instance
        .collection(collectionTodos)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              print('title: ' + doc["title"]);
              print('user id: ' + doc['user_id'].toString());
              print('status: ' + doc['status'].toString());
              print('-------');
            }));
  }
}
