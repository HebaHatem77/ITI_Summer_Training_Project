import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordSecure = true;
  TextEditingController nameController = TextEditingController();
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
              begin: Alignment.topCenter, // بداية التدرج
              end: Alignment.bottomCenter, // نهاية التدرج
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 241, 219, 209),
                Color.fromARGB(255, 241, 219, 209),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // لون الظل مع شفافية
                spreadRadius: 2, // مدى انتشار الظل
                blurRadius: 8, // نعومة الظل
                offset: const Offset(4, 4), // الاتجاه (يمين وأسفل)
              ),
            ],
          ),
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 25,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create your account',
                    style: TextStyle(
                      fontSize: 42,
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

                  SizedBox(height: 10,),

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
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "name is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 200, 180, 174),
                        ),
                        prefixIcon: Icon(
                          Icons.perm_identity_outlined,
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
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined,
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
                    child: MaterialButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          print("email: ${emailController.text}");
                          print("Password: ${passwordController.text}");
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
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
                                print(
                                  "User registration: ${value.user?.uid}",
                                );
                              })
                              .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Failed => $error", style: TextStyle(color: Colors.black),),
                                    backgroundColor: Colors.white,
                                  ),
                                );
                              });
                        }
                      },
                      child: Text(
                        "GET STARTED",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ALREADY HAVE AN ACCOUNT?'"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text("LOG IN", style: TextStyle(
                          color: Color.fromARGB(255, 158, 123, 115),
                        ),),
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
