import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/signup.dart';
import 'package:food_recipe/terms_and_conditions.dart';
import 'package:food_recipe/util.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final formkey = GlobalKey<FormState>();
  bool isObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _onLogin() async {
    var email = emailController.text;
    var password = passwordController.text;
    try {
      var credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: ((context) => TermsAndConditionsPage())),
            (_) => false);
      }
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
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Form(
          key: formkey,
          child: Container(
            height: double.infinity,
            // color: Color.fromARGB(240, 80, 23, 2),
            color: Color.fromARGB(255, 63, 55, 55),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://tse2.mm.bing.net/th?id=OIP.4ihPWq0yuERvxEfGSQglnwHaEK&pid=Api&P=0&h=220"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
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
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      obscureText: isObscure,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, right: 30, left: 30, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        bool isValid = formkey.currentState!.validate();
                        if (isValid) {
                          _onLogin();
                        }
                      },
                      child: Text("Login",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                          backgroundColor: Color.fromARGB(255, 16, 18, 44)),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Don't have an account? Signup",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Signup())));
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
