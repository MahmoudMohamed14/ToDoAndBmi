import 'package:flutter/material.dart';
import 'package:learn/modules/counter/cubit/cubit.dart';

Widget defaultButton
    ({
  double width=double.infinity,
  @ required Function function,

  @ required String text,
  Color color=Colors.blue
})=>
    Container(

        width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(60.0),color: color) ,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(

          onPressed: function,
          child: Text(text.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 20),),
        )
    );
Widget defaultEditeText({
  @ required  TextEditingController control,
  @ required   String labelText,
  TextInputType inputType=TextInputType.text,
  IconData prefixIcon,
  Function onTap,
  bool isClicable=true,
  IconData suffixIcon,
  bool obscure=false,
  @ required Function validate,
  Function pressicon


})=>TextFormField(
    enabled:isClicable ,
    onTap: onTap,
    controller: control,
    validator: validate,
    obscureText: obscure,
    keyboardType:inputType,
    decoration: InputDecoration(
      labelText: labelText ,
      border: OutlineInputBorder(),
      prefixIcon: Icon(prefixIcon),
      suffixIcon:suffixIcon!= null? IconButton(onPressed: pressicon, icon:Icon(suffixIcon),):null,

    )
);
Widget tasks({Map model, context}){
  return Dismissible(
    key: Key('${model['id']}'),

    onDismissed: (diraction){
      CounterCubit.get(context).deleteData(id:model['id']);


    },
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(




        children: [

          CircleAvatar(child: Text('${model['time']}',style: TextStyle(fontSize: 16),),radius: 40,),
          SizedBox(width:15 ,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${model['title']}',style: TextStyle(fontSize: 30),),
                SizedBox(height:10 ,),
                Text('${model['date']}',),

              ],),
          ),
          SizedBox(width:20 ,),
          IconButton(icon: Icon(Icons.check ,color: Colors.green,), onPressed: (){
            CounterCubit.get(context).updateData(states: 'done', id: model['id']);

          }),
          IconButton(icon: Icon(Icons.archive_outlined), onPressed: (){
            CounterCubit.get(context).updateData(states: 'archive', id: model['id']);
          })
        ],
      ),
    ),
  );
}