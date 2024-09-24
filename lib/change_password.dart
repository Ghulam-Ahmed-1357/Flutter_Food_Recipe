// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipe/login1.dart';
import 'package:food_recipe/util.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isObscure = true;
  bool isObscure1 = true;
  bool isObscure2 = true;

  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    if (formKey.currentState!.validate()) {
      try {
        String email = user!.email!;

        AuthCredential credential = EmailAuthProvider.credential(
          email: email,
          password: currentPasswordController.text,
        );
        await user!.reauthenticateWithCredential(credential);

        if (newPasswordController.text == confirmNewPasswordController.text) {
          await user!.updatePassword(newPasswordController.text);
          await auth.signOut();
          Util.showSuccess(context, "Password updated! Please login again.");

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: ((context) => Login_Page())),
              (_) => false);
        } else {
          Util.showError(context, "Password do not match!");
        }
      } on FirebaseAuthException catch (e) {
        Util.showError(context, e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: currentPasswordController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Current Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  obscureText: isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your current password";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: newPasswordController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "New Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure1 = !isObscure1;
                        });
                      },
                      icon: Icon(
                        isObscure1 ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  obscureText: isObscure1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your new password";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters long";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: confirmNewPasswordController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Confirm New Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure2 = !isObscure2;
                        });
                      },
                      icon: Icon(
                        isObscure2 ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  obscureText: isObscure2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your new password";
                    }
                    if (value != newPasswordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _changePassword,
                child: Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
