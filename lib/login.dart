import 'package:flutter/material.dart';
import 'package:parpal/sign_up.dart';
import 'package:parpal/styled_btn.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    String usernameInput = "";
    String passwordInput = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In")
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

                        StyledButton(onPressed: () {}, text: "Log In"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          const Text("Don't Have an Account? "),
                          TextButton(
                            onPressed: () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()
                                )
                               );
                            },
                            child: Text("Sign Up", style: buttonTextStyle)
                          ),
                        ])
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