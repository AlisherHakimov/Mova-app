import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/models/comment/chat_message.dart';
import 'package:mova_app/providers/message_provider.dart';
import 'package:mova_app/ui/widgets/buttons/back_button.dart';
import 'package:mova_app/ui/widgets/forms/input_form.dart';
import 'package:mova_app/utils/theme_brightnes.dart';

import '../../widgets/cards/message_card.dart';

class AllCommentsPage extends StatelessWidget {
  AllCommentsPage(this.movieId, {super.key});

  int movieId;
  TextEditingController messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: ChatMessageProvider.getChatMessage(movieId.toString()),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                commentsList(context, snapshot),
                addCommentField(context),
              ],
            );
          }),
    );
  }

  Widget addCommentField(context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          side: BorderSide(
            width: 1.h,
            color:
                isDarkMode(context) ? AppColors.dark3 : AppColors.greyScale50,
            strokeAlign: StrokeAlign.outside,
          ),
        ),
        color: isDarkMode(context) ? AppColors.dark1 : Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          top: 24.h,
          right: 24.w,
          bottom: 36.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: InputForm(
                hintText: 'Add Comment'.tr(),
                controller: messageTextController,
              ),
            ),
            SizedBox(width: 12.w),
            IconButton(
              onPressed: (() {
                final text = messageTextController.text;
                if (text.isNotEmpty) {
                  ChatMessageProvider.createMessage(text, movieId.toString());
                  messageTextController.clear();
                }
              }),
              icon: Image.asset(
                'assets/icons/bold/send_comment.png',
                height: 56.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commentsList(BuildContext context,
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    return Column(
      children: [
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ArrowBackButton(),
                  Text(
                    '${snapshot.data?.docs.length ?? 'No'} Comments',
                    style: Theme.of(context).textTheme.headline4,
                  )
                ],
              ),
              IconButton(
                onPressed: (() {}),
                icon: SvgPicture.asset(
                  'assets/icons/light_border/more_circle.svg',
                  height: 28.h,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          child: mainListContent(snapshot),
        ),
        SizedBox(height: 150.h),
      ],
    );
  }

  Widget mainListContent(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    final items = snapshot.data?.docs ?? [];
    if (items.isEmpty) {
      return const Center(child: Text('No messages yet'));
    }
    return messagesListView(items);
  }

  ListView messagesListView(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> items) {
    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
      itemCount: items.length,
      itemBuilder: ((context, index) {
        final itemJson = items[index].data();
        final chatMessage = ChatMessage.fromJson(itemJson);
        return MessageCard(
            chatRoomId: movieId.toString(), chatMessage: chatMessage);
      }),
    );
  }
}
