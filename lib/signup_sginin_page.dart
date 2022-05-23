import 'package:flutter/material.dart';
import 'categories_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpLogin extends StatefulWidget {
  const SignUpLogin({Key? key}) : super(key: key);

  static const routeName = '/SignUp-Login';

  @override
  State<SignUpLogin> createState() => _SignUpLoginState();
}

enum AuthMode { Signup, Login }

class _SignUpLoginState extends State<SignUpLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  AuthMode _authMode = AuthMode.Login;

  final Map<String, String> _authData = {
    'username': '',
    'email': '',
    'password': '',
  };

  //var _isLoadin = false;

  final _passwordController = TextEditingController();

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_authMode == AuthMode.Login ? 'SignIn' : 'SignUp'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              _username(context),
              const SizedBox(
                height: 10,
              ),
              _email(context),
              const SizedBox(
                height: 10,
              ),
              _password(context),
              const SizedBox(
                height: 10,
              ),
              if (_authMode == AuthMode.Signup) _confirmPass(context),
              const SizedBox(
                height: 10,
              ),
              _raisedButton(context),
              const SizedBox(
                height: 10,
              ),
              _textButton(context),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _username(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Username',
        hintText: 'enter username',
      ),
      keyboardType: TextInputType.text,
      validator: (val) {
        if (val!.isEmpty || !RegExp(r"^[a-zA-Z]+").hasMatch(val)) {
          return 'Invalid username';
        }
        return null;
      },
      onSaved: (val) {
        _authData['username'] = val!;
      },
    );
  }

  String? errorForEmail;
  String? errorForPass;

  TextFormField _email(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'enter new email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (val) {
        if (val!.isEmpty ||
            !RegExp(r"^[a-zA-Z0-9_\-.]+@[a-z]+\.[a-z]").hasMatch(val)) {
          return 'Invalid email';
        }
        return errorForEmail;
      },
      onSaved: (val) {
        _authData['email'] = val!;
      },
    );
  }

  TextFormField _password(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
      ),
      controller: _passwordController,
      obscureText: true,
      validator: (val) {
        if (val!.isEmpty || val.length <= 6) {
          return 'Invalid password';
        }
        return errorForPass;
      },
      onSaved: (val) {
        _authData['password'] = val!;
      },
    );
  }

  TextFormField _confirmPass(BuildContext context) {
    return TextFormField(
      enabled: _authMode == AuthMode.Signup,
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Confirm password',
      ),
      obscureText: true,
      validator: _authMode == AuthMode.Signup
          ? (value) {
              if (value != _passwordController.text) {
                return 'password Not Matching';
              }
              return null;
            }
          : null,
    );
  }

  ElevatedButton _raisedButton(BuildContext context) {
    return ElevatedButton(
      child: Container(
        child: Text(_authMode == AuthMode.Login ? 'Login' : 'Sign Up'),
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: _submit,
    );
  }

  TextButton _textButton(BuildContext context) {
    return TextButton(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
        child: Text(
          _authMode == AuthMode.Login ? 'Sign Up' : 'Login',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      onPressed: _switchAuthMode,
    );
  }

  void _submit() async {

    errorForEmail = null;
    errorForPass = null;

    if (!_formKey.currentState!.validate()) {
      print('error in checking data');
      return;
    }
    _formKey.currentState?.save();

    if (_authMode == AuthMode.Login) {
      // log in
      print('login');
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _authData['email']!,
          password: _authData['password']!,
        );
        print('login data is right');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Category()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          errorForEmail = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorForPass = 'Wrong password provided for that user.';
        } else {
          errorForEmail = e.message;
        }
      }
    } else {
      // sign up
      try {
        print('hi');
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _authData['email']!,
          password: _authData['password']!,
        );
        print('registration done');
        setState(() {
          _authMode = AuthMode.Login;
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          errorForPass = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorForEmail = 'The account already exists for that email.';
        } else {
          errorForEmail = e.message;
        }
      } catch (e) {
        print('hello');
        print(e);
      }
    }
    if (!_formKey.currentState!.validate()) {
      print('error when checking from database');
      return;
    }
  }
}
