import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Screens/Auth%20Screens/signup_screen.dart';
import 'package:pangains/Screens/Dashboard/home_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import '../../Models/completed_workout_history.dart';
import '../../Models/workouts_perweek.dart';
import '../../main.dart';

class SignInScreen extends StatelessWidget {
  final StreamChatClient client;
  SignInScreen(this.client);
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    const snackBar = SnackBar(
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
                  builder: (context) => SignupScreen(client),
                ));
              },
              child: Text(
                "Sign Up",
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
                key: _formKey,
                child: Column(
                  children: [
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
                      controller: emailController,
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
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 64, bottom: 50),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final key = encrypt.Key.fromUtf8(
                                'Mv49V7r3xjO8gt3lH6sk6HBpwNchpetn');
                            final iv = encrypt.IV.fromLength(16);

                            final encrypter =
                                encrypt.Encrypter(encrypt.AES(key));

                            final encrypted = encrypter
                                .encrypt(passwordController.text, iv: iv);
                            final decrypted =
                                encrypter.decrypt(encrypted, iv: iv);

                            // R4P
                            //Login would go here but for the moment
                            //I am using just the specific get account
                            await Login(emailController.text, encrypted.base64);

                            if (code != 200) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else if (code == 200) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('email', emailController.text);
                              prefs.setString('pass', passwordController.text);
                              await getSpecificAccount(emailController.text);
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
                              await client.connectUser(
                                  User(
                                      id: '${listSpecificAccount[0].firstName}-${listSpecificAccount[0].lastName}',
                                      extraData: {
                                        "image":
                                            '${listSpecificAccount[0].profilePicUrl}',
                                      }),
                                  "${listSpecificAccount[0].MessageToken}");
                              for (var i in listSpecificDaysWorkedOut) {
                                dataList.add(WorkoutsPerWeek(
                                    i.day,
                                    i.hours,
                                    charts.ColorUtil.fromDartColor(
                                        Colors.blue)));
                              }
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeDashboardScreen(client),
                                ),
                              );
                            }
                          } else {
                            print("Error");
                          }
                        },
                        child: Text("Sign In"),
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
