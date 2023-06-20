import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/home.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 193, 172),
        title: const Text("-Login-"),
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(Icons.exit_to_app_rounded),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      height: 300,
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              controller: _usernameController,
                              style: const TextStyle(
                                  fontSize: 15, fontStyle: FontStyle.italic),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Username',
                                prefixIcon: const Icon(Icons.person_3_outlined),
                                prefixIconColor: Color.fromARGB(255, 0, 0, 0),
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                                contentPadding: const EdgeInsets.all(15.0),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your Username';
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 25,
                              ),
                              child: TextFormField(
                                controller: _passwordController,
                                style: const TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic),
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hintText: 'Password',
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  prefixIconColor: Color.fromARGB(255, 0, 0, 0),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                  contentPadding: const EdgeInsets.all(15.0),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Your Password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  checkLogin(context);
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 15,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 18, 193, 172)),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(150, 30)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void checkLogin(BuildContext ctx) {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (ctx) => ScreenHome()),
      );
    } else {
      print("Username and Password Doesn't Match");
      final _errorMessage = "Username and password doesn't match";
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.deepOrange,
          content: Text(_errorMessage),
        ),
      );
    }
  }
}
