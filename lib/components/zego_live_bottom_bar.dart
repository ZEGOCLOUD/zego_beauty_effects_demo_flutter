import 'dart:convert';

import 'package:flutter/material.dart';

import '../beauty_effects/components/zego_beauty_effect_sheet.dart';
import '../define.dart';
import '../internal/zego_user_info.dart';
import '../utils/flutter_extension.dart';
import '../zego_sdk_manager.dart';
import 'zego_beauty_effect_button.dart';
import 'zego_switch_camera_button.dart';
import 'zego_toggle_camera_button.dart';
import 'zego_toggle_microphone_button.dart';

class ZegoLiveBottomBar extends StatefulWidget {
  const ZegoLiveBottomBar({
    required this.cohostStreamNotifier,
    this.applying,
    super.key,
  });

  final ValueNotifier<bool>? applying;
  final ListNotifier<String> cohostStreamNotifier;

  @override
  State<ZegoLiveBottomBar> createState() => _ZegoLiveBottomBarState();
}

class _ZegoLiveBottomBarState extends State<ZegoLiveBottomBar> {
  bool isCameraOn = true;
  bool isMicOn = true;
  bool isFacingCamera = true;

  @override
  Widget build(BuildContext context) {
    if (ZEGOSDKManager.instance.localUser == null) {
      return Container();
    } else {
      return ValueListenableBuilder<ZegoLiveRole>(
        valueListenable: ZEGOSDKManager.instance.localUser!.roleNotifier,
        builder: (context, role, _) {
          return getBottomBar(role);
        },
      );
    }
  }

  Widget getBottomBar(ZegoLiveRole role) {
    return buttonView(role);
  }

  Widget buttonView(ZegoLiveRole role) {
    if (role == ZegoLiveRole.host) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          beautyEffectButton(),
          toggleMicButton(),
          toggleCameraButton(),
          switchCameraButton(),
        ],
      );
    } else if (role == ZegoLiveRole.audience) {
      return ValueListenableBuilder<bool>(
        valueListenable: widget.applying!,
        builder: (context, state, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 50, height: 50),
              const SizedBox(width: 50, height: 50),
              const SizedBox(width: 50, height: 50),
              if (state) cancelApplyCohostButton() else applyCoHostButton(),
            ],
          );
        },
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          beautyEffectButton(),
          toggleMicButton(),
          toggleCameraButton(),
          switchCameraButton(),
          endCohostButton(),
        ],
      );
    }
  }

  Widget toggleMicButton() {
    return LayoutBuilder(builder: (context, constrains) {
      return SizedBox(
        width: 50,
        height: 50,
        child: ZegoToggleMicrophoneButton(
          onPressed: () {
            isMicOn = !isMicOn;
            ZEGOSDKManager.instance.expressService.turnMicrophoneOn(isMicOn);
          },
        ),
      );
    });
  }

  Widget toggleCameraButton() {
    return LayoutBuilder(builder: (context, constrains) {
      return SizedBox(
        width: 50,
        height: 50,
        child: ZegoToggleCameraButton(
          onPressed: () {
            isCameraOn = !isCameraOn;
            ZEGOSDKManager.instance.expressService.turnCameraOn(isCameraOn);
          },
        ),
      );
    });
  }

  Widget switchCameraButton() {
    return LayoutBuilder(builder: (context, constrains) {
      return SizedBox(
        width: 50,
        height: 50,
        child: ZegoSwitchCameraButton(
          onPressed: () {
            isFacingCamera = !isFacingCamera;
            ZEGOSDKManager.instance.expressService
                .useFrontFacingCamera(isFacingCamera);
          },
        ),
      );
    });
  }

  Widget beautyEffectButton() {
    return LayoutBuilder(builder: (context, constrains) {
      return SizedBox(
        width: 50,
        height: 50,
        child: ZegoBeautyEffectButton(
          onPressed: () {
            showBeautyEffectSheet(context);
          },
        ),
      );
    });
  }

  Widget applyCoHostButton() {
    return SizedBox(
      width: 120,
      height: 40,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1, color: Colors.white)),
          onPressed: () {
            final signaling = jsonEncode({
              'type': CustomSignalingType.audienceApplyToBecomeCoHost,
              'senderID': ZEGOSDKManager.instance.localUser!.userID,
              'receiverID': getHostUser()?.userID ?? '',
            });
            ZEGOSDKManager.instance.zimService
                .sendRoomCustomSignaling(signaling)
                .then((value) {
              widget.applying?.value = true;
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'apply to co-host failed: ${error.code}, ${error.message}')));
            });
          },
          child: const Text(
            'Apply to co-host',
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget cancelApplyCohostButton() {
    return SizedBox(
      width: 120,
      height: 40,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1, color: Colors.white)),
          onPressed: () {
            final signaling = jsonEncode({
              'type': CustomSignalingType.audienceCancelCoHostApply,
              'senderID': ZEGOSDKManager.instance.localUser!.userID,
              'receiverID': getHostUser()?.userID ?? '',
            });

            ZEGOSDKManager.instance.zimService
                .sendRoomCustomSignaling(signaling)
                .then((value) {
              widget.applying?.value = false;
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Cancel the application failed: ${error.code}, ${error.message}')));
            });
          },
          child: const Text(
            'Cancel the application',
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  ZegoUserInfo? getHostUser() {
    if (ZEGOSDKManager.instance.localUser?.roleNotifier.value ==
        ZegoLiveRole.host) {
      return ZEGOSDKManager.instance.localUser;
    } else {
      for (final userInfo
          in ZEGOSDKManager.instance.expressService.userInfoList) {
        if (userInfo.streamID != null) {
          if (userInfo.streamID!.endsWith('_host')) {
            return userInfo;
          }
        }
      }
    }
    return null;
  }

  Widget endCohostButton() {
    return SizedBox(
      width: 120,
      height: 40,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1, color: Colors.white)),
        onPressed: () {
          widget.cohostStreamNotifier.removeWhere((element) {
            return element == ZEGOSDKManager.instance.localUser!.streamID;
          });
          ZEGOSDKManager.instance.expressService.stopPreview();
          ZEGOSDKManager.instance.expressService.stopPublishingStream();
          ZEGOSDKManager.instance.localUser?.roleNotifier.value =
              ZegoLiveRole.audience;
        },
        child: const Text('End co-host', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
