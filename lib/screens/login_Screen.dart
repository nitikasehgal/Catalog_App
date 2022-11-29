import 'package:catalog_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  static const routename = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController usercontroller = TextEditingController();
  String name = '';
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  movetohome() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, HomeScreen.routename);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(children: [
            Image.asset(
              'assets/images/hey.png',
              // height: 1050,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              "Welcome ${name}",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                        hintText: 'Enter Username', labelText: 'Username'),
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 5) {
                        return "Password cannot be less than 6 characters";
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                        hintText: 'Enter Password', labelText: 'Password'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Material(
              color: context.theme.buttonColor,
              borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
              child: InkWell(
                onTap: () => movetohome(),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  width: changebutton ? 50 : 150,
                  alignment: Alignment.center,
                  child: changebutton
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
