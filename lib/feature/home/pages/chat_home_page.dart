import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_messenger/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/models/last_message_model.dart';
import 'package:whatsapp_messenger/common/models/user_model.dart';
import 'package:whatsapp_messenger/common/routes/routes.dart';
import 'package:whatsapp_messenger/common/utils/coloors.dart';
import 'package:whatsapp_messenger/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_messenger/feature/chat/controller/chat_controller.dart';
import 'package:whatsapp_messenger/feature/home/pages/call_home_page.dart';
import 'package:whatsapp_messenger/feature/home/pages/status_home_page.dart';

class ChatHomePage extends ConsumerStatefulWidget {
  const ChatHomePage({super.key});
  static const id = "/ChatHomePage";
  @override
  ConsumerState<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends ConsumerState<ChatHomePage> {
  late Timer timer;
  updateUserPresence() {
    ref.read(authControllerProvider).updateUserPresence();
  }

  @override
  void initState() {
    updateUserPresence();
    timer = Timer.periodic(
      const Duration(minutes: 1),
      (timer) => setState(() {}),
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0ABAB5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Chats",
              style: TextStyle(fontSize: 25),
            ),
            Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
                SizedBox(
                  width: 12,
                ),
                Image.asset("assets/images/book.png"),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: selectedItemIndex,
        // onTap: (int index) {
        //   setState(() {
        //     selectedItemIndex = index;
        //   });
        // },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xff979797),
        selectedIconTheme: IconThemeData(color: Color(0xffB20812)),
        iconSize: 10,
        selectedFontSize: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacementNamed(context, ChatHomePage.id);
                  });
                },
                child: Image.asset(
                  'assets/images/bxs_chat.png',
                  scale: 0.8,
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushReplacementNamed(context, StatusHomePage.id);
                });
              },
              child: Image.asset(
                'assets/images/Camera.png',
                scale: 0.8,
              ),
            ),
            label: '',
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/images/ic_baseline-person.png',
                scale: 0.8,
              ),
            ),
            label: '',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushReplacementNamed(context, CallHomePage.id);
                });
              },
              child: Image.asset(
                'assets/images/ph_video-camera-fill.png',
                scale: 0.8,
              ),
            ),
            label: '',
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/ant-design_setting-filled.png',
              scale: 0.8,
            ),
            label: '',
            backgroundColor: Colors.yellow,
          ),
        ],
      ),
      body: StreamBuilder<List<LastMessageModel>>(
        stream: ref.watch(chatControllerProvider).getAllLastMessageList(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Coloors.greenDark,
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final lastMessageData = snapshot.data![index];
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.chat,
                    arguments: UserModel(
                      username: lastMessageData.username,
                      uid: lastMessageData.contactId,
                      profileImageUrl: lastMessageData.profileImageUrl,
                      active: true,
                      lastSeen: 0,
                      phoneNumber: '0',
                      groupId: [],
                    ),
                  );
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lastMessageData.username),
                    Text(
                      DateFormat.Hm().format(lastMessageData.timeSent),
                      style: TextStyle(
                        fontSize: 13,
                        color: context.theme.greyColor,
                      ),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    lastMessageData.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: context.theme.greyColor),
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    lastMessageData.profileImageUrl,
                  ),
                  radius: 24,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0ABAB5),
        onPressed: () {
          Navigator.pushNamed(context, Routes.contact);
        },
        // child: const ImageIcon(AssetImage("assets/images/messageIcon.png")),
        child: Icon(Icons.chat),
      ),
    );
  }
}
