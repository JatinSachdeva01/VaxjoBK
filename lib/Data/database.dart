import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  var _db = FirebaseFirestore.instance;
  final String event = 'events';
  // collection reference
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference registrationDetails = FirebaseFirestore.instance.collection('userData');

  Future updateUserData(String email, String name, String age,String city) async
  {
    return await registrationDetails.doc(uid).set({
      'email':email,
      'name':name,
      'age':age,
      'city':city,
    });
  }


  Future<bool> logEvent(String title, String details, date) async{
    bool result = false;
    final CollectionReference eventData = FirebaseFirestore.instance.collection(event);

    eventData.doc().set({
      'title': title,
      'description': details,
      'date': date,
    }).then((value) {
      result = true;
    }).catchError((err){
      result = false;
    });
    return result;
  }

  Future deleteEvent(String id) async {
    return await _db.collection('events').doc(id).delete();
  }

  Future editEvent(String id) async {
    return await _db.collection('events').doc(id).update({
      // date
      //title
    });
  }



}