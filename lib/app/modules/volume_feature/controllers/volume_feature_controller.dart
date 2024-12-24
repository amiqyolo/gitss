import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:volume_controller/volume_controller.dart';

class VolumeFeatureController extends GetxController {
  RxBool _isVolumeControlAvailable = false.obs;
  RxDouble _volume = 0.5.obs;
  final AudioPlayer _audioPlayer = AudioPlayer();

  RxBool get isVolumeControlAvailable => _isVolumeControlAvailable;

  RxDouble get volume => _volume;

  void updateVolume(value) {
    _volume.value = value;
    VolumeController().setVolume(value);
  }

  Future<void> playAudio() async {
    const audioPath = 'audios/theme_01.mp3';
    await _audioPlayer.play(AssetSource(audioPath));
  }

  void stopAudio() {
    _audioPlayer.stop();
  }

  Future<void> _checkVolumeControl() async {
    try {
      final currentVolume = await VolumeController().getVolume();

      _isVolumeControlAvailable.value = true;
      _volume.value = currentVolume;
    } catch (e) {
      _isVolumeControlAvailable.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _checkVolumeControl();
    VolumeController().listener((volume) {
      _volume.value = volume;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    VolumeController().removeListener();
    _audioPlayer.dispose();
    super.onClose();
  }
}
