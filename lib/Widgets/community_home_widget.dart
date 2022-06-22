import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Models/account.dart';
import 'package:pangains/Screens/Community/public_account_screen.dart';

import 'row_user_widget.dart';

class CommunityHome extends StatefulWidget {
  const CommunityHome({
    Key? key,
  }) : super(key: key);

  @override
  State<CommunityHome> createState() => _CommunityHomeState();
}

class _CommunityHomeState extends State<CommunityHome> {
  List<Account> accounts = listAllAccounts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Divider(
            color: Colors.white,
            thickness: 2,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 40, top: 20),
          width: 350,
          child: TextField(
            style: TextStyle(color: Colors.white),
            onChanged: SearchAccount,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffBDBDBD))),
              hintText: "Search for...",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    await getAllFollowersAccount(accounts[index].accountID);
                    await getAllFollowingsAccount(accounts[index].accountID);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PublicAccountScreen(accounts[index]),
                      ),
                    );
                  },
                  child: RowUserWidget(
                      accounts[index].firstName +
                          " " +
                          accounts[index].lastName,
                      accounts[index].profilePicUrl),
                );
              },
              itemCount: accounts.length,
            ))
      ],
    );
  }

  void SearchAccount(String query) {
    final suggestions = listAllAccounts.where((account) {
      final name = account.firstName.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();

    setState(() => accounts = suggestions);
  }
}
