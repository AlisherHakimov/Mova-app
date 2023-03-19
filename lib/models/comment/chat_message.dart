import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@Freezed()
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required int userId,
    required String userName,
    required String userImageUrl,
    required String messageText,
    required bool isLiked,
    required int likesCount,
    required DateTime messageTime,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
