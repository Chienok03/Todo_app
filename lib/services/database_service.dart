import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection("todos");

    User? user = FirebaseAuth.instance.currentUser;
    Future<DocumentReference> addTodoItems(String taskName) async{
        return await todoCollection.add({
          'uid': user!.uid,
          'taskName': taskName
        });
    }
}
