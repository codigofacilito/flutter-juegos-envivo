import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taller_juego/my_game.dart';

class MainMenu extends StatelessWidget{
 static const id = 'MainMenu';
 MyGame gameRef;
 MainMenu(this.gameRef);
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Center(
     child: BackdropFilter(
       filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
         child: Card(
             shape:RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20)
             ),
           color: Colors.black.withAlpha(100),
           child: Wrap(
             children: [
               Text("Cody corre"),
               ElevatedButton(onPressed: (){

               }, child: Text("Play",style: TextStyle(fontSize: 30)),),
               ElevatedButton(onPressed: (){

               }, child: Text("Setting",style: TextStyle(fontSize: 30)))
             ],
           ),
         )
     ),
   );
  }

}