import 'package:pangains/Models/routine.dart';

import 'AccountRoutine.dart';

class AccountFolder {
  int folderID;
  String folderName;
  List<AccountRoutine> routines;

  AccountFolder(this.folderID, this.folderName, this.routines);
}
