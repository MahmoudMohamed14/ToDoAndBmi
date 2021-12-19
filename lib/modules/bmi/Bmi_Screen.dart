import 'dart:math';

import 'package:flutter/material.dart';

import 'Bmi_Result_Screen.dart';


class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int age=15;
  int weight=50;
dynamic height=120.0;
 bool isMale=true;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(

            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(




                width: double.infinity,

                child: Row(


                  children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                       setState(() {
                         isMale=true;
                       });
                      },
                      child: Container(

                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: isMale? Colors.blue: Colors.black12,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Image(image: AssetImage('asset/image/male.png'),
                              height: 90,
                              width: 90,
                            ),
                            Text('MALE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),

                    ),
                  ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale=false;
                          });
                        },
                        child: Container(

                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:isMale?Colors.black12:Colors.blue,),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('asset/image/female.png'),
                                height: 90,
                                width: 90,
                              ),
                              Text('FEMALE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ),
                    ),
                ],),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color:Colors.black26, ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.center ,

                  //:
                  children: [
                    Text('HEIGHT',style: TextStyle(fontSize: 25,),),
                    Row(
                      crossAxisAlignment:CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Text('${height.round()}',style: TextStyle(fontSize: 70,),),
                        Text('cm',style: TextStyle(fontSize:20,),),
                      ],
                    ),
                  Slider(value:height,
                    max: 220,
                    min: 80.0,
                    onChanged: (value){
                  setState(() {
                    height=value;
                  });
                  },)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                //color: Colors.black38,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color:Colors.black38, ),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center ,
                       children: [
                         Text('Weight',style: TextStyle(fontSize: 25),),
                         Text('$weight',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold)),
                         Row(
                           mainAxisAlignment:MainAxisAlignment.center ,
                           children: [
                             Container(
                               child: TextButton(
                                   onPressed: (){
                                     setState(() {
                                       weight++;
                                     });
                                   }
                                   ,
                                   child: Text('+',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))
                               ),
                               decoration: BoxDecoration(shape: BoxShape.circle,color:Colors.blue, ),
                             ),
                             SizedBox(width: 20,),
                             Container(
                               child: TextButton(
                                   onPressed: (){
                                     setState(() {
                                       weight--;
                                     });

                                   },
                                   child: Text('-',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))
                               ),
                               decoration: BoxDecoration(shape: BoxShape.circle,color:Colors.blue, ),
                             ),
                           ],
                         ),
                       ],

                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color:Colors.black38, ),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center ,
                        children: [
                          Text('Age',style: TextStyle(fontSize: 25)),
                          Text('$age',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.center ,
                            children: [
                              Container(
                                child: TextButton(
                                    onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    child: Text('+',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))
                                ),
                                decoration: BoxDecoration(shape: BoxShape.circle,color:Colors.blue, ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                child: TextButton(
                                    onPressed: (){
                                      setState(() {
                                        age--;
                                      });

                                    },
                                    child: Text('-',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))
                                ),
                                decoration: BoxDecoration(shape: BoxShape.circle,color:Colors.blue, ),
                              ),
                            ],
                          ),
                        ],

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20,end: 20,bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),color:Colors.blue,
              ),


              width: double.infinity,



              child: MaterialButton(onPressed: (){

                  var result=weight/pow(height/100,2);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiResult(age: age,result: result,isMale: isMale,)
                  )
                  );

              },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color:Colors.white
                  ),
                )
                 ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
