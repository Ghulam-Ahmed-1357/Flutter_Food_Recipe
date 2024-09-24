// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unused_import, camel_case_types, sort_child_properties_last, unused_local_variable, avoid_print, prefer_typing_uninitialized_variables, curly_braces_in_flow_control_structures, unused_element

// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/login1.dart';
import 'package:food_recipe/util.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isObscure = true;
  bool isObscure1 = true;

  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  void userSignup() async {
    var email = emailcontroller.text;
    var password = passwordcontroller.text;
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Util.showSuccess(context, "User Created Successfully!");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: ((context) => Login_Page())),
          (_) => false);
      print("User Created Successfully");
      //
    } on FirebaseAuthException catch (e) {
      Util.showError(context, e.message);
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Signup",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          // Image.network(
          //   "https://tse3.mm.bing.net/th?id=OIP.9UFR5koGNJIN45SwLZdwJQHaFM&pid=Api&P=0&h=220",
          //   fit: BoxFit.contain,
          // ),
          Form(
            key: formkey,
            child: Container(
              height: double.infinity,
              color: Color.fromARGB(255, 77, 75, 75),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(children: [
                        Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://tse4.mm.bing.net/th?id=OIP.1lBsM0NlKeGjb7FsoJ_sGQHaE8&pid=Api&P=0&h=220"),
                                  fit: BoxFit.fill)),
                        ),
                        Positioned(
                            bottom: 60,
                            right: 0,
                            child: Container(
                              height: 65,
                              width: 180,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  left: BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  // No bottom border
                                ),
                                // borderRadius: BorderRadius.circular(
                                //     12),
                              ),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    "Recipe".toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ))
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          // label: Text("First name"),
                          // labelText: "First name",
                          hintText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          } else if (value.length < 6) {
                            return "Password must be 6 characters long";
                          }
                          return null;
                        },
                        obscureText: isObscure1,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure1 = !isObscure1;
                                });
                              },
                              icon: Icon(
                                isObscure1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: confirmpasswordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please confirm your password";
                          }
                          if (confirmpasswordcontroller.text !=
                              passwordcontroller.text) {
                            return "Password do not match";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Confirm Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        obscureText: isObscure,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          bool isValid = formkey.currentState!.validate();
                          if (isValid) {
                            userSignup();
                          }
                        },
                        child: Text("Signup",
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size.fromHeight(50),
                          // elevation: 10,
                          // shadowColor: Color.fromARGB(255, 58, 181, 172)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Login_Page())));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
