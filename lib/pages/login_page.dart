import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_textfield.dart';
import 'package:authentication/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async{
    // show loading circle
    showDialog(
        context: context,
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    );

    // try sign in
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      showErrorMessage(e.code);
      // wrong email
      // if (e.code == 'user-not-found'){
      //   // show error to user
      //   wrongEmailMessage();
      // }

      // wrong password
      // else if (e.code == 'wrong-password'){
      //   // show error to user
      //   wrongPasswordMessage();
      // }
    }


  }

  // wrong email message popup
  void showErrorMessage(String message){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
            ),
          );
        },
    );
  }

  // wrong password message popup
  // void wrongPasswordMessage(){
  //   showDialog(
  //     context: context,
  //     builder: (context){
  //       return const AlertDialog(
  //         backgroundColor: Colors.deepPurple,
  //         title: Center(
  //           child: Text(
  //             'Incorrect Password',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

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

                // email
                MyTextfield(
                  controller: emailController,
                  hintText: 'email',
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
                  text: "Sign In",
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
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold
                        ),
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
