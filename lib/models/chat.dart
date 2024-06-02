import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final Map? bikeDetail;
  final String message;
  final String receiverId;
  final String roomId;
  final String senderId;
  final Timestamp? timestamp;
  Chat({
    this.bikeDetail,
    required this.message,
    required this.receiverId,
    required this.roomId,
    required this.senderId,
    this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'bikeDetail': bikeDetail,
      'message': message,
      'receiverId': receiverId,
      'roomId': roomId,
      'senderId': senderId,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      bikeDetail: json['bikeDetail'] != null
          ? Map.from(json['bikeDetail'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String,
      receiverId: json['receiverId'] as String,
      roomId: json['roomId'] as String,
      senderId: json['senderId'] as String,
      timestamp: json['timestamp'],
    );
  }
}
