import 'package:azerox/app/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../controllers/audio_controller.dart';

class AudioPlayerWidget extends StatelessWidget {
  final AudioController audioController;
  const AudioPlayerWidget(this.audioController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: audioController,
      builder: (context, child) {
        return Row(
          children: [
            IconButton(
              icon: Icon(
                audioController.state.playing ? Icons.pause : Icons.play_arrow,
                color: AppColors.green,
              ),
              onPressed: () {
                if (audioController.state.playing) audioController.pause();
                if (!audioController.state.playing) audioController.play();
              },
            ),
            Expanded(
              child: Slider.adaptive(
                activeColor: AppColors.green,
                thumbColor: AppColors.green,
                min: 0.0,
                max: audioController.duration.inMilliseconds.toDouble(),
                value: audioController.position.inMilliseconds.toDouble(),
                onChanged: (value) {
                  audioController.seek(Duration(milliseconds: value.toInt()));
                },
                onChangeStart: (value) {
                  audioController.pause();
                },
                onChangeEnd: (value) {
                  audioController.play();
                },
              ),
            ),
            Text('- ${audioController.remainingTimeString}'),
          ],
        );
      },
    );
  }
}
