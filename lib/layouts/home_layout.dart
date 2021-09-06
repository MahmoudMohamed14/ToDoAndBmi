import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:learn/modules/archive_screen/archive_screen.dart';
import 'package:learn/modules/counter/cubit/cubit.dart';
import 'package:learn/modules/counter/cubit/states.dart';
import 'package:learn/modules/done_screen/done_screen.dart';

import 'package:learn/modules/tasks_screen/tasks_screen.dart';
import 'package:learn/shared/componants/components.dart';
import 'package:learn/shared/componants/constants.dart';
import 'package:sqflite/sqflite.dart';


class HomeLayout extends StatelessWidget{







  var edttitle=TextEditingController();
  var edtdate=TextEditingController();
  var edttime=TextEditingController();
  var scafoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();
  @override




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CounterCubit()..creatTable(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){
          if(state is InsertRawStates){
            Navigator.pop(context);
          }
        },
        builder: (context,state)=> Scaffold(
          key: scafoldkey,
          appBar: AppBar(
            title: Text(CounterCubit.get(context).title[CounterCubit.get(context).currentindex]),

          ),
          body: CounterCubit.get(context).screen[CounterCubit.get(context).currentindex],//data.length==0? Center(child: CircularProgressIndicator()):

          floatingActionButton: FloatingActionButton(

            onPressed: (){



              if(!CounterCubit.get(context).isadd) {

                if(formkey.currentState.validate()){
                  CounterCubit.get(context).inesertRow(title: edttitle.text, date: edtdate.text, time: edttime.text).then((value) {

                    CounterCubit.get(context).changeBotton(isshow: true, icon: Icons.edit);


                  });

                }

              }else{

                scafoldkey.currentState.showBottomSheet((context) =>

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultEditeText(control: edttitle, labelText: 'Title', validate: (String value){
                              if(value.isEmpty){
                                return 'title is empty';


                              }
                              return null;
                            },inputType: TextInputType.text),
                            SizedBox(height: 20,),
                            defaultEditeText(
                                control: edtdate,
                                labelText: 'Date',
                                validate: (String value){
                                  if(value.isEmpty){
                                    return 'Date is empty';
                                  }
                                  return null;
                                },inputType: TextInputType.datetime,
                                prefixIcon: Icons.calendar_today_outlined,
                                onTap: (){
                                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate:
                                  DateTime.now() , lastDate: DateTime.parse('2022-12-09'))
                                      .then((value){
                                    edtdate.text=DateFormat.yMMMd().format(value);


                                  }).catchError((error){
                                    print('date error'+error.toString());
                                  });
                                }

                            ),

                            SizedBox(height: 20,),
                            defaultEditeText(control: edttime, labelText: 'time', validate: (String value){
                              if(value.isEmpty){
                                return 'time is empty';
                              }
                              return null;
                            },inputType: TextInputType.datetime,prefixIcon: Icons.watch_later_outlined,onTap:()
                            {
                              showTimePicker(context: context, initialTime: TimeOfDay.now())
                                  .then((value) {
                                edttime.text=value.format(context).toString();
                              });
                            }
                            ),
                          ],
                        ),
                      ),
                    ),
                ).closed.then((value) {

                  CounterCubit.get(context).changeBotton(isshow: true, icon: Icons.edit);

                });

                CounterCubit.get(context).changeBotton(isshow: false, icon: Icons.add);
              }






              // ()  async{
              //   try{
              //     print( await getname());
              //   }catch(eror){
              //
              //   }
              // getname().then((value) {
              //   print(value);
              // }).catchError((error){});
            },
            child: Icon(CounterCubit.get(context).icons),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: CounterCubit.get(context).currentindex,
              onTap:(index){

                CounterCubit.get(context).currentIntex(index: index);

              },
              items:[
                BottomNavigationBarItem(
                    icon:Icon(Icons.menu),
                    label: 'Tasks'

                ),
                BottomNavigationBarItem(
                    icon:Icon(Icons.check_circle),
                    label: 'Done'

                ),
                BottomNavigationBarItem(
                    icon:Icon(Icons.archive_outlined),
                    label: 'Archive'

                ),
              ]
          ),
        ),
      ),
    );
  }
  Future<String> getname()async {
    return 'mahmoud';
  }


  void  delate(){

  }
}
