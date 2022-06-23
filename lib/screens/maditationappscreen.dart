import 'package:flutter/material.dart';
import 'package:mymeditationapp/models/item_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMeditationAppScreen extends StatefulWidget {
  @override
  State<MyMeditationAppScreen> createState() => _MyMeditationAppScreenState();
}

class _MyMeditationAppScreenState extends State<MyMeditationAppScreen> {
  final List<Item> items = [
    Item(
        name: "Forest",
        audioPath: "meditation_audios/forest.mp3",
        imagePath: "meditation_images/forest.jpeg"),
    Item(
        name: "Night",
        audioPath: "meditation_audios/night.mp3",
        imagePath: "meditation_images/night.jpeg"),
    Item(
        name: "Ocean",
        audioPath: "meditation_audios/ocean.mp3",
        imagePath: "meditation_images/ocean.jpeg"),
    Item(
        name: "Waterfall",
        audioPath: "meditation_audios/waterfall.mp3",
        imagePath: "meditation_images/waterfall.jpeg"),
    Item(
        name: "Wind",
        audioPath: "meditation_audios/wind.mp3",
        imagePath: "meditation_images/wind.jpeg"),
  ];
  final AudioPlayer audioPlayer = AudioPlayer();

  int? playingIndex;

  Widget showIcon(int currentIndex) {
    if (playingIndex == currentIndex) {
      return FaIcon(FontAwesomeIcons.stop);
    } else {
      return FaIcon(FontAwesomeIcons.play);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(items[index].imagePath)),
                    ),
                    height: 100,
                    child: ListTile(
                      title: Text(items[index].name),
                      leading: IconButton(
                          icon: showIcon(index),
                          onPressed: () {
                            if (playingIndex == index) {
                              setState(() {
                                playingIndex = null;
                              });

                              audioPlayer.stop();
                            } else {
                              audioPlayer.setAsset(items[index].audioPath);
                              audioPlayer.play();

                              setState(() {
                                playingIndex = index;
                              });
                            }
                          }),
                    ),
                  ),
                );
              })),
    );
  }
}
