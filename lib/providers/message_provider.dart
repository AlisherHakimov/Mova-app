import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mova_app/models/comment/chat_message.dart';
import 'package:mova_app/services/hive_service.dart';

class ChatMessageProvider {
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> getChatMessage(
      String chatRoomId) {
    return firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('messageTime', descending: true)
        .snapshots();
  }

  static Future<bool> createMessage(String text, String chatRoomId) async {
    final userInfo = HiveService.getAccountDetails().entries.toList();
    int userId = userInfo[0].value;
    String userName = userInfo[1].value;
    String profilePath = userInfo[2].value;

    final docRef = firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .doc();
    final chatMessage = ChatMessage(
      id: docRef.id,
      userId: userId,
      userName: userName,
      userImageUrl: profilePath,
      messageText: text,
      messageTime: DateTime.now(),
      isLiked: false,
      likesCount: 0,
    );
    final chatMessageJson = chatMessage.toJson();

    final response = await docRef
        .set(chatMessageJson)
        .then((value) => true)
        .onError((error, stackTrace) {
      print('Error creating chat room $error');
      return false;
    });

    return response;
  }

  static Future<bool> updateChatMessage(
      {required String chatRoomId,
      required ChatMessage currentMessage,
      required bool isLiked}) async {
    final updatedMessage = ChatMessage(
      id: currentMessage.id,
      userId: currentMessage.userId,
      userName: currentMessage.userName,
      userImageUrl:
          'https://image.tmdb.org/t/p/w200/${currentMessage.userImageUrl}',
      messageText: currentMessage.messageText,
      messageTime: currentMessage.messageTime,
      isLiked: isLiked,
      likesCount: isLiked
          ? currentMessage.likesCount + 1
          : currentMessage.likesCount - 1,
    );
    final chatMessageJson = updatedMessage.toJson();

    final docRef = firebaseFirestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .doc(currentMessage.id);

    final response = await docRef
        .update(chatMessageJson)
        .then((value) => true)
        .onError((error, stackTrace) {
      print('Error creating chat room $error');
      return false;
    });

    return true;
  }
}
