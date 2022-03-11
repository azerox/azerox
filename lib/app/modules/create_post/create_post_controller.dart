import 'package:azerox/app/modules/create_post/create_post_repository.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../models/post.dart';

class CreatePostController extends GetxController {
  final CreatePostRepository _repository;
  CreatePostController(this._repository);

  final RxString? image = ''.obs;
  String? contentChapter;
  String? titleChapter;
  String? mp3;
  var dateFormated = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  final isRecording = false.obs;

  Future<Post> createPost(String? mp3, String? image) async {
    return await _repository.createPost(
      content: contentChapter!,
      date: dateFormated.value,
      title: titleChapter!,
      mp3: mp3,
      image: image,
    );
  }

  final audioRecorder = FlutterSoundRecorder();
  final pathToSave = 'audio_example.aac';

  Future record() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microfone sem permissão');
    }
    await audioRecorder.openAudioSession();
    await audioRecorder.startRecorder(toFile: pathToSave);
  }

  Future stop() async {
    await audioRecorder.stopRecorder();
    audioRecorder.recordingData();
  }

  Future toggleRecording() async {
    audioRecorder.isRecording ? await stop() : await record();
  }
}
