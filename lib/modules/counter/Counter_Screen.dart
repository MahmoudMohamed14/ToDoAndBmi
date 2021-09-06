import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/modules/counter/cubit/cubit.dart';
import 'package:learn/modules/counter/cubit/states.dart';


class CounterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state){},
        builder: (context,state)=>Scaffold(
          appBar: AppBar(
            title: Text('Counter'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(onPressed: (){
                    CounterCubit.get(context).minus();
                  },
                    child: Text('Minus'),color: Colors.greenAccent,
                  ),
                  SizedBox(width: 20,),
                  Text('${ CounterCubit.get(context).count}',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                  SizedBox(width: 20,),
                  MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: (){

                      CounterCubit.get(context).plus();

                    },
                    child: Text('Plus'),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }




}
