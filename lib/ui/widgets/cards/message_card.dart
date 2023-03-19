import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/models/comment/chat_message.dart';
import 'package:mova_app/providers/message_provider.dart';
import 'package:mova_app/ui/widgets/texts/bold/bold_text_16.dart';
import 'package:mova_app/ui/widgets/texts/semibold/semibold_text_12.dart';

import '../../../services/hive_service.dart';
import '../../../utils/theme_brightnes.dart';
import '../texts/regular/regular_text_14.dart';

class MessageCard extends StatefulWidget {
  MessageCard({required this.chatRoomId, required this.chatMessage, super.key});
  ChatMessage chatMessage;
  String chatRoomId;
  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  final chatTimeFormatter = DateFormat('yyyy-MM-dd  HH:mm');
  int userId = HiveService.getAccountDetails().values.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.chatMessage.userId == userId ? 0 : 0,
        top: 24.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://image.tmdb.org/t/p/w200/${widget.chatMessage.userImageUrl}'),
                  ),
                  SizedBox(width: 16.w),
                  BoldText16(
                    widget.chatMessage.userName,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ],
              ),
              IconButton(
                onPressed: (() {}),
                icon: SvgPicture.asset(
                  'assets/icons/light_border/more_circle.svg',
                  height: 24.h,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          RegularText14(
            widget.chatMessage.messageText,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              GestureDetector(
                onTap: (() {
                  setState(() {
                    ChatMessageProvider.updateChatMessage(
                      chatRoomId: widget.chatRoomId,
                      currentMessage: widget.chatMessage,
                      isLiked: !widget.chatMessage.isLiked,
                    );
                  });
                }),
                child: widget.chatMessage.isLiked == true
                    ? Image.asset('assets/icons/bold/heart.png')
                    : SvgPicture.asset(
                        'assets/icons/light_border/heart.svg',
                        color: Theme.of(context).iconTheme.color,
                      ),
              ),
              SizedBox(width: 8.w),
              SemiBoldText12(
                widget.chatMessage.likesCount.toString(),
                color: Theme.of(context).iconTheme.color,
              ),
              SizedBox(width: 24.w),
              Text(
                chatTimeFormatter.format(widget.chatMessage.messageTime),
                style: cardBottomItemsStyle(),
              ),
              SizedBox(width: 24.w),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle cardBottomItemsStyle() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color:
          isDarkMode(context) ? AppColors.greyScale300 : AppColors.greyScale700,
    );
  }
}
