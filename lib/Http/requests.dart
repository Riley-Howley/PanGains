import 'dart:convert';
import 'dart:io';

//Server
String emulatorHost = "https://10.0.2.2:7035/api";
//Jwt
String jwt = "";
int code = 0;
String error = "";
//Http Client
HttpClient client = new HttpClient();

////////////////////////////////////////////////////////////////////////////////
///Register Method
////////////////////////////////////////////////////////////////////////////////
Future Register(
    String Fname, String Lname, String email, String password) async {
  // String emailCode = Uri.encodeComponent(email);
  // String passwordCode = Uri.encodeComponent(password);

  Map<String, dynamic> account = {
    "fname": Fname,
    "lname": Lname,
    "email": email,
    "password": password
  };

  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.postUrl(Uri.parse("$emulatorHost/Auth/Register"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(account)));
  HttpClientResponse response = await request.close();
  code = response.statusCode;
}

////////////////////////////////////////////////////////////////////////////////
///Login Method
////////////////////////////////////////////////////////////////////////////////
Future Login(String email, String password) async {
  // String emailCode = Uri.encodeComponent(email);
  // String passwordCode = Uri.encodeComponent(password);

  Map<String, dynamic> account = {
    "email": email,
    "password": password,
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.postUrl(Uri.parse("$emulatorHost/Auth/Login"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Charset", "utf-8");
  request.add(utf8.encode(jsonEncode(account)));
  HttpClientResponse response = await request.close();
  //Above all works so far
  final contents = StringBuffer();
  await for (var data in response.transform(utf8.decoder)) {
    contents.write(data);
  }
  print(response.statusCode);
  jwt = contents.toString();
  print(jwt);

  code = response.statusCode;
}
