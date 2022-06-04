import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pangains/Models/test_model.dart';
import 'package:pangains/Models/workouts_perweek.dart';

import '../Models/account.dart';
import '../Models/days_worked_out.dart';
import '../Models/exercise.dart';
import '../Models/folder.dart';
import '../Models/routine.dart';
import '../Models/statistic.dart';
import '../Models/your_exercise.dart';

import '../Models/challenge_stats.dart';
import '../Models/completed_workout.dart';
import '../Models/leaderboard.dart';
import '../Models/set.dart';
import '../Widgets/set_row.dart';

HttpClient client = new HttpClient();

//String local = "https://10.0.2.2:7234/api";
var ip = "https://10.0.2.2:7234/api";

String jwt = "";
int code = 0;
String error = "";

//==============================================================================
//                          Accounts
//==============================================================================

List<Account> listAllAccounts = [];
List<Account> listSpecificAccount = [];

//Populated Data
List<WorkoutsPerWeek> dataList = [];
List<Exercise> selectedExercise = [];

Future getAllAccount() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Accounts"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    print(jsonData);
    if (listAllAccounts.isNotEmpty) {
      listAllAccounts.clear();
    }
    for (var json in jsonData) {
      listAllAccounts.add(
        new Account(
          json["accountID"],
          json["firstname"],
          json["lastname"],
          json["email"],
          json["password"],
          json["title"],
          json["profilePicture"],
          json["description"],
          json["private"],
          json["notifications"],
          json["averageChallengePos"],
          json["type"] == null ? "NO TYPE" : json["type"],
        ),
      );
    }
  }
  print(listAllAccounts);
}

List<TestModel> list = [];

Future getSpecificAccount(String email) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/Accounts/$email"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
  code = result.statusCode;
  if (result.statusCode == 200) {
    Map<String, dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    print(jsonData);
    if (listSpecificAccount.isNotEmpty) {
      listSpecificAccount.clear();
    }
    listSpecificAccount.add(new Account(
      jsonData["accountID"],
      jsonData["firstname"],
      jsonData["lastname"],
      jsonData["email"],
      jsonData["password"],
      jsonData["title"] == null ? "NO TITLE" : jsonData["title"],
      jsonData["profilePicture"],
      jsonData["description"],
      jsonData["private"],
      jsonData["notifications"],
      jsonData["averageChallengePos"],
      jsonData["type"] == null ? "NO TYPE" : jsonData["type"],
    ));
  }
  print(listSpecificAccount);
}

