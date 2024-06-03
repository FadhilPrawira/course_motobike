import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chat.dart';

class ChatSource {
  static Future<void> openChatRoom(String uid, String userName) async {
    final doc =
        await FirebaseFirestore.instance.collection('CS').doc(uid).get();

    if (doc.exists) {
      await FirebaseFirestore.instance.collection('CS').doc(uid).update({
        'newFromCS': false,
      });
      return;
    }

    // First time chatroom
    await FirebaseFirestore.instance.collection('CS').doc(uid).set({
      'lastMessage': 'Welcome to Motobike',
      'name': userName,
      'newFromCS': true,
      'newFromUser': false,
      'roomId': uid,
    });

    await FirebaseFirestore.instance
        .collection('CS')
        .doc(uid)
        .collection('chats')
        .add({
      'message': 'Welcome to Motobike',
      'receiverId': uid,
      'roomId': uid,
      'senderId': 'cs',
      'bikeDetail': null,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  static Future<void> send(Chat chat, String uid) async {
    await FirebaseFirestore.instance.collection('CS').doc(uid).update({
      'lastMessage': chat.message,
      'newFromCS': false,
      'newFromUser': true,
    });
    await FirebaseFirestore.instance
        .collection('CS')
        .doc('uid')
        .collection('chats')
        .add({
      'message': chat.message,
      'receiverId': chat.receiverId,
      'roomId': chat.roomId,
      'senderId': chat.senderId,
      'bikeDetail': chat.bikeDetail,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
