

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: Icon(
     Icons.menu,
   ),
       title:Text(
         'Welcome',
       ) ,

       actions: [
      IconButton(icon: Icon(
          Icons.search,color: Colors.green,

      ),
          onPressed:() {

          }
      ),

         Icon(
             Icons.child_care
         ),


       ],backgroundColor: Colors.lightBlueAccent,
   ),
     body:Container(
       color: Colors.black87,
       child: Column
         (

         children: [

           Padding(
             padding: const EdgeInsets.all(30),
             child: Container(

               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)) ,
              clipBehavior: Clip.antiAliasWithSaveLayer,
               child: Stack(
                 alignment: Alignment.bottomCenter,


                 children: [

                   Image(
                    // fit: BoxFit.cover,
                     height:200,
                     width: 200,
                       image:NetworkImage(

                         'https://www.happybunch.com.my/wp-content/webp-express/webp-images/uploads/2021/06/HappyBunch-BabysBreath-1024x1024.jpg.webp',


                       ),
                   ),
                   Container(
                     margin: EdgeInsets.only(bottom:10.0,),
                     child: Text(
                       'Be Optimistic',textAlign: TextAlign.center

                       ,style: TextStyle(fontSize: 30,color: Colors.black87.withOpacity(.5),),
                     ),
                   ),
                 ],
               ),
             ),
           ),
       ],
       ),
     ),

   );
  }

}