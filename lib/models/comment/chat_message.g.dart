// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessage _$$_ChatMessageFromJson(Map<String, dynamic> json) =>
    _$_ChatMessage(
      id: json['id'] as String,
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      userImageUrl: json['userImageUrl'] as String,
      messageText: json['messageText'] as String,
      isLiked: json['isLiked'] as bool,
      likesCount: json['likesCount'] as int,
      messageTime: DateTime.parse(json['messageTime'] as String),
    );

Map<String, dynamic> _$$_ChatMessageToJson(_$_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userImageUrl': instance.userImageUrl,
      'messageText': instance.messageText,
      'isLiked': instance.isLiked,
      'likesCount': instance.likesCount,
      'messageTime': instance.messageTime.toIso8601String(),
    };
