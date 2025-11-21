import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_application/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S E T T I N G S',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey.shade500,        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        padding: EdgeInsets.only(right: 15,left: 15),

        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //dark Mode
            Text('Dark Mode',style: TextStyle(fontWeight: FontWeight.bold),),

            // switch
            CupertinoSwitch(
                value:
                  Provider.of<ThemeProvider>(context,listen: false).isDarkMode,

                onChanged: (value)=>
                    Provider.of<ThemeProvider>(context,listen: false).toggleTheme(),
            )
          ],
        ),
      ),
    );
  }
}
