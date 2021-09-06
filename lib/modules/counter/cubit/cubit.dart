import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/modules/archive_screen/archive_screen.dart';
import 'package:learn/modules/counter/cubit/states.dart';
import 'package:learn/modules/done_screen/done_screen.dart';
import 'package:learn/modules/tasks_screen/tasks_screen.dart';
import 'package:learn/shared/componants/constants.dart';
import 'package:sqflite/sqflite.dart';

class CounterCubit extends Cubit<CounterStates> {
  int count = 1;
  int currentindex = 0;
  List<Widget> screen = [TaskScreen(), DoneScreen(), ArchiveScreen()];
  List<String> title = ['Task', 'Done', 'Archive'];

  IconData icons = Icons.edit;
  bool isadd=true;
  Database database;
  List<Map>newTasks=[];
  List<Map>doneTasks=[];
  List<Map>archiveTasks=[];

  CounterCubit() : super(InitStates());

  static CounterCubit get(context) {
    return BlocProvider.of(context);
  }

  void plus() {
    count++;
    emit(PlusStates());
  }

  void minus() {
    count --;
    emit(MinusStates());
  }

  void changeBotton({@required bool isshow,@required IconData icon}){
    icons=icon;
    isadd=isshow;
    emit(ChangeIconStates());

  }
  void currentIntex({ @required int index}) {
    currentindex = index;
    emit(CurrentIndexStates());
  }
  void  creatTable(){
    openDatabase(
      'Todo.db',
      version: 1,
      onCreate: (db,version) {
        print('table create');
        db.execute('CREATE TABLE Tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time Text,status Text)')
            .then((value) {
          print('table create');


        }).catchError((error){
          print('error${error.toString()}');
        });
      },onOpen: (db){
      print('open data');
      getDate( db);
    },
    ).then((value) {
      database=value;
      emit(CreateDateStates());
    }) ;

  }
  Future inesertRow({@required String title,@required String date,@required String time})async{
    return await database.transaction((txn) {
      txn.rawInsert('INSERT INTO Tasks(title,date,time,status) VALUES ("$title","$date","$time","new")').then((value) {
        print('insert success');
        emit(InsertRawStates());
        getDate( database);

      }).catchError((error){
        print('error '+error.toString());
      });
      return null;
    });


  }

  void getDate( database) async{
    newTasks=[];
    doneTasks=[];
    archiveTasks=[];
    database.rawQuery('SELECT * FROM Tasks').then((value) {
      emit(GetDataStates());

      print(value);
      value.forEach((element) {
        if(element['status']=='done'){
          doneTasks.add(element);
        }else if(element['status']=='new'){
          newTasks.add(element);
        }else{
          archiveTasks.add(element);
        }
      });



    }).catchError((error){
      print('error get data'+error.toString());
    });


  }
  void updateData({@required String states,@required int id}){
    database.rawUpdate(
      'UPDATE Tasks SET status = ?  WHERE id = ?',
      ['$states', id],).then((value) {
      getDate( database);
      emit(UpdataStates());
    }).catchError((error){
      print('update error '+error.toString());
    });
  }
  void deleteData({@required int id}){
    database.rawDelete(
      'DELETE FROM Tasks   WHERE id = ?',
      [ id],).then((value) {
      getDate( database);
      emit(DeleteStates());
    }).catchError((error){
      print('update error '+error.toString());
    });
  }
}
