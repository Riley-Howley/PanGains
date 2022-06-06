import 'package:flutter/material.dart';
import 'package:pangains/Models/folder.dart';

import '../Http/requests.dart';

class FolderWidget extends StatefulWidget {
  String folderName;
  int likes;

  FolderWidget(this.folderName, this.likes);

  @override
  State<FolderWidget> createState() => _FolderState();
}

class _FolderState extends State<FolderWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 30),
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            color: Color(0xff222831),
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.folderName,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 100,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text("Pull - Easy",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16));
                      },
                      itemCount: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
