// ignore: library_prefixes
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
class HomePage extends StatelessWidget {
  final callIDTextCtrl = TextEditingController(text: "testCallID");
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: callIDTextCtrl,
                  decoration:
                      const InputDecoration(labelText: "start a call by id"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CallPage(callID: callIDTextCtrl.text);
                    }),
                  );
                },
                child: const Text("call"),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CallPage extends StatelessWidget {
  const CallPage({
    super.key,
    required this.callID,
  });
  final String callID;
  String get userID => Math.Random().nextInt(10000).toString();
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 703778103, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: 'a758a9f40c44601466cbcf3bb7397b12e4baae36de7853726782c75a4d3b72df', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userID,
      userName: 'Merci RUYANGA',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall() 
    );
  }
}
