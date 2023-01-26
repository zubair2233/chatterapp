import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/feature/home/pages/status_home_page.dart';

import 'chat_home_page.dart';

class CallHomePage extends StatefulWidget {
  const CallHomePage({super.key});
  static const id = "/CallHomePage";

  @override
  State<CallHomePage> createState() => _CallHomePageState();
}

class _CallHomePageState extends State<CallHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0ABAB5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Call Logs",
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
      body: const Center(
        child: Text('Call Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0ABAB5),
        onPressed: () {},
        child: const Icon(Icons.call),
      ),
    );
  }
}
