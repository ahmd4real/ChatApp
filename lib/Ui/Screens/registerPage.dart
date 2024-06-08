import 'package:chatapp/Ui/Screens/chatPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../helper/showSnackBar.dart';
import '../Widgets/customBustton.dart';
import '../Widgets/customTextFormField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'registerPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Form(
          key: formKey,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/spiderpic.png'),
              const Text(
                'That\'s my APP',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 206, 230, 218)),
              ),
              CustomTextFormField(
                hidden: false,
                hintText: 'Email',
                onChanged: (data) {
                  email = data;
                },
              ),
              CustomTextFormField(
                hidden: true,
                hintText: 'Password',
                onChanged: (data) {
                  password = data;
                },
              ),
              CustomButton(
                text: 'Sign Up',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    loading = true;
                    setState(() {});
                    try {
                      await registerUser();
                      Navigator.pushNamed(context, ChatPage.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        snackBar(context, 'Weak password');
                      } else if (e.code == 'email-already-in-use') {
                        snackBar(
                            context, 'Email already in use try another one');
                      }
                    }
                    loading = false;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ',
                      style:
                          TextStyle(color: Color.fromARGB(255, 206, 230, 218))),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Login',
                          style: TextStyle(
                              color: Color.fromARGB(255, 206, 230, 218))))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
