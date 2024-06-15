import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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

              // pass

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
