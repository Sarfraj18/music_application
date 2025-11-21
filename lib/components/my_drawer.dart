import 'package:flutter/material.dart';
import 'package:music_application/screens/setting_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //LOGO
          DrawerHeader(child: Center(
            child: Icon(Icons.music_note,size: 40,color: Theme.of(context).colorScheme.inversePrimary,),
          )
          ),
          
          // Home TIle
          Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25),
            child: ListTile(
              title: Text('H O M E'),
              leading: Icon(Icons.home),
              onTap: () => Navigator.pop(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25),
            child: ListTile(
              title: Text('S E T T I N G S'),
              leading: Icon(Icons.settings),
              onTap: (){
                // pop drewer
                Navigator.pop(context);
                // navigate to settings
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
