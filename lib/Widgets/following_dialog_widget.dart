import 'package:flutter/material.dart';
import 'package:pangains/Screens/Community/public_account_screen.dart';

import '../Http/requests.dart';
import 'row_user_widget.dart';

class FollowingDialogWidget extends StatelessWidget {
  const FollowingDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff222831),
      child: Column(
        children: [
          Card(
            color: Color(0xff222831),
            elevation: 8.0,
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 42,
                        ),
                        child: Text(
                          "Following",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 42),
                    width: MediaQuery.of(context).size.width / 3,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.6,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return RowUserWidget(
                    getAccountFollowing[index].firstName +
                        " " +
                        getAccountFollowing[index].lastName,
                    getAccountFollowing[index].profilePicUrl,
                  );
                },
                itemCount: getAccountFollowing.length,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.8,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Close",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
