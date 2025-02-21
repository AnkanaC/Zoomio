import 'dart:math';
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2207048704.
import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class CallingPage extends StatefulWidget {
  const CallingPage({super.key, required this.callID});

  final String callID;

  @override
  State<CallingPage> createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {

  final userID = Random().nextInt(1000000);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    
      child: ZegoUIKitPrebuiltVideoConference(
        appID: AppInfo.appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: AppInfo.appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userID.toString(),
        userName: 'user_name$userID',
        conferenceID: widget.callID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),

    );
  }
}
