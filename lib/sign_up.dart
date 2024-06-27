import 'package:flutter/material.dart';
// import 'package:parpal/database_helper.dart';
import 'package:parpal/login.dart';
import 'package:parpal/styled_btn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _signUpFormGlobalKey = GlobalKey<FormState>();

  String usernameInput = "";
  String passwordInput = "";
  String confirmPasswordInput = "";

  bool passwordsMatch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up")
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _signUpFormGlobalKey,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      children: [
                        TextFormField(
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: "Username",
                              isDense: true,
                            ),
                            validator: (username) {
                              if (username == null || username.isEmpty) return 'Username not provided';
                              if (username.length <= 2) return "Minimum 3 characters";
                              return null;
                            },
                            onSaved: (username) {usernameInput = username!;}
                          ),
                      
                        const SizedBox(height: 20),
                    
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            isDense: true,
                          ),
                          validator: (password) {
                            if (password == null || password.isEmpty) return 'Password not provided';
                            if (password.length <= 5) return "Minimum 6 characters";
                            return null;
                          },
                          onSaved: (password) {passwordInput = password!;}
                        ),

                        const SizedBox(height: 20),

                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "Confirm Password",
                            isDense: true,
                          ),
                          validator: (password) {
                            if (password == null || password.isEmpty) return 'Password not provided';
                            if (password.length <= 5) return "Minimum 6 characters";
                            return null;
                          },
                          onSaved: (confirmPassword) {confirmPasswordInput = confirmPassword!;}
                        ),                        
                        
                        const SizedBox(height: 20),

                        StyledButton (onPressed: () {
                          if (_signUpFormGlobalKey.currentState!.validate()) {

                            _signUpFormGlobalKey.currentState!.save();
                            
                            if (passwordInput != confirmPasswordInput) {
                              _signUpFormGlobalKey.currentState!.reset();
                              setState(() { passwordsMatch = false; });
                              return;
                            }
                          
                            () async {
                              // await DatabaseHelper.instance.add();
                            };

                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                            );
                          }
                        }, text: "Sign Up"),

                        passwordsMatch ? const Text("") : const Text("Passwords do not match. Please try again", style: TextStyle(color: Colors.red)),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          const Text("Already Have an Account? "),
                          TextButton(
                            onPressed: () {
                               Navigator.pop(context);
                            },
                            child: Text("Log In", style: buttonTextStyle)
                          ),
                        ]),
                      ]
                    ),
                  ),
                ) 
              )
            ]
        )
      ),
    );
  }
}