Future postNewAccount(
    String firstname,
    String lastname,
    String email,
    String title,
    String profilePicture,
    String description,
    bool private,
    bool notifications,
    int averageChallengePos,
    String type) async {
  Map<String, dynamic> map = {
    "AccountID": 0,
    "Firstname": "$firstname",
    "Lastname": "$lastname",
    "Email": "$email",
    "Title": "$title",
    "ProfilePicture": "$profilePicture",
    "Description": "$description",
    "Private": private,
    "Notifications": notifications,
    "AverageChallengePos": 1,
    "Type": "$type",
  };

  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.postUrl(Uri.parse("$ip/Accounts"));
  request.headers.add("Authorization", "Bearer " + jwt);
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateSpecificAccount(
  int accountID,
  String firstname,
  String lastname,
  String email,
  String password,
  String title,
  String profilePicture,
  String description,
  bool private,
  bool notifications,
  int averageChallengePos,
  String type,
) async {
  Map<String, dynamic> map = {
    "accountID": accountID,
    "firstname": "$firstname",
    "lastname": "$lastname",
    "email": "$email",
    "password": "$password",
    "Title": "$title",
    "ProfilePicture": "$profilePicture",
    "Description": "$description",
    "Private": private,
    "Notifications": notifications,
    "AverageChallengePos": 1,
    "Type": "$type",
  };
  print(map);
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  // looks good bro
  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/Accounts/$accountID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteSpecificAccount(int accountID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/Accounts/$accountID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                          DaysWorkedOut
//==============================================================================

List<DaysWorkedOut> listDaysWorkedOut = [];
List<DaysWorkedOut> listSpecificDaysWorkedOut = [];

//To get all user days worked out store accID and only add the ones to list that match
Future getAllDaysWorkedOut() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/DaysWorkedOut"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();

  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listDaysWorkedOut.isNotEmpty) {
      listDaysWorkedOut.clear();
      for (var i in jsonData) {
        listDaysWorkedOut.add(
          new DaysWorkedOut(
            i['daysWorkedOutID'],
            i['accountID'],
            i['day'],
            i['hours'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listDaysWorkedOut.add(
          new DaysWorkedOut(
            i['daysWorkedOutID'],
            i['accountID'],
            i['day'],
            i['hours'],
          ),
        );
      }
    }
  }
  print(listDaysWorkedOut);
}

Future getSpecificAllDaysWorkedOut(int accountID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/DaysWorkedOut/$accountID"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    print(jsonData);
    if (listSpecificDaysWorkedOut.isNotEmpty) {
      listSpecificDaysWorkedOut.clear();
    }
    for (var i in jsonData) {
      listSpecificDaysWorkedOut.add(
        new DaysWorkedOut(
          i['daysWorkedOutID'],
          i['accountID'],
          i['day'],
          i['hours'],
        ),
      );
    }
  }
  print(listSpecificDaysWorkedOut);
}

Future postDaysWorkedOut(int accountId, String day, int hours) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  Map<String, dynamic> map = {
    "daysWorkedOutID": 0,
    "accountID": accountId,
    "day": "$day",
    "hours": hours,
  };
  HttpClientRequest request =
      await client.postUrl(Uri.parse("$ip/DaysWorkedOut"));
  request.headers.add("Authorization", "Bearer " + jwt);
  // eshay bah
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteDaysWorkedOut(int id) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/DaysWorkedOut/$id"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateDaysWorkedOut(
    int daysWorkedOutID, int accountID, String weekday, int hours) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  Map<String, dynamic> map = {
    "daysWorkedOutID": daysWorkedOutID,
    "accountID": accountID,
    "day": weekday,
    "hours": hours,
  };
  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/DaysWorkedOut/$daysWorkedOutID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                          Statistics
//==============================================================================

List<Statistics> listAllStatistics = [];
List<Statistics> listSpecificStatistic = [];

Future getAllStatistics() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Statistics"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());

    if (listAllStatistics.isNotEmpty) {
      listAllStatistics.clear();
      for (var i in jsonData) {
        listAllStatistics.add(
          new Statistics(
            i['statisticsID'],
            i['accountID'],
            i['totalWorkouts'],
            i['avgWorkoutTime'],
            i['totalLifted'],
            i['avgReps'],
            i['avgSets'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listAllStatistics.add(
          new Statistics(
            i['statisticsID'],
            i['accountID'],
            i['totalWorkouts'],
            i['avgWorkoutTime'],
            i['totalLifted'],
            i['avgReps'],
            i['avgSets'],
          ),
        );
      }
    }
  }
  print(listAllStatistics);
}

Future getSpecificStatistic(int accountID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/Statistics/$accountID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    Map<String, dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listSpecificStatistic.isNotEmpty) {
      listSpecificStatistic.clear();
      listSpecificStatistic.add(
        new Statistics(
          jsonData['statisticsID'],
          jsonData['accountID'],
          jsonData['totalWorkouts'],
          jsonData['avgWorkoutTime'],
          jsonData['totalLifted'],
          jsonData['avgReps'],
          jsonData['avgSets'],
        ),
      );
    } else {
      listSpecificStatistic.add(
        new Statistics(
          jsonData['statisticsID'],
          jsonData['accountID'],
          jsonData['totalWorkouts'],
          jsonData['avgWorkoutTime'],
          jsonData['totalLifted'],
          jsonData['avgReps'],
          jsonData['avgSets'],
        ),
      );
    }
  }
  print(listSpecificStatistic);
}

