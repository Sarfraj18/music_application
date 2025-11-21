import 'package:flutter/material.dart';
import 'package:music_application/components/my_drawer.dart';
import 'package:music_application/models/playlist_provider.dart';
import 'package:music_application/screens/song_screen.dart';
import 'package:provider/provider.dart';

import '../models/song.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

 //get the platlist provider
  late final dynamic playlistProvider;

@override
  void initState() {
    super.initState();
    //get playlist provider
    playlistProvider=Provider.of<PlaylistProvider>(context,listen: false);

  }
  //go to a song
  void goToSong(int songIndex){
  //update current song index
    playlistProvider.currentSongIndex=songIndex;
    
    // navigate to song screen
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SongScreen()));

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('P L A Y L I S T',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey.shade500,
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context,value,child){
          // get the playlist
          final List<Song> playlist=value.playlist;



          // return list view UI

          return ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context,index){
                // get individual song
                final Song song = playlist[index];

                // return list tile UI
                return ListTile(
                  title: Text(song.songName),
                  subtitle: Text(song.artistName),
                  leading: Image.asset(song.albumArtImagePath),
                  onTap: () => goToSong(index),

                );
              });
        }
        ),

      );


  }
}
