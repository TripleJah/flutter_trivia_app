import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trivia/services/auth.dart';
import 'package:trivia/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //method to read all docs from topics collection
  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var topics = data.map((d) => Topic.fromJson(d));
    return topics.toList();
  }

  //return a single quiz doc
  Future<Quiz> getQuiz(String quizId) async {
    var ref = _db.collection('quizzes').doc(quizId);
    var snapshot = await ref.get();
    return Quiz.fromJson(snapshot.data() ?? {});
  }

  //listens for current user firestore doc
  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if(user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }


  //Updates current user report doc post quiz completion
  Future<void> updateUserReport(Quiz quiz) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {
      'total': FieldValue.increment(1),
      'topics': {
        quiz.topic: FieldValue.arrayUnion([quiz.id])
      }
    };

    return ref.set(data, SetOptions(merge: true));
  }
}