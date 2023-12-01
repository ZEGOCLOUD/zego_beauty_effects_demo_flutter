// 一个单例

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_faceunity_plugin/zego_faceunity_plugin.dart';

import '../zego_sdk_manager.dart';

class FaceunityManager {
  static final FaceunityManager _instance = FaceunityManager._internal();
  factory FaceunityManager() => _instance;
  FaceunityManager._internal();

  List<Map<String, dynamic>> beautyParamList = [
    {'name': 'Whitening', 'value': 1.0, 'min': 0.0, 'max': 2.0},
    {'name': 'Rosy', 'value': 0.5, 'min': 0.0, 'max': 2.0},
    {'name': 'Skin', 'value': 1.0, 'min': 0.0, 'max': 3.0},
    {'name': 'Big eyes', 'value': 0.4, 'min': 0.0, 'max': 1.0},
    {'name': 'Slim face', 'value': 0.0, 'min': 0.0, 'max': 1.0},
    {'name': 'V face', 'value': 0.5, 'min': 0.0, 'max': 1.0},
    {'name': 'Narrow face', 'value': 0.0, 'min': 0.0, 'max': 1.0},
    {'name': 'Small face', 'value': 0.0, 'min': 0.0, 'max': 1.0},
    {'name': 'Chin', 'value': 0.3, 'min': 0.0, 'max': 1.0},
    {'name': 'forehead', 'value': 0.3, 'min': 0.0, 'max': 1.0},
    {'name': 'nose', 'value': 0.5, 'min': 0.0, 'max': 1.0},
    {'name': 'Lip shape', 'value': 0.4, 'min': 0.0, 'max': 1.0},
  ];

  Future<void> initFaceunity() async {
    ZegoFaceunityPlugin.instance.init();
  }

  Future<void> uninitFaceunity() async {
    ZegoFaceunityPlugin.instance.uninit();
  }

  void setBeautyOption(int index) {
    print('cureent value: ${beautyParamList[index]['value']}');
    switch (beautyParamList[index]['name']) {
      case '美白':
        ZegoFaceunityPlugin.instance.setBeautyOption(faceWhiten: beautyParamList[index]['value']);
        break;
      case '红润':
        ZegoFaceunityPlugin.instance.setBeautyOption(faceRed: beautyParamList[index]['value']);
        break;
      case '磨皮':
        ZegoFaceunityPlugin.instance.setBeautyOption(faceBlur: beautyParamList[index]['value']);
        break;
      case '大眼':
        ZegoFaceunityPlugin.instance.setBeautyOption(eyeEnlarging: beautyParamList[index]['value']);
        break;
      case '瘦脸':
        ZegoFaceunityPlugin.instance.setBeautyOption(cheekThinning: beautyParamList[index]['value']);
        break;
      case 'V脸':
        ZegoFaceunityPlugin.instance.setBeautyOption(cheekV: beautyParamList[index]['value']);
        break;
      case '窄脸':
        ZegoFaceunityPlugin.instance.setBeautyOption(cheekNarrow: beautyParamList[index]['value']);
        break;
      case '小脸':
        ZegoFaceunityPlugin.instance.setBeautyOption(cheekSmall: beautyParamList[index]['value']);
        break;
      case '下巴':
        ZegoFaceunityPlugin.instance.setBeautyOption(chinLevel: beautyParamList[index]['value']);
        break;
      case '额头':
        ZegoFaceunityPlugin.instance.setBeautyOption(foreHeadLevel: beautyParamList[index]['value']);
        break;
      case '鼻子':
        ZegoFaceunityPlugin.instance.setBeautyOption(noseLevel: beautyParamList[index]['value']);
        break;
      case '嘴型':
        ZegoFaceunityPlugin.instance.setBeautyOption(mouthLevel: beautyParamList[index]['value']);
        break;
    }
  }

  void faceunitySettingPage(BuildContext context) {
    showModalBottomSheet<void>(
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.1),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setBottomSheetState) {
            return Container(
                height: 200.0,
                padding: const EdgeInsets.all(20),
                color: const Color.fromRGBO(0, 0, 0, 0.8),
                child: ListView.builder(
                  itemCount: beautyParamList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Text(
                          beautyParamList[index]['name'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        Expanded(
                          child: CupertinoSlider(
                            value: beautyParamList[index]['value'],
                            min: beautyParamList[index]['min'],
                            max: beautyParamList[index]['max'],
                            divisions: 20,
                            onChanged: (value) {
                              setBottomSheetState(() {
                                //print("current value: $value");
                                beautyParamList[index]['value'] = value;
                                setBeautyOption(index);
                              });
                            },
                          ),
                        )
                      ],
                    );
                  },
                ));
          },
        );
      },
    );
  }
}
