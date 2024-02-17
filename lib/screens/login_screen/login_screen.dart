import 'package:padhle/constants.dart';
import 'package:flutter/material.dart';
import 'package:padhle/screens/home_screen/home_screen.dart';

import '../../components/buttons.dart';



late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  static String routename = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//validate our form now
  final _formKey= GlobalKey<FormState>();
  @override
  void initState() {
    //changes current state
    // TODO: implement initState
    super.initState();
    _passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //keyboard hides when user taps anywhere
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: ListView(
            children: [
              //divide the body into two halves
              Container(
                //use media query in order to fit all screens in same manner
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.8,
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center ,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Hi ',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.w200,
                                fontSize: 50,
                                color: Colors.white,
                              )),

                          Text('Student', style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 50,
                            color: Colors.white,
                          )),
                        ],
                      ),
                    ),
                    sizedBox,
                    Text('Login to continue',style: TextStyle(fontSize: 20,color: Colors.white),)
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding*3),
                    topRight: Radius.circular(kDefaultPadding*3),
                  ),
                  color: kOtherColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              sizedBox,
                              buildEmailField(),
                              sizedBox,
                              buildPasswordField(),
                              sizedBox,
                              DefaultButton(
                                onPress: (){
                                  if(_formKey.currentState!.validate()){
                                    //go to next activity
                                    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routename, (route) => false);
                                  }
                                },
                                title: 'Login',
                                iconData: Icons.arrow_forward_outlined,
                              ),
                              sizedBox,
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }


  TextFormField buildEmailField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: kTextBlackColor,fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        labelText: 'Enter Email Address',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value){
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if(value==null || value.isEmpty){
          return 'Please enter some text';
        }
        else if(!regExp.hasMatch(value)){
          return 'Please enter a valid email address';
        }
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(
        color: kTextBlackColor,fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
          labelText: 'Password',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                _passwordVisible=!_passwordVisible;
              });
            },
            icon: Icon(
              _passwordVisible? Icons.visibility_off_outlined
                  :Icons.visibility_off_outlined,
            ),
          )
      ),
      validator: (value){
        if(value!.length<5){
          return 'Enter more than 5 characters';
        }
      },
    );
  }
}