import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class GameOverScreen extends StatefulWidget {
  final int duration;
  const GameOverScreen({super.key, required this.duration});

  @override
  State<GameOverScreen> createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {

  late AudioPlayer finishSound;

  bool isConfettiPlaying = true;
  final _confettiController = ConfettiController(
    duration: const Duration(seconds: 12),
  );

  @override
  void initState() {
    super.initState();
    finishSound = AudioPlayer();
    Future.delayed(const Duration(seconds: 1)).then((value) async{
      await finishSound.setAsset("assets/audios/won.wav");
      await finishSound.setLoopMode(LoopMode.off);
      await finishSound.setVolume(1.0);
      finishSound.play();
    });
    _confettiController.play();
  }

  @override
  void dispose() {
    finishSound.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Under ",
                    style: theme.bodyLarge,
                    children: [
                      TextSpan(
                          text: "${widget.duration}",
                          style: theme.displaySmall),
                      TextSpan(text: "seconds", style: theme.bodySmall),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Congratulations! ",
                    style: theme.bodyLarge,
                    children: [
                      TextSpan(
                          text:
                              "You've successfully completed the Flutter memory game. Your sharp memory and quick thinking have helped you emerge victorious. Keep up the good work and keep challenging yourself as you learn Flutter and continue to improve your skills.",
                          style: theme.bodySmall,
                          
                          ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text("Replay Game"),
                ),
              ],
            ),
          ),
          ConfettiWidget(
            numberOfParticles: 30,
            minBlastForce: 10,
            maxBlastForce: 20,
            blastDirectionality: BlastDirectionality.explosive,
            confettiController: _confettiController,
            gravity: 0.1,
          ),
        ],
      ),
    );
  }
}
