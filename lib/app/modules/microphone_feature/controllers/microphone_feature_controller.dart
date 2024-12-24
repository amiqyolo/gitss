import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MicrophoneFeatureController extends GetxController {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final RxnString _recordedFilePath = RxnString();
  final RxInt _timer = 0.obs;
  Timer? _recordingTimer;
  RxBool _isMicrophoneAvailable = false.obs;

  RxnString get recordedFilePath => _recordedFilePath;
  RxInt get timer => _timer;
  RxBool get isMicrophoneAvailable => _isMicrophoneAvailable;

  Future<void> _checkMicrophoneSupport() async {
    if (await Permission.microphone.request().isGranted) {
        _isMicrophoneAvailable.value = true;
    }
  }

  void _startTimer() {
    _timer.value = 0;
    _recordingTimer?.cancel();
    _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _timer.value++;
    });
  }

  Future<void> startRecording() async {
    if (_recorder.isRecording) return;

    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = '${directory.path}/recorded_audio.aac';

    await _recorder
        .openRecorder(); // Tambahkan untuk menghindari error "Recorder is not open"
    await _recorder.startRecorder(toFile: path);


      _recordedFilePath.value = path;

    // Timer untuk menghentikan rekaman setelah 10 detik
    _startTimer();
  }

  Future<void> stopRecording() async {
    if (!_recorder.isRecording) return;
    _recordingTimer?.cancel();
      _timer.value = 0;
    await _recorder.stopRecorder();
    update();
  }

  Future<void> playRecording() async {
    await _audioPlayer.play(DeviceFileSource(_recordedFilePath.value!));
  }


  @override
  void onInit() {
    super.onInit();
    _checkMicrophoneSupport();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _recorder.closeRecorder();
    _audioPlayer.dispose();
    _recordingTimer?.cancel();
    super.onClose();
  }
}
