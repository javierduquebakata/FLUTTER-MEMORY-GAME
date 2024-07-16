import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_memory_game/views/start_game_screen.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import 'model/AudioProvider.dart';


void main() async {

  // OpenAI.apiKey = "sk-svcacct-k7l26Bw1l2dDXyyxJbPVT3BlbkFJrjEocm15Ctv27PKetIMf";
  //
  // final image = await OpenAI.instance.image.create(
  //   model: "dall-e-3",
  //   prompt: "dog",
  // );
  // for (int index = 0; index < image.data.length; index++) {
  //   final currentItem = image.data[index];
  //   print(currentItem.url);
  // }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      lazy: false,
      create: (context)  {
        AudioProvider prov = AudioProvider();

        prov.audioPlayer.setAsset("assets/audios/Ambient.mp3").then((value) {
          prov.audioPlayer.setLoopMode(LoopMode.one).then((value){
            prov.audioPlayer.play();
          });
        });
        return prov;
      },child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "VisbyCF",
        primarySwatch: Colors.blue,
      ),
      home: const StartGameScreen() ,
    );
  }
}


