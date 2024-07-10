import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_memory_game/model/AudioProvider.dart';
import 'package:flutter_memory_game/views/game_screen.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../main.dart';




class StartGameScreen extends StatefulWidget {
  const StartGameScreen({super.key});

  @override
  State<StartGameScreen> createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen>  with WidgetsBindingObserver  {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    context.read<AudioProvider>().dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          style: TextStyle(
              fontWeight: FontWeight.w800, fontStyle: FontStyle.italic),
          "Memory Game",
        ),
        centerTitle: true,
        actions: [
          context.watch<AudioProvider>().isPlaying
            ? IconButton(
                onPressed: () async {
                  await context.read<AudioProvider>().pause();
                }, icon: const Icon( Icons.music_note)
          )
            : IconButton(
                onPressed: () async {
            await context.read<AudioProvider>().play();
          }, icon: const Icon( Icons.music_off)
          )
        ]
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          LottieBuilder.asset(
            "assets/brain_animation.json",
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all<CircleBorder>(
                const CircleBorder(eccentricity: 0.0, side: BorderSide.none),
              )
            ),
            child: IconButton(
              iconSize: 80.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyFlipCardGame(),
                  ),
                );
              },
              icon: const Icon(Icons.play_arrow_outlined),
            ),
          )
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const MyFlipCardGame(),
          //       ),
          //     );
          //   },
          //   child: const Text("Start Game",
          //       style: TextStyle(fontWeight: FontWeight.w800)),
          // )
        ],
      ),
    );

    return Center(
        child: Image.asset("assets/images/splashView.jpg")
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch(state){
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        await context.read<AudioProvider>().pause();
        break;
      case AppLifecycleState.resumed:
        await context.read<AudioProvider>().play();
        break;
    }
  }
}
