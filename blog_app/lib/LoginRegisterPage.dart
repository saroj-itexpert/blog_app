import 'package:flutter/material.dart';
import 'Authentication.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({
    this.auth,
    this.onSignedIn,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

enum FormType { login, register }

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;

  String _email = "";
  String _password = "";

//methods

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save(); //save variables is string value
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId = await widget.auth.SignIn(_email, _password);
          print("Login userId = " + userId);
        } else {
          String userId = await widget.auth.SignUp(_email, _password);
          print("Register userId = " + userId);
        }
      } catch (e) {
        print(e.toString());
      }
      widget.onSignedIn();
    }
  }

  void moveToRegister() {
    formKey.currentState
        .reset(); //remove the values from the textfields (password and email)
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState
        .reset(); //remove the values from the textfields (password and email)
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: new Container(
          margin: EdgeInsets.all(15.0),
          child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: createInputs() + createButtons(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(
        height: 10.0,
      ),
      logo(),
      SizedBox(
        height: 20.0,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: "Email",
        ),
        validator: (value) {
          return value.isEmpty ? 'Email is required' : null;
        },
        onSaved: (value) {
          return _email = value;
        },
      ),
      SizedBox(
        height: 20.0,
      ),
      TextFormField(
        validator: (value) {
          return value.isEmpty ? 'Password is required' : null;
        },
        onSaved: (value) {
          return _password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Password",
        ),
      ),
    ];
  }

  Widget logo() {
    return new Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 110.0,
        child: Image.asset('assets/fn.png'),
      ),
    );
  }

  List<Widget> createButtons() {
    if (_formType == FormType.login) {
      return [
        RaisedButton(
          onPressed: validateAndSubmit,
          textColor: Colors.white,
          color: Colors.orange,
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        FlatButton(
          onPressed: moveToRegister,
          textColor: Colors.red,
          child: Text(
            "Not have an Account? Create Account?",
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
      ];
    } else {
      return [
        RaisedButton(
          onPressed: validateAndSave,
          textColor: Colors.white,
          color: Colors.orange,
          child: Text(
            "Create Account",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        FlatButton(
          onPressed: moveToLogin,
          textColor: Colors.red,
          child: Text(
            "Already have an account? Login",
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
      ];
    }
  }
}
