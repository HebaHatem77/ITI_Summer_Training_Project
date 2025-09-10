import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_project/firebase/register_screen.dart';
import 'package:iti_project/layout/layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordSecure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 241, 219, 209),
                  Color.fromARGB(255, 241, 219, 209),
                  ],
            )
            ,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // لون الظل مع شفافية
                spreadRadius: 2, // مدى انتشار الظل
                blurRadius: 8,   // نعومة الظل
                offset: const Offset(4, 4), // الاتجاه (يمين وأسفل)
              ),
            ],
          ),
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 25,
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: "cursive",
                      color: Color.fromARGB(255, 158, 123, 115),
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 200, 180, 174),
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(height: 50,),
                  SizedBox(height: 20,),

                  Container(
                    // padding: EdgeInsets.only(top: 15, bottom: 2),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 241, 238),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12, // لون الظل مع شفافية
                          spreadRadius: 1, // مدى انتشار الظل
                          blurRadius: 8,   // نعومة الظل
                          offset: const Offset(4, 4), // الاتجاه (يمين وأسفل)
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "email is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 200, 180, 174),
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color.fromARGB(255, 200, 180, 174),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 250, 241, 238),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),


                  // SizedBox(height: 20,),

                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 241, 238),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12, // لون الظل مع شفافية
                          spreadRadius: 1, // مدى انتشار الظل
                          blurRadius: 8,   // نعومة الظل
                          offset: const Offset(4, 4), // الاتجاه (يمين وأسفل)
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isPasswordSecure,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "password is required";
                        }
                        if (value.length < 7) {
                          return "password must ba at least 7";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 200, 180, 174),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Color.fromARGB(255, 200, 180, 174),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 250, 241, 238),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordSecure = !isPasswordSecure;
                            });
                          },
                          icon: Icon(
                            isPasswordSecure
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            color: Color.fromARGB(255, 200, 180, 174),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 253, 155, 132),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              print("email: ${emailController.text}");
                              print("Password: ${passwordController.text}");
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  )
                                  .then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Success", style: TextStyle(color: Colors.black)),
                                        backgroundColor: Colors.white,
                                      ),
                                        );
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => Layout()),
                                    );
                                    print("User registration: ${value.user?.uid}");
                                  })
                                  .catchError((error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Failed => $error", style: TextStyle(color: Colors.black)),
                                        backgroundColor: Colors.white,
                                      ),
                                    );
                                  });
                            }
                          },
                          child: Text(
                            "LOG IN",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 0,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: emailController.text)
                              .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Show your Email!", style: TextStyle(color: Colors.black)),
                                    backgroundColor: Colors.white
                                  ),
                                );
                              })
                              .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Failed => $error"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              });
                        },
                        child: Text(
                          "Forget password?",
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("DO NOT HAVE AN ACCOUNT?'"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text("Register Now", style: TextStyle(
                          color: Color.fromARGB(255, 158, 123, 115),
                        ),),
                      ),
                    ],
                  ),
                    ],
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
