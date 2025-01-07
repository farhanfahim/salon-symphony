import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:salon_symphony/core/app_export.dart';

import '../controller/audio_player_controller.dart';
class AudioPlayerWidget extends StatelessWidget {
  final String audioUrl;

  AudioPlayerWidget({
    required this.audioUrl,});

  @override
  Widget build(BuildContext context) {
    AudioController controller = Get.put(AudioController(audioUrl: audioUrl));

    print("Audio url ---> $audioUrl");

    return Obx(() => Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (!controller.isPlaying.value)
              controller.isInitial.value?
              SizedBox(
                height: 18,
                width: 48,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        ColorConstant.deepPurpleA201),

                  ),
                ),
              ):
              IconButton(
                icon: Icon(Icons.play_arrow),
                color: ColorConstant.primaryColor,
                onPressed: () {
                  controller.playAudio();
                  print("playAudio -- ---> $audioUrl");
                  // controller.audioPlayer.play(UrlSource(audioUrl));
                },
              ),
            if (controller.isPlaying.value)
              IconButton(
                icon: Icon(Icons.pause),
                color: ColorConstant.primaryColor,
                onPressed: () {
                  controller.pauseAudio();
                },
              ),

            Flexible(
              child: Slider(
                inactiveColor: ColorConstant.primaryColor.withOpacity(0.3),
                activeColor: ColorConstant.primaryColor,
                value: controller.position.value.inSeconds.toDouble(),
                onChanged: (value) {
                  controller.seekAudio(Duration(seconds: value.toInt()));
                },
                min: 0.0,
                max: controller.duration.value.inSeconds.toDouble(),
              ),
            ),
          ],
        ),
        controller.isInitial.value?
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
                '--:--',
                style: AppStyle.txtPoppinsMedium14
            ),
          ),
        )
        :Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${controller.position.value.inMinutes}:${(controller.position.value.inSeconds % 60).toString().padLeft(2, '0')} / '
                  '${controller.duration.value.inMinutes}:${(controller.duration.value.inSeconds % 60).toString().padLeft(2, '0')}',
              style: AppStyle.txtPoppinsMedium14
            ),
          ),
        ),

      ],
    ));
  }
}



