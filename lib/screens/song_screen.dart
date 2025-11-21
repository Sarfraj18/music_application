import 'package:flutter/material.dart';
import 'package:music_application/components/neu_box.dart';
import 'package:provider/provider.dart';

import '../models/playlist_provider.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({super.key});


  // convert duration into min:sec
  String formatTime(Duration duration){
    String twoDigitsTSeconds=duration.inSeconds.remainder(60).toString().padLeft(2,'0');
    String formattedTime ="${duration.inMinutes}: $twoDigitsTSeconds";

    return formattedTime;
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context,value,child){
      //get playlist
      final playlist = value.playlist;



      // get current song  index
      final currentSong = playlist[value.currentSongIndex ?? 0];


      // return scaffold UI
      return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 14,right: 14,bottom: 15),
              child: Column(
                children: [
                  //app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      //back button
                      IconButton(onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back)
                      ),
                      //title
                      Text('P L A Y L I S T'),

                      // menu button
                      IconButton(onPressed: (){},
                          icon: Icon(Icons.menu)
                      )
                    ],
                  ),
                  // SizedBox(height: 25,),



                  //album artwork
                  NeuBox(
                    child: Column(
                      children: [
                        //image
                        ClipRRect(
                          // image
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(currentSong.albumArtImagePath)
                        ),
                        //song and artist Name
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //song and artist name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(currentSong.songName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                  Text(currentSong.artistName,style: TextStyle(fontSize: 15),)

                                ],
                              ),
                              //heart Icon
                              Icon(Icons.favorite,
                                color: Colors.red,
                              )

                            ],
                          ),
                        )
                      ],
                    ),

                  ),
                  SizedBox(height: 15,),



                  // song duration progress
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //start Time
                            Text(formatTime(value.currentDuration)),


                            //shuffle Icon
                            Icon(Icons.shuffle),


                            //repeat icon
                            Icon(Icons.repeat),

                            //end time
                            Text(formatTime(value.totalDuration))
                          ],
                        ),
                      ),
                      //song duration progress
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7)
                        ),
                        child: Slider(
                          value: value.currentDuration.inSeconds.toDouble(),
                          min: 0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          onChanged: (double double){
                            // during when the user is sliding around
                          },
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey.shade400,
                          onChangeEnd: ( double double){
                            // sliding has finished , go to that position in sing durstion
                            value.seek(Duration(seconds: double.toInt()));
                          },

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),

                  //playback Control
                  Row(
                    children: [
                      //skip previous
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playPreviousSong,
                          child: NeuBox(
                              child:Icon(Icons.skip_previous)
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),


                      //play pause
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: value.pauseOrResume,
                          child: NeuBox(
                              child:Icon(value.isPlaying ?  Icons.pause : Icons.play_arrow)
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),



                      // skip forward
                      Expanded(

                        child: GestureDetector(

                          onTap: value.playNextSong,
                          child: NeuBox(
                              child:Icon(Icons.skip_next)
                          ),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          )
      );
    }
    );
  }
}
