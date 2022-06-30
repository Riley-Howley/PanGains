import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Screens/Auth%20Screens/signin_screen.dart';
import 'package:pangains/Screens/Auth%20Screens/upload_image.dart';
import 'package:pangains/Screens/Guest/guest_screen.dart';
import 'package:pangains/Screens/Payment/payment_ui.dart';
import 'package:pangains/Screens/T&CS/t&cs_screen.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../Models/workouts_perweek.dart';
import '../Dashboard/home_dashboard.dart';

class SignupScreen extends StatefulWidget {
  final StreamChatClient client;
  SignupScreen(this.client);

  @override
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  var isChecked = false;
  var fname = TextEditingController();
  var lname = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirm = TextEditingController();
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text(
        'Error, Register Failed',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
    const snackBa1r = SnackBar(
      content: Text(
        'Passwords Dont match',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
    const registerBar = SnackBar(
      content: Text(
        'Error, Register Failed',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
    const loginBar = SnackBar(
      content: Text(
        'Error, Login Failed',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
                  builder: (context) => SignInScreen(widget.client),
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
              Form(
                key: SignupScreen._formKey,
                child: Column(
                  children: [
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
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            value == null ||
                            value.contains(
                              RegExp(r'[0-9]'),
                            )) {
                          return 'Please enter your First Name, NO NUMBERS';
                        }
                        ;
                      },
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
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            value == null ||
                            value.contains(
                              RegExp(r'[0-9]'),
                            )) {
                          return 'Please enter your Last Name, NO NUMBERS';
                        }
                        ;
                      },
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
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            value == null ||
                            value.contains(
                              RegExp(r'[0-9]'),
                            ) ||
                            !value.contains('@')) {
                          return 'Please enter your Email';
                        }
                        ;
                      },
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
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty ||
                            value == null ||
                            value.length <= 5) {
                          return 'Please enter your password';
                        }
                        ;
                      },
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 69),
                          child: Text(
                            "Confirm Password",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty ||
                            value == null ||
                            value.length <= 5) {
                          return 'Please confirm your password';
                        }
                        ;
                      },
                      controller: confirm,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 64),
                          child: Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              isChecked = !isChecked;
                              setState(() {});
                            },
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
                                  builder: (context) =>
                                      TermsAndConditionsScreens(),
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
                          if (SignupScreen._formKey.currentState!.validate()) {
                            if (password.text != confirm.text) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBa1r);
                            }
                            final key = encrypt.Key.fromUtf8(
                                'Mv49V7r3xjO8gt3lH6sk6HBpwNchpetn');
                            final iv = encrypt.IV.fromLength(16);

                            final encrypter =
                                encrypt.Encrypter(encrypt.AES(key));

                            final encrypted =
                                encrypter.encrypt(password.text, iv: iv);
                            final decrypted =
                                encrypter.decrypt(encrypted, iv: iv);

                            print(
                                decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
                            print(encrypted
                                .base64); // R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s
                            await Register(fname.text, lname.text, email.text,
                                encrypted.base64);
                            await Login(email.text, encrypted.base64);

                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('email', email.text);
                            prefs.setString('pass', password.text);
                            await getSpecificAccount(email.text);
                            await getSpecificStatistic(
                                listSpecificAccount[0].accountID);
                            await getSpecificAllDaysWorkedOut(
                                listSpecificAccount[0].accountID);
                            await getAllFollowersAccount(
                                listSpecificAccount[0].accountID);
                            await getAllFollowingsAccount(
                                listSpecificAccount[0].accountID);
                            await getAllAccount();
                            await getAllSignedInFollowingsAccount(
                                listSpecificAccount[0].accountID);
                            await getAllRoutines();
                            await getAllChallenges();
                            await StreamChatCore.of(context)
                                .client
                                .disconnectUser();
                            await widget.client.connectUser(
                                User(
                                    id: '${listSpecificAccount[0].firstName}-${listSpecificAccount[0].lastName}',
                                    extraData: {
                                      "image":
                                          '${listSpecificAccount[0].profilePicUrl}',
                                    }),
                                "${listSpecificAccount[0].MessageToken}");

                            for (var i in listSpecificDaysWorkedOut) {
                              dataList.add(WorkoutsPerWeek(i.day, i.hours,
                                  charts.ColorUtil.fromDartColor(Colors.blue)));
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PaymentUIScreen(widget.client),
                              ),
                            );
                          }
                        },
                        child: Text("Sign Up"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GuestScreen(widget.client),
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 32, bottom: 50),
                        child: Text(
                          "Continue as guest",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff4f4f4f)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
