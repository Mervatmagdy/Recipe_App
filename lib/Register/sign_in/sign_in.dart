import 'package:final_project/Register/sign_up/sign_up.dart';
import 'package:final_project/home_page/home_page.dart';
import 'package:final_project/transition/transition.dart';
import 'package:flutter/material.dart';



class SignIn extends StatefulWidget {
  static const String routeName = "SignIn";
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   bool isChecked = false;// the right place :)


  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submitForm(){
    if(formKey.currentState!.validate()){
      String email = emailController.text.trim();
      String password = passwordController.text;
      Navigator.pushReplacementNamed(context, Transition.routeName);
      print('Email: $email');
      print('Password: $password');
    }
  }

  @override
  Widget build (BuildContext context){
//wrong place

    return Scaffold(
        body: ListView(
          children: [
            Column(
                children:[
                  Padding(
                    padding: EdgeInsets.only(top: 150.0, left:16.0, right:16.0),
                    child: Text('Log In',style: TextStyle(fontSize: 40.0, color: Colors.green, fontWeight: FontWeight.bold),),
                  ),

                  Padding(padding: EdgeInsets.all(16.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[200],
                                ),

                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value){
                                    if (value == null || value.isEmpty){
                                      return 'Please enter your email';
                                    }
                                    final RegExp emailRegex = RegExp(
                                      r'^[a-zA-Z0-9.]+@gmail\.com$',
                                    );
                                    if (!emailRegex.hasMatch(value)) {
                                      return 'Please enter a valid Gmail address';
                                    }

                                  },
                                )
                            ),
                            SizedBox(height: 20,),

                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[200],
                              ),
                              child: TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.lock),
                                ),
                                obscureText : true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),

                            ),
                            SizedBox(height: 5.0,),


                            Container(
                              child: CheckboxListTile(
                                title: Text('Remember me', style: TextStyle(color: Colors.grey),),
                                checkColor: Colors.black,
                                activeColor: Colors.white,
                                value: isChecked,
                                onChanged: ( value) {
                                  setState(() {
                                    isChecked =   !isChecked; //error fixed :)
                                    print('checked');
                                  });
                                },
                                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                              ),
                            ),
                            SizedBox(height: 35.0,),
                            ElevatedButton(
                              onPressed: submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text('Log In', style: TextStyle  (fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),),
                            ),
                            SizedBox(height: 3.0,),

                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: TextButton(
                                onPressed: () {
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an account?', style: TextStyle(color: Colors.grey),),
                                  TextButton(onPressed: (){
                                    Navigator.pushReplacementNamed(context, SignUp.routeName);
                                  }, child: Text('Sign up', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                  )
                ]
            ),
          ],
        )
    );
  }
}
