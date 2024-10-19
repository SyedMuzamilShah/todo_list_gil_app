import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection("tasks");

  Stream<QuerySnapshot> get firestore => _firestore.snapshots();

  updateCompletedStatus(bool value, String? id) async {
    if (id != null) {
      try {
        await _firestore.doc(id).update({"isCompleted": value});
      } catch (e) {
        debugPrint("Error deleting task: $e");
      }
    } else {
      debugPrint("ID NOT PROVIDED");
    }
  }

  Future<void> deleteTask(String? id) async {
    if (id != null) {
      try {
        await _firestore.doc(id).delete();
      } catch (e) {
        debugPrint("Error deleting task: $e");
      }
    } else {
      debugPrint("ID NOT PROVIDED");
    }
  }
}
