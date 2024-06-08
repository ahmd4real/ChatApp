import 'package:chatapp/Ui/Screens/chatPage.dart';
import 'package:chatapp/Ui/Screens/registerPage.dart';
import 'package:chatapp/Ui/Widgets/customBustton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../helper/showSnackBar.dart';
import '../Widgets/customTextFormField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'loginPage';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;
  bool loading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Form(
          key: formKey,
          child: ListView(
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
                text: 'Login',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    try {
                      await loginUser();
                      Navigator.pushNamed(context, ChatPage.id,
                          arguments: email);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        snackBar(context, 'User not found');
                      } else if (e.code == 'wrong-password') {
                        snackBar(context, 'Wrong password');
                      }
                    }

                    setState(() {
                      loading = false;
                    });
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account? ',
                      style:
                          TextStyle(color: Color.fromARGB(255, 206, 230, 218))),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text('Sign Up',
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

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
