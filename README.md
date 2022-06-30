# Pangains
## _The Next Up and Coming Social Media Exercise Mobile Application_

[![N|Solid](https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&w=1600)](https://nodesource.com/products/nsolid)

Pangains is a mobile application that is built for uses to improve their workouts and 
Flutter-powered Dart.

- Fast and Reliable
- Compatable for IOS and Android

## Features

- Register and Login Accounts
- Choose from a long list of Exercises
- Upload profile picture and change Account Information
- Save and load all workouts and Routines
- Functional Inapp messaging to contact other users

## Installation

Pangains requires [flutter](https://flutter.dev/) v3+ to run.



```sh
clone https://github.com/Riley-Howley/PanGains
cd PanGains
flutter clean
flutter run
```

Pangains requires a [MySql](https://www.mysql.com/products/workbench/) Database to function.

```sh
Download MySQL workbench or equivalent https://www.mysql.com/products/workbench/
Start MySql Workbench and create a connection using localhost user: root and Pwd: admin123
Add a schema named pangains
Click server in the top header and click data import
Select import from self contained file and default target schema as pangains
Browse to the pangains-table file and start import. The pangains table is in the repo in the folder MySQL Tables
Refer to the Pangains manual to check database is correct.
```

For Panagins to access the MySQL database it needs the pangains API.

```sh
clone https://github.com/theomcmullien/PanGainsAPI-MySql
Install Visual Studio 22 refering to the Pangains manual
Run the API
```

Pangains has an admin panel to manage all information.

```sh
clone https://github.com/theomcmullien/PanGainsWebApp
If above steps are completed then follow same as API
Run the webapp
```
Need further help refer to the Pangains Manual in the repository


## License

MIT

**Feel free to pull the project view and submit some pull requests**
