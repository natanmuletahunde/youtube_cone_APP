import 'package:drappointment/components/button.dart';
import 'package:drappointment/utils/config.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Make sure this is within Scaffold
      resizeToAvoidBottomInset: true, // Ensures the body adjusts when keyboard is shown
      body: SingleChildScrollView( // Wrap the entire body in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Config.primaryColor,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.email_outlined),
                    prefixIconColor: Config.primaryColor,
                  ),
                ),
                Config.spaceSmall,
                TextFormField(
                  controller: _passController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Config.primaryColor,
                  obscureText: obsecurPass,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    alignLabelWithHint: true,
                    prefixIcon: const Icon(Icons.lock_outline),
                    prefixIconColor: Config.primaryColor,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecurPass = !obsecurPass;
                        });
                      },
                      icon: obsecurPass
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.black38,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: Config.primaryColor,
                            ),
                    ),
                  ),
                ),
                Config.spaceSmall,
                Button(
                    title: 'Sign In ',
                    width: double.infinity,
                    onPressed: () {
                      Navigator.of(context).pushNamed('main');
                    },
                    disable: false)
                // login button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
