import 'package:flutter/material.dart';
import 'categories_page.dart';

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
        if (_authMode == AuthMode.Login &&
            val != _authData['username']) {
          return 'username not equaled or not registered';
        }
        return null;
      },
      onSaved: (val) {
        _authData['username'] = val!;
      },
    );
  }

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
        if (_authMode == AuthMode.Login && val != _authData['email']) {
          return 'email not equaled or not registered';
        }
        return null;
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
        if (_authMode == AuthMode.Login &&
            val != _authData['password']) {
          return 'passwored not equaled or not registered';
        }
        return null;
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

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();

    if (_authMode == AuthMode.Login) {
      // log in
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Category()));
    } else {
      // sign up
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }
}
