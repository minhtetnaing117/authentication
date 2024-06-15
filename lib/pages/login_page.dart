import 'package:authentication/components/my_textfield.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {

  LoginPage({
    super.key,
  });

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(

        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),


              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                  "Welcome back you\'ve been missed!",
                style: TextStyle(
                    color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 50),

              // username
              MyTextfield(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // pass
              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot pass

              //sign in

              // or continue

              // google + apple sign in

              // not a member? register now
            ],
          ),
        ),
      ),
    );
  }
}
