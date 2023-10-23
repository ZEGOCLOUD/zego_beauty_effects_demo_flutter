import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'faceunity_manager.dart';

class FaceunitySettingButton extends StatelessWidget {
  const FaceunitySettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, containers) {
      return Padding(
        padding: EdgeInsets.only(left: 20, top: containers.maxHeight - 70),
        child: GestureDetector(
          onTap: () => FaceunityManager().faceunitySettingPage(context),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: const Color(0xff2C2F3E).withOpacity(0.6), shape: BoxShape.circle),
            child: const Image(image: AssetImage('assets/icons/toolbar_beauty.png')),
          ),
        ),
      );
    });
  }
}
