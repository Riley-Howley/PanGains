import 'package:flutter/material.dart';

import '../../Http/requests.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  @override
  Widget build(BuildContext context) {
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var descriptionController = TextEditingController();
    var titleController = TextEditingController();
    var urlController = TextEditingController();

    firstNameController.text = listSpecificAccount[0].firstName;
    lastNameController.text = listSpecificAccount[0].lastName;
    descriptionController.text = listSpecificAccount[0].description;
    titleController.text = listSpecificAccount[0].title;
    urlController.text = listSpecificAccount[0].profilePicUrl;

    String profileUrl = "";

    Future profilePicDialog() => showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              color: Color(0xff222831),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                  top: 24,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          width: MediaQuery.of(context).size.width,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              profileUrl = urlController.text;
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text("Change"),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff222831),
        title: Text("Edit Account Information"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Profile URL",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: urlController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Profile Pic URL",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Firstname",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: firstNameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "First Name: ",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Lastname",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: lastNameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Last Name: ",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Description",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: descriptionController,
                    style: TextStyle(color: Colors.white),
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Description: ",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Title",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: titleController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Title: ",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      await updateSpecificAccount(
                          listSpecificAccount[0].accountID,
                          firstNameController.text,
                          lastNameController.text,
                          listSpecificAccount[0].email,
                          listSpecificAccount[0].password,
                          titleController.text,
                          urlController.text,
                          descriptionController.text,
                          listSpecificAccount[0].private,
                          listSpecificAccount[0].notifications,
                          listSpecificAccount[0].averageChallengePos,
                          listSpecificAccount[0].type);
                      await getSpecificAccount(listSpecificAccount[0].email);

                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
