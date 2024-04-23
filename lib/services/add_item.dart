import 'package:cloud_firestore/cloud_firestore.dart';

Future addItem(name, int points) async {
  final docUser = FirebaseFirestore.instance.collection('Items').doc();

  final json = {
    'name': name,
    'points': points,
    'qty': 0,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
