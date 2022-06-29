import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/colors.dart';

class MusicDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final Color color;
  final String img;
  final String songUrl;

  const MusicDetailPage(
      {Key? key,
      required this.title,
      required this.description,
      required this.color,
      required this.img,
      required this.songUrl})
      : super(key: key);
  @override
  _MusicDetailPageState createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  double _currentSliderValue = 20;

  // audio player here
  AudioPlayer? advancedPlayer;
  AudioCache? audioCache;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    //initPlayer();
  }

  /* initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
    playSound(widget.songUrl);
  }

  playSound(localPath) async {
    await audioCache.play(localPath);
  }

  stopSound(localPath) async {
    File audioFile = await audioCache.load(localPath);
    await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.stop();
  }

  seekSound() async {
    File audioFile = await audioCache.load(widget.songUrl);
    await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.seek(const Duration(milliseconds: 2000));
  }
 */
  @override
  void dispose() {
    super.dispose();
    //stopSound(widget.songUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: white,
              ),
              onPressed: null)
        ],
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: black,
      elevation: 0,
      actions: [
        IconButton(
            icon: Icon(
              Icons.more_vert,
              color: white,
            ),
            onPressed: null)
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  width: size.width - 100,
                  height: size.width - 100,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: widget.color,
                        blurRadius: 50,
                        spreadRadius: 5,
                        offset: const Offset(-10, 40))
                  ], borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Container(
                  width: size.width - 60,
                  height: size.width - 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              width: size.width - 80,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.add,
                    color: white,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 18,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          widget.description,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, color: white.withOpacity(0.5)),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.more_vert,
                    color: white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Slider(
              activeColor: primary,
              value: _currentSliderValue,
              min: 0,
              max: 200,
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
                //seekSound();
              }),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1:50",
                  style: TextStyle(color: white.withOpacity(0.5)),
                ),
                Text(
                  "4:68",
                  style: TextStyle(color: white.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.shuffle,
                      color: white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null),
                IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      color: white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null),
                IconButton(
                    iconSize: 50,
                    icon: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: primary),
                      child: Center(
                        child: Icon(
                          isPlaying ? Icons.stop : Icons.play_arrow,
                          size: 28,
                          color: white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        //stopSound(widget.songUrl);
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        //playSound(widget.songUrl);
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    }),
                IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      color: white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null),
                IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: white.withOpacity(0.8),
                      size: 25,
                    ),
                    onPressed: null)
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.tv,
                color: primary,
                size: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  "Chromecast is ready",
                  style: TextStyle(color: primary),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
