import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_messenger/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_messenger/feature/home/pages/call_home_page.dart';
import 'package:whatsapp_messenger/feature/home/pages/chat_home_page.dart';
import 'package:whatsapp_messenger/feature/home/pages/status_home_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     'WhatsApp',
        //     style: TextStyle(letterSpacing: 1),
        //   ),
        //   elevation: 1,
        //   actions: [
        //     CustomIconButton(onPressed: () {}, icon: Icons.search),
        //     CustomIconButton(onPressed: () {}, icon: Icons.more_vert),
        //   ],
        //   // bottom: const TabBar(
        //   //   indicatorWeight: 3,
        //   //   labelStyle: TextStyle(fontWeight: FontWeight.bold),
        //   //   splashFactory: NoSplash.splashFactory,
        //   //   tabs: [
        //   //     Tab(text: 'CHATS'),
        //   //     Tab(text: 'STATUS'),
        //   //     Tab(text: 'CALLS'),
        //   //   ],
        //   // ),
        // ),

        // bottomNavigationBar: BottomNavigationBar(
        //   // currentIndex: selectedItemIndex,
        //   // onTap: (int index) {
        //   //   setState(() {
        //   //     selectedItemIndex = index;
        //   //   });
        //   // },
        //   type: BottomNavigationBarType.fixed,
        //   unselectedItemColor: const Color(0xff979797),
        //   selectedIconTheme: IconThemeData(color: Color(0xffB20812)),
        //   iconSize: 10,
        //   selectedFontSize: 1,
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Padding(
        //         padding: const EdgeInsets.all(12.0),
        //         child: InkWell(
        //           onTap: () {
        //             setState(() {
        //               Navigator.pushReplacementNamed(context, ChatHomePage.id);
        //             });
        //           },
        //           child: Image.asset(
        //             'assets/images/bxs_chat.png',
        //             scale: 0.8,
        //           ),
        //         ),
        //       ),
        //       label: '',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: InkWell(
        //         onTap: () {
        //           setState(() {
        //             Navigator.pushReplacementNamed(context, StatusHomePage.id);
        //           });
        //         },
        //         child: Image.asset(
        //           'assets/images/Camera.png',
        //           scale: 0.8,
        //         ),
        //       ),
        //       label: '',
        //       backgroundColor: Colors.yellow,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: InkWell(
        //         onTap: () {},
        //         child: Image.asset(
        //           'assets/images/ic_baseline-person.png',
        //           scale: 0.8,
        //         ),
        //       ),
        //       label: '',
        //       backgroundColor: Colors.green,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: InkWell(
        //         onTap: () {
        //           setState(() {
        //             Navigator.pushReplacementNamed(context, CallHomePage.id);
        //           });
        //         },
        //         child: Image.asset(
        //           'assets/images/ph_video-camera-fill.png',
        //           scale: 0.8,
        //         ),
        //       ),
        //       label: '',
        //       backgroundColor: Colors.yellow,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Image.asset(
        //         'assets/images/ant-design_setting-filled.png',
        //         scale: 0.8,
        //       ),
        //       label: '',
        //       backgroundColor: Colors.yellow,
        //     ),
        //   ],
        // ),

        body: TabBarView(
          children: [
            ChatHomePage(),
            StatusHomePage(),
            CallHomePage(),
          ],
        ),
      ),
    );
  }
}
