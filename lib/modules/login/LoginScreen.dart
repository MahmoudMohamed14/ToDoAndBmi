import 'package:flutter/material.dart';
import 'package:learn/main.dart';
import 'package:learn/modules/bmi/Bmi_Result_Screen.dart';
import 'package:learn/shared/componants/components.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
var email=TextEditingController();

  var password=TextEditingController();

  var keyvalide=GlobalKey<FormState>();
var ispassword=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: keyvalide,
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(


                      'Login' ,
                      style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),


                    ),
                  SizedBox(
                    height: 50,
                  ),
                  defaultEditeText(
                    prefixIcon: Icons.email,
                    inputType: TextInputType.emailAddress,
                      control: email,
                      labelText: 'Email',
                      validate:( String value){
                      if (value.isEmpty){
                        return 'Email is Empty';
                      }
                      return null;
                      }
                  ),

                    SizedBox(
                      height: 15,
                    ),
                    defaultEditeText(
                      pressicon: (){
                        setState(() {
                          ispassword=!ispassword;
                        });

                      },
                        prefixIcon: Icons.lock,
                        suffixIcon: ispassword ?Icons.visibility:Icons.visibility_off,
                        inputType: TextInputType.visiblePassword,
                        obscure: ispassword,
                        control: password,
                        labelText: 'Password',
                        validate:( String value){
                          if (value.isEmpty){
                            return 'Password is Empty';
                          }
                          return null;
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(function: (){
                      if(keyvalide.currentState.validate()){

                      }

                    }, text: 'login'),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(
                        'don\'t have an account?'

                      ),
                      TextButton(
                        child: Text(
                            'SingUp',
                          style: TextStyle(color: Colors.blue),


                        ),
                        onPressed: (){
                          print('SingUp');
                        },
                      ),
                    ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}