import 'package:flutter/material.dart';

class TermsAndConditionsScreens extends StatelessWidget {
  const TermsAndConditionsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff222831),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: [
              Text(
                "PanGains Terms & Conditions",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
              Container(
                margin: EdgeInsets.only(top: 32),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Hac tempus eget nascetur ornare bibendum felis sit quis commodo. Ultricies at consequat eget egestas proin augue velit sapien vulputate. Nunc amet sed at non eget quam. Bibendum volutpat odio sed risus penatibus orci, faucibus. Pharetra in quis vehicula ullamcorper nunc. Eu tincidunt amet aliquet morbi sem. Sed velit blandit etiam integer et velit in duis. Sed neque diam et est in. Sed elementum vitae orci dui amet. Tortor purus, risus hendrerit mauris tincidunt ullamcorper. Suspendisse dictum feugiat id in pellentesque. Aliquet eget ut nec at erat at dolor tristique. Bibendum scelerisque leo integer lectus vivamus tellus diam ipsum. Mauris amet, mauris sagittis ut lorem risus a.Amet quam sit mattis velit at quisque. Vitae ac arcu fringilla viverra. At neque, euismod nec adipiscing nec congue posuere mauris nisl. Et sagittis erat aenean id et in. Et facilisi gravida mattis id. Augue tellus aenean amet purus. Eu, sit faucibus arcu, euismod nunc, orci, ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
