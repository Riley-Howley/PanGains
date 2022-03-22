import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Screens/Auth%20Screens/signin_screen.dart';
import 'package:pangains/Screens/Auth%20Screens/upload_image.dart';
import 'package:pangains/Screens/T&CS/t&cs_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fname = TextEditingController();
    var lname = TextEditingController();
    var email = TextEditingController();
    var password = TextEditingController();

    Future errorDialog() => showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Color(0xff222831),
            child: Column(
              children: [],
            ),
          ),
        );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 24),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ));
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 64),
                  child: Image.asset("assets/images/PanGains-black.jpg"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 68),
                width: MediaQuery.of(context).size.width,
                height: 54,
                child: SignInButton(
                  Buttons.FacebookNew,
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 32),
                width: MediaQuery.of(context).size.width,
                height: 54,
                child: SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 70),
                width: MediaQuery.of(context).size.width,
                height: 54,
                child: SignInButton(
                  Buttons.AppleDark,
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      "Or",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 69),
                    child: Text(
                      "First Name",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: fname,
                decoration: InputDecoration(
                  hintText: "Enter your first name",
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 69),
                    child: Text(
                      "Last Name",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: lname,
                decoration: InputDecoration(
                  hintText: "Enter your last name",
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 69),
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 69),
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 64),
                    child: Checkbox(
                      value: true,
                      onChanged: (check) {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 64),
                    child: Text(
                      "I agree to the",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 64),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TermsAndConditionsScreens(),
                          ),
                        );
                      },
                      child: Text(
                        "T&C's",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 65),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                  onPressed: () async {
                    await Register(
                        fname.text, lname.text, email.text, password.text);
                    if (code != 200) {
                      print("Error");
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UploadImageScreen(),
                        ),
                      );
                    }
                  },
                  child: Text("Sign Up"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 50),
                child: Text(
                  "Continue as guest",
                  style: TextStyle(fontSize: 18, color: Color(0xff4f4f4f)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
