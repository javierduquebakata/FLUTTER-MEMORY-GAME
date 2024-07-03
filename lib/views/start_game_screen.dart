import 'package:flutter/material.dart';
import 'package:flutter_memory_game/views/game_screen.dart';
import 'package:lottie/lottie.dart';

class StartGameScreen extends StatefulWidget {
  const StartGameScreen({super.key});

  @override
  State<StartGameScreen> createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen> {
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
            )),
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
  }
}
