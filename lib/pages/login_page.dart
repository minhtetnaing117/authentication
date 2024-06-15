import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_textfield.dart';
import 'package:authentication/components/square_tile.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {

  LoginPage({
    super.key,
  });

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    "Welcome back you've been missed!",
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 25),
            
                //sign in
                MyButton(
                  onTap: signUserIn,
                ),
            
                const SizedBox(height: 50),
            
                // or continue
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                        ),
                      ),
            
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                            "Or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
            
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                        ),
                      ),
            
                    ],
                  ),
                ),
            
                const SizedBox(height: 50),
            
                // google + apple sign in
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                        imagePath: 'lib/images/google.png'
                    ),
            
                    SizedBox(width: 25),
            
                    // apple button
                    SquareTile(
                        imagePath: 'lib/images/apple.png'
                    ),
                  ],
                ),
            
            
                const SizedBox(height: 50),
            
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Not a member?",
                      style: TextStyle(
                        color: Colors.grey[700]
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Register now",
                      style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
