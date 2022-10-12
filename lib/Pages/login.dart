import 'package:flutter/material.dart';
import 'package:frontend/Helper/text_input.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double multiplier = 3;
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Please enter your name',
                style: TextStyle(
                  fontSize: multiplier * unitHeightValue,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.0,
                  color: Colors.black,
                ),
              ),
              const TextInput(),
            ],
          ),
        ),
      ),
    );
  }
}

