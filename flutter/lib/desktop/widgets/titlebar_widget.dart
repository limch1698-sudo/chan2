import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hbb/models/state_model.dart'; // stateGlobal을 위해 추가

const sidebarColor = Color(0xFF0C6AF6);
const backgroundStartColor = Color(0xFF0583EA);
const backgroundEndColor = Color(0xFF0697EA);

class DesktopTitleBar extends StatelessWidget {
  final Widget? child;
  final String? peerId; // 특정 원격지의 오디오 상태를 추적하기 위해 추가

  const DesktopTitleBar({Key? key, this.child, this.peerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [backgroundStartColor, backgroundEndColor],
            stops: [0.0, 1.0]),
      ),
      child: Row(
        children: [
          Expanded(
            child: child ?? Offstage(),
          ),
          // --- 타이틀바 우측 스피커 아이콘 추가 시작 ---
          if (peerId != null)
            Obx(() {
              bool isPlaying = stateGlobal.audioPlayingStates[peerId] ?? false;
              
              return Offstage(
                offstage: !isPlaying,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image.asset(
                    'assets/speaker.png',
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }),
          // --- 타이틀바 우측 스피커 아이콘 추가 끝 ---
        ],
      ),
    );
  }
}