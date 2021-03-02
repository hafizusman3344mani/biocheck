import 'dart:async';

import 'package:biocheck/common/constants.dart';
import 'package:biocheck/common/ui_widgets/get_icon.dart';
import 'package:biocheck/common/ui_widgets/next.dart';
import 'package:biocheck/common/ui_widgets/pushup_widget.dart';
import 'package:biocheck/common/ui_widgets/textview2.dart';
import 'package:biocheck/common/utils/colors.dart';
import 'package:biocheck/common/utils/global_resources.dart';
import 'package:biocheck/common/utils/values.dart';
import 'package:biocheck/common/utils/widget_attributes.dart';
import 'package:biocheck/models/apimodels/chat/chat_main_model.dart';
import 'package:biocheck/models/apimodels/chat/chat_sub_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../dashboard2.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {


  var chatMain = List<ChatMainModel>();

  @override
  void initState() {
    fillChat();

    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leadingWidth: AppValue.screenWidth(context),
          automaticallyImplyLeading: false,
          leading: Container(
            margin: EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            child: Textview2(
              title: 'Belia',
              color: AppColors.dashboardTextColor,
              fontSize: 30.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: ()=>Navigator.of(context).pop(),
                child: GetIcon(
                  height: 18.0,
                  width: 18.0,
                  color: AppColors.dashboardTextColor,
                  path: GlobalResources.ic_close,
                ),
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: AppValue.screenHeight(context) / 1.4,
              margin: EdgeInsets.only(top: 25.0),
              child: ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  for (int i = 0; i < chatMain.length; i++)
                    chatListMainWidget(i)
                ],
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 7.0),
                height: 52.0,
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetIcon(
                        width: 24.0,
                        height: 24.0,
                        path: 'assets/icons/icon_add.svg',
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 13.5,bottom: 13.5,right: 14.7),
                          width: 1.0,
                          color: Colors.black54,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GetIcon(
                            width: 24.0,
                            height: 24.0,
                            path: 'assets/icons/icn_send.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }

  Widget chatListMainWidget(int ind) {
    return Column(
      children: [
        Textview2(
          title: chatMain[ind].dateString,
          fontWeight: FontWeight.w300,
          fontSize: 12.0,
          color: AppColors.chatDataColor,
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: chatMain[ind].messages.length,
            itemBuilder: (context, index) {
              return chatListSubWidget(chatMain[ind], index);
            },
          ),
        ),
      ],
    );
  }

  Widget chatListSubWidget(ChatMainModel mainModel, int index) {
    if (mainModel.messages[index].isSender) {
      return senderChatWidget(mainModel, mainModel.messages[index]);
    } else {
      return receiverChatWidget(mainModel.messages[index]);
    }
  }

  Widget receiverChatWidget(ChatSubModel model) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 75.0, right: 20.0, bottom: 20.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
                gradient:
                    WidgetProps.getAppGradient(colors: AppColors.receiverBG)),
            padding: EdgeInsets.all(16.0),
            child: Textview2(
              color: AppColors.dashboardTextColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
              title: model.text,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 38.0,
              width: 38.0,
              transform: Matrix4.translationValues(15.0, -25.0, 0.0),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.asset(
                    'assets/images/picture.png',
                    width: 28.0,
                    height: 28.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget senderChatWidget(ChatMainModel mainModel, ChatSubModel model) {
    if (mainModel.id == 1) {
      return Container(
        margin:
            EdgeInsets.only(top: 20.0, left: 20.0, right: 75.0, bottom: 20.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  gradient:
                      WidgetProps.getAppGradient(colors: AppColors.senderBG)),
              padding: EdgeInsets.all(16.0),
              child: Textview2(
                color: AppColors.dashboardTextColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                title: model.text,
              ),
            ),
            Container(
              height: 38.0,
              width: 38.0,
              transform: Matrix4.translationValues(-15.0, -25.0, 0.0),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.asset(
                    'assets/images/picture.png',
                    width: 28.0,
                    height: 28.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      if (model.id == 1) {
        return Container(
          margin:
              EdgeInsets.only(top: 20.0, left: 20.0, right: 75.0, bottom: 20.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    gradient: WidgetProps.getAppGradient(
                        colors: AppColors.senderBG)),
                padding: EdgeInsets.all(16.0),
                child: Textview2(
                  color: AppColors.dashboardTextColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  title: model.text,
                ),
              ),
              Container(
                height: 38.0,
                width: 38.0,
                transform: Matrix4.translationValues(-15.0, -25.0, 0.0),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.asset(
                      'assets/images/picture.png',
                      width: 28.0,
                      height: 28.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return customImageMessage("");
      }
    }
  }

  Widget customImageMessage(String imagePath) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin:
            EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
        height: 270.0,
        width: 270.0,
        child: Image.asset(
          'assets/images/picture.png',
          width: 28.0,
          height: 28.0,
        ),
      ),
    );
  }

  void fillChat() {
    for (int i = 0; i < 2; i++) {
      var chatModel = ChatMainModel();
      chatModel.id = i + 1;
      chatModel.dateString = i == 0 ? "GISTEREN, 12:30" : "VANDAAG, 08:25";
      var chatList = List<ChatSubModel>();
      for (int j = 0; j < 2; j++) {
        var chatSubModel = ChatSubModel();
        chatSubModel.id = j + 1;
        if (i == 0) {
          chatSubModel.text = j == 0
              ? "The person who says it cannot be done should not interrupt the person who is doing it."
              : "Remember that not getting what you want is sometimes a wonderful stroke of luck.";
        } else {
          chatSubModel.text =
              "You can’t use up creativity. The more you use, the more you have. ";
        }
        chatSubModel.isSender = j == 0 ? true : false;
        if (i == 1) {
          chatSubModel.isSender = true;
        }
        chatList.add(chatSubModel);
      }
      chatModel.messages = chatList;
      chatMain.add(chatModel);
    }
  }
}
