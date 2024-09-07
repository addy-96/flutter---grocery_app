import 'package:flutter/material.dart';
import 'package:prm_cart/services/authServices.dart';
import 'package:prm_cart/theme/style.dart';

class Auth extends StatefulWidget {
  Auth({super.key, required this.authType});

  String authType;
  @override
  State<Auth> createState() => _LoginState();
}

class _LoginState extends State<Auth> {
  final _auth = AuthServices();

  Color color = Colors.black38;

  final _formKey = GlobalKey<FormState>();

  String? _enteredUsername;
  String? _enteredEmail;
  String? _enteredPassword;

  _onAuthSignTap() {
    bool isVlaid = _formKey.currentState!.validate();

    if (isVlaid) {
      _formKey.currentState!.save();
      if (widget.authType == 'login') {
        _auth.onLogin(context, _enteredEmail!, _enteredPassword!);
      } else {
        _auth.onSignUp(
            context, _enteredEmail!, _enteredPassword!, _enteredUsername!);
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/authBackground.jpg',
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.fill,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.authType == 'login'
                        ? 'Already Have an Account ? '
                        : 'Create an Acoount ? ',
                    style: AppWidget().buttonText(Colors.black45),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (widget.authType == 'login') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => Auth(authType: 'signup'),
                          ),
                        );
                      }
                      if (widget.authType == 'signup') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => Auth(authType: 'login'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      widget.authType == 'login' ? ' SignUp' : 'Login',
                      style: AppWidget().buttonText(Colors.green),
                    ),
                  )
                ],
              )
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: width > 800
                    ? MediaQuery.of(context).size.width / 3
                    : double.infinity,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.authType == 'login' ? 'Login' : 'Sign up',
                            style: AppWidget().textStyle(32),
                          ),
                          if (widget.authType == 'signup')
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  hintStyle: AppWidget().black18(),
                                  prefixIcon: Icon(
                                    Icons.text_fields_outlined,
                                    color: color,
                                    size: 30,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 10) {
                                    return 'Username must have atleast 10 charcters';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _enteredUsername = newValue!;
                                },
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: AppWidget().black18(),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: color,
                                  size: 30,
                                ),
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@')) {
                                  return 'Invalid email address !';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _enteredEmail = newValue!.trim();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: AppWidget().black18(),
                                prefixIcon: Icon(
                                  Icons.password_outlined,
                                  color: color,
                                  size: 30,
                                ),
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    value.length < 8 ||
                                    value.length > 16) {
                                  return 'Password should be 8 to 16 character long';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _enteredPassword = newValue!.trim();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          GestureDetector(
                            onTap: () {
                              _onAuthSignTap();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    widget.authType == 'login'
                                        ? 'Login'
                                        : 'Sign Up',
                                    style: AppWidget().buttonText(Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (widget.authType == 'login')
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Forgot Password ? ',
                                    style: AppWidget().textStyle(20),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
