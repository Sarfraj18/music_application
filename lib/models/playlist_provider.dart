import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_application/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  //playlist of song
  final List<Song> _playList=[
    // song 1
    Song(
        songName: 'Agar Tum Saath Ho',
        artistName: 'Arijit Singh',
        albumArtImagePath: "assets/arijit.jpg",
        audioPath: 'assets/audio.jpg'
    ),
    // song 2
    Song(
        songName: 'Desi Kalakaar',
        artistName: 'Yo Yo Honey Singh',
        albumArtImagePath: "assets/honey.jpeg",
        audioPath: 'assets/audio.jpg'
    ),
    //song three
    // Song(
    //     songName: 'So Sick',
    //     artistName: 'Neyo',
    //     albumArtImagePath: "assets/arijit.jpg",
    //     audioPath: 'assets/audio.jpg'
    // ),



  ];
  //current song playing index
  int? _currentSongIndex;

  /*
  A U D I O P L A Y E R

   */

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //duration
  Duration _currentDuration =Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PlaylistProvider(){
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying=false;



  // play the song
  void play()async{
     final String path=_playList[_currentSongIndex!].audioPath;
     await _audioPlayer.stop();// stop current song
     await _audioPlayer.play(AssetSource(path));// play the new song
    _isPlaying =true;
    notifyListeners();
  }

  //pause current song
  void pause()async{
    await _audioPlayer.pause();
    _isPlaying=false;
    notifyListeners();
  }



  // resume playing
  void resume()async{
    await _audioPlayer.resume();
    _isPlaying=true;
    notifyListeners();
  }
  // pause or resume
  void pauseOrResume()async{
    if(_isPlaying){
      pause();
    }else{
      resume();
    }
    notifyListeners();
  }


  // seek to a specific position in the current song
  void seek(Duration position)async{
    await _audioPlayer.seek(position);
  }


  // play next song
  void playNextSong()async{
    if(_currentSongIndex !=null){
      if(_currentSongIndex! < _playList.length -1){
        // go to the next song ,loop back to the first song
        currentSongIndex=0;
      }
    }
  }


  // play previous song
  void playPreviousSong()async{
    // if more then 2 w]sec have passed .restart the current song
    if(_currentDuration.inSeconds <2){}
    // if it's within first 2 second of the song, go to the previous song
     else{
       if( _currentSongIndex!> 0){
         currentSongIndex=_currentSongIndex! -1;
       }else{
         //if it's the first song, go to the last song
         currentSongIndex=_playList.length -1;
       }

    }
  }



  // listen to duration
   void listenToDuration(){

     // listen for total duration
     _audioPlayer.onDurationChanged.listen((newDuration){
       _totalDuration = newDuration;
       notifyListeners();
     });


     // listen for current duration
     _audioPlayer.onPositionChanged.listen((newPosition){
       _currentDuration = newPosition;
           notifyListeners();
     });


     // listen for song completed
     _audioPlayer.onPlayerComplete.listen((event){playNextSong();
     });
   }


  // dispose audio player

  /*

  G E T T E R S

   */
List<Song> get playlist =>_playList;
int? get currentSongIndex => _currentSongIndex;
bool get isPlaying => _isPlaying;
Duration get currentDuration => _currentDuration;
Duration get totalDuration => _totalDuration;


/*
S E T T E R
 */
set currentSongIndex(int? newIndex){
  // update current song index
  _currentSongIndex=newIndex;

   if(newIndex != null){
     play();// play the song at the new index
   }
  //update UI
  notifyListeners();


}


}