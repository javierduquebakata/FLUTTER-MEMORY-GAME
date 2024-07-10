


import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider with ChangeNotifier{

  late AudioPlayer _audioPlayer;
  AudioPlayer get audioPlayer => _audioPlayer;

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool playing){
    _isPlaying = playing;
    notifyListeners();
  }

  AudioProvider(){
    _audioPlayer = AudioPlayer();
    _audioPlayer.playerStateStream.listen((PlayerState event) {
      isPlaying = event.playing;
    });
  }

  Future<void> pause() async{
    //isPlaying = false;
    await _audioPlayer.pause();
  }

  Future<void> stop() async{
    //isPlaying = false;
    await _audioPlayer.stop();
  }

  Future<void> play() async{
    //isPlaying = true;
    await _audioPlayer.play();
  }

}