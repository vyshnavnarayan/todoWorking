import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class ManageTaskRepo {
  final CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection('Tasks');
  void createTask(String title, String description) {
    final _auth = FirebaseAuth.instance;
    final date = DateTime.now();
    final uuid = Uuid();
    final todoId = uuid.v4();
    print(todoId);
    print(date);
    final currentDate = '${date.year}-${date.month}-${date.day}';
    print('----------------------------------------');
    try {
      _taskCollection.doc(todoId).set({
        'task_name': title,
        'description': description,
        'user_id': _auth.currentUser!.uid,
        'date': currentDate,
        'task_id': todoId
      });
    } catch (e) {}
  }

  void deleteTask(String task_id) {
    _taskCollection.doc(task_id).delete();
  }

  void updateTask(String task_id, String task_name, String description) {
    _taskCollection
        .doc(task_id)
        .update({'task_name': task_name, 'description': description});
  }
}
