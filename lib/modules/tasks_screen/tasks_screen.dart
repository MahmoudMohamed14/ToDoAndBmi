import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/modules/counter/cubit/cubit.dart';
import 'package:learn/modules/counter/cubit/states.dart';
import 'package:learn/shared/componants/components.dart';
import 'package:learn/shared/componants/constants.dart';

class TaskScreen extends StatelessWidget {
  @override





  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit,CounterStates>(
      listener: (context,state){},
      builder: (context,state)=> CounterCubit.get(context).newTasks.isEmpty?Center(child: Text('Empty',style: TextStyle(fontSize: 30),)):ListView.separated(itemBuilder:(context,index)=>tasks(model: CounterCubit.get(context).newTasks[index],context: context),
          separatorBuilder: (context,index)=>Container(
            width: double.infinity,
            height: 1,
            color: Colors.black,

          ), itemCount: CounterCubit.get(context).newTasks.length),

    );
  }
}
