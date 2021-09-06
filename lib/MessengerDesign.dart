import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MessengerDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        elevation: 0.0,
      backgroundColor: Colors.white,

      title: Row(
        children: [
          CircleAvatar(

            radius: 18,
            backgroundImage: NetworkImage( 'https://www.happybunch.com.my/wp-content/webp-express/webp-images/uploads/2021/06/HappyBunch-BabysBreath-1024x1024.jpg.webp',
          ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Chats',
            style: TextStyle(color: Colors.black87,fontSize: 25,),

          ),
        ],
      ),
      actions: [
        IconButton(

            icon: CircleAvatar(child: Icon(Icons.camera_alt_rounded,),
              radius: 20,
            ), onPressed: null,
        ),
        IconButton(
            icon: CircleAvatar(child: Icon(Icons.edit,),radius: 20,
            ), onPressed: null
        ),
      ],

    ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(

            children: [

              Container(
                padding: EdgeInsets.all(10),


                decoration:BoxDecoration(borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black26.withOpacity(.1),
                ),

                child: Row(children: [

                  Icon(Icons.search),
                  SizedBox(width:10,),
                 Text('search' ,style: TextStyle(fontSize: 20),)

                ],),
              ),
              SizedBox(height: 20,),
              Container(
                height: 100,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder:(context,index ) =>buildStoryItem(),
                    itemCount: 10,scrollDirection:Axis.horizontal,
                    separatorBuilder: (context,index ) =>SizedBox(width: 15,),
                    )
              ),
              SizedBox(height: 25,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context,item)=>buildChatItem(),
                  separatorBuilder: (context,item)=>SizedBox(height: 20,),
                  itemCount: 10),




            ],
          ),
        ),
      ),

    );
  }
   Widget buildChatItem()=> Row(children: [
     Stack(
       alignment: Alignment.bottomRight,
       children: [
         CircleAvatar(
           radius: 25,
           backgroundImage: NetworkImage(
             'https://www.happybunch.com.my/wp-content/webp-express/webp-images/uploads/2021/06/HappyBunch-BabysBreath-1024x1024.jpg.webp',
           ),
         ),
         CircleAvatar(backgroundColor: Colors.green,radius: 5,)
       ],
     ),
   SizedBox(width: 15,),
     Expanded(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('mahmoud mohamed abdAllah Ibrahim'),
           SizedBox(height: 8,),
           Row(
             children: [
               Expanded(child: Text('where are you l\'m where are you?',maxLines: 2,overflow: TextOverflow.ellipsis,)),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Container(
                   width: 10,
                   height: 10,
                   decoration:BoxDecoration(shape: BoxShape.circle,color: Colors.black,),


                 ),

               ),
               Text('12:57 pm'),
             ],
           ),
         ],
       ),
     )
   ],);
  Widget buildStoryItem()=>  Container(
    width: 65,

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://www.happybunch.com.my/wp-content/webp-express/webp-images/uploads/2021/06/HappyBunch-BabysBreath-1024x1024.jpg.webp',
              ),
            ),
            CircleAvatar(backgroundColor: Colors.green,radius: 5,)
          ],
        ),
        Text('Mahmoud maohamed abdall',maxLines: 2 ,overflow: TextOverflow.ellipsis,),



      ],
    ),
  );
}
