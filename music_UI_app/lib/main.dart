import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:audioplayers/audioplayers.dart';

main() => runApp(MyApp());
AudioPlayer audioPlayer = new AudioPlayer();
AudioCache audio = new AudioCache();
bool play = false;
bool stop = false;
audioplay() {
  print('playing');
  if (play == false || stop == true) {
    audio.play("Janji_Heroes_Tonight.mp3");
    play = true;
    stop = false;
  }
}

audiopause() {
  if (play == true) {
    audioPlayer.pause();
    play = false;
  }
}

audiostop() {
  if (play == true || stop == false) {
    audioPlayer.stop();
    play = false;
    stop = true;
  }
}

bool isHeartPressed = false;
bool isPlayPressed = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Music UI'),
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 40,
          ),
          decoration: BoxDecoration(
            //color: Colors.black,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.black87,
                Colors.brown,
              ],
              end: Alignment.bottomCenter,
            ),

            //image: DecorationImage(image: NetworkImage('https://raw.githubusercontent.com/SatyaNM95/Flutter_class/master/App_music.png')),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      LineIcons.angle_down,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'PLAYING FROM ALBUM',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Dil Bechara',
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: "proximanova",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Icon(
                      LineIcons.ellipsis_v,
                      color: Colors.red,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 350,
                  height: 300,
                  color: Colors.black26,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    // child: Image.asset('assets/App_music.png'),
                    child: Image.network(
                        'https://raw.githubusercontent.com/SatyaNM95/Flutter_class/master/App_music.png'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Main Tumhara",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              wordSpacing: 0.2,
                            ),
                          ),
                          Text(
                            "A.R. Rahman",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.bold,
                              wordSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      IconButton(
                          icon: (isHeartPressed == true)
                              ? Icon(
                                  LineIcons.heart,
                                  color: Colors.green,
                                  size: 35,
                                )
                              : Icon(
                                  LineIcons.heart_o,
                                  color: Colors.grey.shade400,
                                  size: 35,
                                ),
                          onPressed: () {
                            print("like");
                            isHeartPressed =
                                (isHeartPressed == false) ? true : false;
                          }),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  //color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: audioplay,
                        child: Icon(
                          LineIcons.play_circle,
                          color: Colors.blue[900],
                          size: 25,
                        ),
                      ),
                      RaisedButton(
                        onPressed: audiopause,
                        child: Icon(
                          LineIcons.pause,
                          color: Colors.pink[700],
                          size: 25,
                        ),
                      ),
                      RaisedButton(
                        onPressed: audiostop,
                        child: Icon(
                          LineIcons.stop,
                          color: Colors.red[700],
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
