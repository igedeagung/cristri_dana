import 'package:flutter/material.dart';
import 'section/intro.dart';
import 'section/couple.dart';
import 'section/date.dart';
import 'section/gallery.dart';
import 'section/reservation.dart';
import 'section/message.dart';
import 'section/closing.dart';
import 'package:just_audio/just_audio.dart';
import 'package:draggable_fab/draggable_fab.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isPlaying = true;
  final _controller = PageController();
  final audioPlayer = AudioPlayer();

  void play() async {
    const audioPath =
        'https://cdn.discordapp.com/attachments/918036911216545802/1124618169626136586/Bridal-chorus.mp3';
    await audioPlayer.setUrl(audioPath);
    await audioPlayer.setLoopMode(LoopMode.one);
    await audioPlayer.play();
  }

  void resume() async {
    audioPlayer.play();
  }

  void pause() async {
    await audioPlayer.pause();
  }

  @override
  void initState() {
    super.initState();
    play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        children: const [
          Intro(),
          Couple(),
          Date(),
          Gallery(),
          Reservation(),
          Message(),
          Closing()
        ],
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              isPlaying = !isPlaying;
              if (isPlaying) {
                resume();
              } else {
                pause();
              }
            });
          },
          child: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}