// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reheat/authentication_service.dart';
import 'package:reheat/login.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  String email = '';
  final TextEditingController passwordController = TextEditingController();
  String pwd = '';
  final TextEditingController nameController = TextEditingController();
  String name = '';
  final TextEditingController phoneController = TextEditingController();
  String phone = '';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    bool isPwdSeen = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                const Text(
                  'Create account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 60),
                Material(
                  color: Colors.transparent,
                  elevation: 18,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    validator: (val) => val!.isEmpty ? '*Required' : null,
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      hintText: "Full name",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Material(
                  color: Colors.transparent,
                  elevation: 18,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      hintText: "Email",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Material(
                  color: Colors.transparent,
                  elevation: 18,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    validator: (val) => val!.length < 6
                        ? 'Password must contain 6 or more characters'
                        : null,
                    obscureText: isPwdSeen,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      hintText: "Password",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Material(
                  color: Colors.transparent,
                  elevation: 18,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    validator: (val) =>
                        val!.isEmpty || val.length < 10 ? '*Required' : null,
                    onChanged: (val) {
                      setState(() {
                        phone = val;
                      });
                    },
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      hintText: "Phone number",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 75,
                      child: Material(
                        color: Colors.orange,
                        elevation: 18,
                        borderRadius: BorderRadius.circular(30),
                        child: FlatButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              dynamic result = context
                                  .read<AuthenticationService>()
                                  .signUp(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                              if (result == null) {
                                print('error');
                              }
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("Already have an account? "),
                    InkWell(
                      child: const Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
