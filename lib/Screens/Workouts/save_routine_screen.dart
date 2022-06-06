import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pangains/Http/requests.dart';
import 'package:pangains/Widgets/folder_widget.dart';

class SaveRoutineScreen extends StatelessWidget {
  const SaveRoutineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 64),
              child: Text(
                "Select Folder to Save Routine To",
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return FolderWidget(
                    listSpecificAllFolders[index].FolderName,
                    100,
                  );
                },
                itemCount: listSpecificAllFolders.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