Future postStatistic(int accountID, int totalWorkouts, int avgWorkoutTime,
    int totalLifted, int avgReps, int avgSets) async {
  Map<String, dynamic> map = {
    "statisticsID": 0,
    "accountID": accountID,
    "totalWorkouts": totalWorkouts,
    "avgWorkoutTime": avgWorkoutTime,
    "totalLifted": totalLifted,
    "avgReps": avgReps,
    "avgSets": avgSets,
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.postUrl(Uri.parse("$ip/Statistics"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteStatistic(int id) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/Statistics/$id"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateStatistics(int id, int accountID, int totalWorkouts,
    int avgWorkoutTime, int totalLifted, int avgReps, int avgSets) async {
  Map<String, dynamic> map = {
    "statisticsID": id,
    "accountID": accountID,
    "totalWorkouts": totalWorkouts,
    "avgWorkoutTime": avgWorkoutTime,
    "totalLifted": totalLifted,
    "avgReps": avgReps,
    "avgSets": avgSets,
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/Statistics/$id"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                          Folder
//==============================================================================

List<Folder> listAllFolders = [];
List<Folder> listSpecificAllFolders = [];

Future getAllFolder() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Folders"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllFolders.isNotEmpty) {
      listAllFolders.clear();
      for (var i in jsonData) {
        listAllFolders.add(
          new Folder(
            i['folderID'],
            i['accountID'],
            i['folderName'],
            i['folderLikes'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listAllFolders.add(
          new Folder(
            i['folderID'],
            i['accountID'],
            i['folderName'],
            i['folderLikes'],
          ),
        );
      }
    }
  }
  print(listAllFolders);
}

Future getSpecificFolders(int id) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Folders/$id"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listSpecificAllFolders.isNotEmpty) {
      listSpecificAllFolders.clear();
      for (var i in jsonData) {
        listSpecificAllFolders.add(
          new Folder(
            i['folderID'],
            i['accountID'],
            i['folderName'],
            i['folderLikes'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listSpecificAllFolders.add(
          new Folder(
            i['folderID'],
            i['accountID'],
            i['folderName'],
            i['folderLikes'],
          ),
        );
      }
    }
  }
  print(listSpecificAllFolders);
}

Future DeleteFolder(int folderID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/Folders/$folderID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future postNewFolder(int accountID, String folderName, int folderLikes) async {
  Map<String, dynamic> map = {
    "folderID": 0,
    "accountID": accountID,
    "folderName": "$folderName",
    "folderLikes": folderLikes,
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.postUrl(Uri.parse("$ip/Folders"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future UpdateSpecificFolder(
    int folderId, int accountID, String folderName, int folderLikes) async {
  Map<String, dynamic> map = {
    "folderID": folderId,
    "accountID": accountID,
    "folderName": "$folderName",
    "folderLikes": folderLikes,
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/Folders/$folderId"));
  request.headers.add("Authorization", "Bearer " + jwt);
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                          Routines
//==============================================================================

List<Routine> listAllRoutines = [];
List<Routine> listSpecificRoutine = [];

Future getAllRoutines() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Routines"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllRoutines.isNotEmpty) {
      listAllRoutines.clear();
      for (var i in jsonData) {
        listAllRoutines.add(
          new Routine(
            i['routineID'],
            i['folderID'],
            i['routineName'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listAllRoutines.add(
          new Routine(
            i['routineID'],
            i['folderID'],
            i['routineName'],
          ),
        );
      }
    }
  }
  print(listAllRoutines);
}

Future getSpecificRoutine(int folderID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/Routines/$folderID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listSpecificRoutine.isNotEmpty) {
      listSpecificRoutine.clear();
      for (var i in jsonData) {
        listSpecificRoutine.add(
          new Routine(
            i['routineID'],
            i['folderID'],
            i['routineName'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listSpecificRoutine.add(
          new Routine(
            i['routineID'],
            i['folderID'],
            i['routineName'],
          ),
        );
      }
    }
  }
  print(listSpecificRoutine);
}

Future postNewRoutine(int folderID, String routineName) async {
  Map<String, dynamic> map = {
    "routineID": 0,
    "folderID": folderID,
    "routineName": "$routineName"
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.postUrl(Uri.parse("$ip/Routines"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteSpecificRoutine(int routineID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/Routines/$routineID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateSpecificRoutine(
    int routineID, int folderID, String routineName) async {
  Map<String, dynamic> map = {
    "routineID": routineID,
    "folderID": folderID,
    "routineName": "$routineName"
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/Routines/$routineID"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                          Exercise
//==============================================================================

List<Exercise> listAllExercises = [];
List<Exercise> listSpecificExercise = [];

// Future getAllExercises() async {
//   client.badCertificateCallback =
//       ((X509Certificate cert, String host, int port) => true);
//   HttpClientRequest request = await client.getUrl(Uri.parse("$ip/Exercises"));
//   request.headers.add("Authorization", "Bearer " + jwt);
//   HttpClientResponse result = await request.close();
//   if (result.statusCode == 200) {
//     List<dynamic> jsonData =
//         jsonDecode(await result.transform(utf8.decoder).join());
//     if (listAllExercises.isNotEmpty) {
//       listAllExercises.clear();
//       for (var i in jsonData) {
//         listAllExercises.add(
//           new Exercise(
//             i['exerciseID'],
//             i['exerciseName'],
//           ),
//         );
//       }
//     } else {
//       for (var i in jsonData) {
//         listAllExercises.add(
//           new Exercise(
//             i['exerciseID'],
//             i['exerciseName'],
//           ),
//         );
//       }
//     }
//   }
//   print(listAllExercises);
// }

// Future getSpecificExercise(int exerciseID) async {
//   client.badCertificateCallback =
//       ((X509Certificate cert, String host, int port) => true);
//   HttpClientRequest request =
//       await client.getUrl(Uri.parse("$ip/Exercises/$exerciseID"));
//   request.headers.add("Authorization", "Bearer " + jwt);
//   HttpClientResponse result = await request.close();
//   if (result.statusCode == 200) {
//     Map<String, dynamic> jsonData =
//         jsonDecode(await result.transform(utf8.decoder).join());
//     if (listSpecificExercise.isNotEmpty) {
//       listSpecificExercise.clear();
//       listSpecificExercise.add(
//         new Exercise(
//           jsonData['exerciseID'],
//           jsonData['exerciseName'],
//         ),
//       );
//     } else {
//       listSpecificExercise.add(
//         new Exercise(
//           jsonData['exerciseID'],
//           jsonData['exerciseName'],
//         ),
//       );
//     }
//   }
//   print(listSpecificExercise);
// }

Future postNewExercise(String exerciseName) async {
  Map<String, dynamic> map = {
    "exerciseID": 0,
    "exerciseName": "$exerciseName",
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.postUrl(Uri.parse("$ip/Exercises"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteSpecificExercise(int exerciseID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/Exercises/$exerciseID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateSpecificExercise(int exerciseID, String exerciseName) async {
  Map<String, dynamic> map = {
    "exerciseID": exerciseID,
    "exerciseName": "$exerciseName"
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/Exercises/$exerciseID"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                          YourExercise
//==============================================================================

List<YourExercise> listAllYourExercises = [];
List<YourExercise> listAllSpecificYourExercises = [];

Future getAllYourExercies() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/YourExercises"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllYourExercises.isNotEmpty) {
      listAllYourExercises.clear();
      for (var i in jsonData) {
        listAllYourExercises.add(
          new YourExercise(
            i['yourExerciseID'],
            i['routineID'],
            i['exerciseID'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listAllYourExercises.add(
          new YourExercise(
            i['yourExerciseID'],
            i['routineID'],
            i['exerciseID'],
          ),
        );
      }
    }
  }
  print(listAllYourExercises);
}

Future getSpecificYourExercise(int routineID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/YourExercises/$routineID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllSpecificYourExercises.isNotEmpty) {
      listAllSpecificYourExercises.clear();
      for (var i in jsonData) {
        listAllSpecificYourExercises.add(
          new YourExercise(
            i['yourExerciseID'],
            i['routineID'],
            i['exerciseID'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listAllSpecificYourExercises.add(
          new YourExercise(
            i['yourExerciseID'],
            i['routineID'],
            i['exerciseID'],
          ),
        );
      }
    }
  }
  print(listAllSpecificYourExercises);
}

Future postNewYourExercise(int routineID, int exerciseID) async {
  Map<String, dynamic> map = {
    "yourExerciseID": 0,
    "routineID": routineID,
    "exerciseID": exerciseID
  };

  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.postUrl(Uri.parse("$ip/YourExercises"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteSpecificYourExercise(int yourExerciseID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/YourExercises/$yourExerciseID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateSpecificYourExercise(
    int yourExerciseID, int routineID, int exerciseID) async {
  Map<String, dynamic> map = {
    "yourExerciseID": yourExerciseID,
    "routineID": routineID,
    "exerciseID": exerciseID
  };
  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/YourExercises/$yourExerciseID"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                          Sets
//==============================================================================

List<Sets> listAllSets = [];
List<Sets> listAllSpecificSets = [];

Future getAllSets() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.putUrl(Uri.parse("$ip/Sets"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllSets.isNotEmpty) {
      listAllSets.clear();
      for (var i in jsonData) {
        listAllSets.add(
          new Sets(
            i['SetID'],
            i['YourExerciseID'],
            i['SetRow'],
            i['SetType'],
            i['previous'],
            i['kg'],
            i['reps'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listAllSets.add(
          new Sets(
            i['SetID'],
            i['YourExerciseID'],
            i['SetRow'],
            i['SetType'],
            i['previous'],
            i['kg'],
            i['reps'],
          ),
        );
      }
    }
  }
  print(listAllSets);
}

Future getSpecificSets(int exerciseID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.putUrl(Uri.parse("$ip/Sets"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllSpecificSets.isNotEmpty) {
      listAllSpecificSets.clear();
      for (var i in jsonData) {
        listAllSpecificSets.add(
          new Sets(
            i['SetID'],
            i['YourExerciseID'],
            i['SetRow'],
            i['SetType'],
            i['previous'],
            i['kg'],
            i['reps'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listAllSpecificSets.add(
          new Sets(
            i['SetID'],
            i['YourExerciseID'],
            i['SetRow'],
            i['SetType'],
            i['previous'],
            i['kg'],
            i['reps'],
          ),
        );
      }
    }
  }
  print(listAllSpecificSets);
}

Future postNewSet(int yourExerciseID, int setRow, String setType,
    String previous, int kg, int reps) async {
  Map<String, dynamic> map = {
    "setID": 0,
    "yourExerciseID": yourExerciseID,
    "setRow": setRow,
    "setType": "$setType",
    "previous": "$previous",
    "kg": kg,
    "reps": reps,
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.postUrl(Uri.parse("$ip/Sets"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteSpecificSet(int setID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/Sets/$setID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateSpecificSet(
  int setID,
  int yourExerciseID,
  int setRow,
  String setType,
  String previous,
  int kg,
  int reps,
) async {
  Map<String, dynamic> map = {
    "setID": setID,
    "yourExerciseID": yourExerciseID,
    "setRow": setRow,
    "setType": "$setType",
    "previous": "$previous",
    "kg": kg,
    "reps": reps,
  };
  HttpClientRequest request = await client.putUrl(Uri.parse("$ip/Sets/$setID"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                          Leaderboard
//==============================================================================

List<LeaderBoard> listOfAllLeaderboard = [];
List<LeaderBoard> listSpecificLeaderboard = [];

Future getAllLeaderboards() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/Leaderboards"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listOfAllLeaderboard.isNotEmpty) {
      listOfAllLeaderboard.clear();
      for (var i in jsonData) {
        listOfAllLeaderboard.add(
          new LeaderBoard(
            i['leaderboardID'],
            i['leaderboardDate'],
            i['totalParticipants'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listOfAllLeaderboard.add(
          new LeaderBoard(
            i['leaderboardID'],
            i['leaderboardDate'],
            i['totalParticipants'],
          ),
        );
      }
    }
  }
  print(listOfAllLeaderboard);
}

Future getSpecificLeaderboard(String date) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/Leaderboards/$date"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    Map<String, dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listSpecificLeaderboard.isNotEmpty) {
      listSpecificLeaderboard.clear();
      listSpecificLeaderboard.add(
        new LeaderBoard(
          jsonData['leaderboardID'],
          jsonData['leaderboardDate'],
          jsonData['totalParticipants'],
        ),
      );
    } else {
      listSpecificLeaderboard.add(
        new LeaderBoard(
          jsonData['leaderboardID'],
          jsonData['leaderboardDate'],
          jsonData['totalParticipants'],
        ),
      );
    }
  }
  print(listSpecificLeaderboard);
}

Future postNewLeaderboard(
    int leaderboardID, DateTime leaderboardDate, int totalParticipants) async {
  Map<String, dynamic> map = {
    "leaderboardID": 0,
    "leaderboardDate": "$leaderboardDate",
    "totalParticipants": totalParticipants
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.postUrl(Uri.parse("$ip/Leaderboards"));
  request.headers.add("Authorization", "Bearer " + jwt);
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteSpecificLeaderboard(int leaderboardID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/Leaderboards/$leaderboardID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateSpecificLeaderboard(
    int leaderboardID, leaderboardDate, totalParticipants) async {
  Map<String, dynamic> map = {
    "leaderboardID": leaderboardID,
    "leaderboardDate": "$leaderboardDate",
    "totalParticipants": totalParticipants
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/Leaderboards/$leaderboardID"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.headers.add("Authorization", "Bearer " + jwt);
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                          Challenge Stats
//==============================================================================

List<ChallengeStats> listAllChallengeStats = [];
List<ChallengeStats> listSpecificChallengeStats = [];

Future getAllChallengeStats() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/ChallengeStats"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllChallengeStats.isNotEmpty) {
      listAllChallengeStats.clear();
      for (var i in jsonData) {
        listAllChallengeStats.add(
          new ChallengeStats(
            i['ChallengeStatsID'],
            i['AccountID'],
            i['LeaderBoardID'],
            i['challengeTotalReps'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listAllChallengeStats.add(
          new ChallengeStats(
            i['ChallengeStatsID'],
            i['AccountID'],
            i['LeaderBoardID'],
            i['challengeTotalReps'],
          ),
        );
      }
    }
  }
  print(listAllChallengeStats);
}

Future getSpecificChallengeStats(int accountID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/ChallengeStats/$accountID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    Map<String, dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listSpecificChallengeStats.isNotEmpty) {
      listSpecificChallengeStats.clear();
      listAllChallengeStats.add(
        new ChallengeStats(
          jsonData['ChallengeStatsID'],
          jsonData['AccountID'],
          jsonData['LeaderBoardID'],
          jsonData['challengeTotalReps'],
        ),
      );
    } else {
      listAllChallengeStats.add(
        new ChallengeStats(
          jsonData['ChallengeStatsID'],
          jsonData['AccountID'],
          jsonData['LeaderBoardID'],
          jsonData['challengeTotalReps'],
        ),
      );
    }
  }
  print(listAllChallengeStats);
}

Future postNewChallengeStats(
    int accountID, int leaderboardID, int challengeTotalReps) async {
  Map<String, dynamic> map = {
    "challengeStatsID": 0,
    "accountID": accountID,
    "leaderboardID": leaderboardID,
    "challengeTotalReps": challengeTotalReps
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.postUrl(Uri.parse("$ip/ChallengeStats"));
  request.headers.add("Authorization", "Bearer " + jwt);
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteSpecificChallengeStat(int challengeStatID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.deleteUrl(Uri.parse("$ip/ChallengeStats/$challengeStatID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateSpecificChallengeStat(int challengeStatID, int accountID,
    int leaderboardID, int challengeTotalReps) async {
  Map<String, dynamic> map = {
    "challengeStatsID": challengeStatID,
    "accountID": accountID,
    "leaderboardID": leaderboardID,
    "challengeTotalReps": challengeTotalReps
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.putUrl(Uri.parse("$ip/ChallengeStats/$challengeStatID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                          Completed Workouts
//==============================================================================

List<CompletedWorkout> listAllCompletedWorkouts = [];
List<CompletedWorkout> listSpecificCompletedWorkouts = [];

Future getAllCompletedWorkouts() async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/CompletedWorkouts"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listAllCompletedWorkouts.isNotEmpty) {
      listAllCompletedWorkouts.clear();
      for (var i in jsonData) {
        listAllCompletedWorkouts.add(
          new CompletedWorkout(
            i['CompletedWorkoutID'],
            i['AccountID'],
            i['RoutineID'],
            i['date'],
            i['duration'],
            i['totalWeightLifted'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listAllCompletedWorkouts.add(
          new CompletedWorkout(
            i['CompletedWorkoutID'],
            i['AccountID'],
            i['RoutineID'],
            i['date'],
            i['duration'],
            i['totalWeightLifted'],
          ),
        );
      }
    }
  }
  print(listAllCompletedWorkouts);
}

Future getAllSpecificCompletedWorkouts(int accountID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.getUrl(Uri.parse("$ip/CompletedWorkouts/$accountID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  if (result.statusCode == 200) {
    List<dynamic> jsonData =
        jsonDecode(await result.transform(utf8.decoder).join());
    if (listSpecificCompletedWorkouts.isNotEmpty) {
      listSpecificCompletedWorkouts.clear();
      for (var i in jsonData) {
        listSpecificCompletedWorkouts.add(
          new CompletedWorkout(
            i['CompletedWorkoutID'],
            i['AccountID'],
            i['RoutineID'],
            i['date'],
            i['duration'],
            i['totalWeightLifted'],
          ),
        );
      }
    } else {
      for (var i in jsonData) {
        listSpecificCompletedWorkouts.add(
          new CompletedWorkout(
            i['CompletedWorkoutID'],
            i['AccountID'],
            i['RoutineID'],
            i['date'],
            i['duration'],
            i['totalWeightLifted'],
          ),
        );
      }
    }
  }
  print(listSpecificCompletedWorkouts);
}

Future postNewCompletedWorkout(int accountID, int routineID,
    String dateCompleted, int duration, int totalWeightLifted) async {
  Map<String, dynamic> map = {
    "completedWorkoutID": 0,
    "accountID": accountID,
    "routineID": routineID,
    "dateCompleted": "$dateCompleted",
    "duration": duration,
    "totalWeightLifted": totalWeightLifted,
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.postUrl(Uri.parse("$ip/CompletedWorkouts"));
  request.headers.add("Authorization", "Bearer " + jwt);
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future deleteSpecificCompletedWorkout(int completedWorkoutID) async {
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client
      .deleteUrl(Uri.parse("$ip/CompletedWorkouts/$completedWorkoutID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

Future updateSpecificCompletedWorkout(
    int completedWorkoutID,
    int accountID,
    int routineID,
    String dateCompleted,
    int duration,
    int totalWeightLifted) async {
  Map<String, dynamic> map = {
    "completedWorkoutID": completedWorkoutID,
    "accountID": accountID,
    "routineID": routineID,
    "dateCompleted": "$dateCompleted",
    "duration": duration,
    "totalWeightLifted": totalWeightLifted,
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

  HttpClientRequest request = await client
      .putUrl(Uri.parse("$ip/CompletedWorkouts/$completedWorkoutID"));
  request.headers.add("Authorization", "Bearer " + jwt);
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(map)));
  HttpClientResponse result = await request.close();
  print(result.statusCode);
}

//==============================================================================
//                  Register Method
//==============================================================================

Future Register(
    String Fname, String Lname, String email, String password) async {
  // String emailCode = Uri.encodeComponent(email);
  // String passwordCode = Uri.encodeComponent(password);

  Map<String, dynamic> account = {
    "firstname": Fname,
    "lastname": Lname,
    "email": email,
    "password": password
  };

  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request =
      await client.postUrl(Uri.parse("$ip/Auth/Register"));
  request.headers.add("Content-Type", "application/json");
  request.headers.add("Accept", "*/*");
  request.add(utf8.encode(jsonEncode(account)));
  HttpClientResponse response = await request.close();
  code = response.statusCode;
  print(response.statusCode);
}

//==============================================================================
//                  Login Method
//==============================================================================
Future Login(String email, String password) async {
  // String emailCode = Uri.encodeComponent(email);
  // String passwordCode = Uri.encodeComponent(password);

  Map<String, dynamic> account = {
    "email": email,
    "password": password,
  };
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  HttpClientRequest request = await client.postUrl(Uri.parse("$ip/Auth/Login"));
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
  code = response.statusCode;
}
