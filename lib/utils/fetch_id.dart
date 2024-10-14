import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> getLatestId(String collectionName) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .orderBy('id', descending: true)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      return documentSnapshot.id;
    } else {
      return null; // Return an empty string if no documents are found
    }
  } catch (e) {
    print('Error getting latest ID: $e');
    return '1';
  }
}
