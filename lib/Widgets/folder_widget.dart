import 'package:flutter/material.dart';

import '../Http/requests.dart';

class FolderWidget extends StatefulWidget {
  const FolderWidget({
    Key? key,
  }) : super(key: key);

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
                    "Monday Workout",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                // Container(
                //   child: ListView.builder(
                //     itemBuilder: (context, index) {
                //       return Align(
                //         alignment: Alignment.centerLeft,
                //         child: Text("Pull - Easy",
                //             style: TextStyle(
                //                 color: Colors.white, fontSize: 16)),
                //       );
                //     },
                //     itemCount: listSpecificAllFolders.length,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            isLiked == false
                ? IconButton(
                    onPressed: () {
                      setState(
                        () {
                          isLiked = true;
                        },
                      );
                    },
                    icon: Icon(Icons.favorite_border),
                    iconSize: 40,
                  )
                : IconButton(
                    onPressed: () {
                      setState(
                        () {
                          isLiked = false;
                        },
                      );
                    },
                    icon: Icon(Icons.favorite_rounded),
                    color: Colors.red,
                    iconSize: 40,
                  ),
          ],
        ),
      ],
    );
  }
}
