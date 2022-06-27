import 'package:flutter/material.dart';
import 'package:pangains/Http/requests.dart';

class LeaderboardWidget extends StatelessWidget {
  int index;
  int accountID;
  LeaderboardWidget(this.index, this.accountID);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: accountID == listSpecificAccount[0].accountID
              ? Border.all(
                  color: Colors.blue,
                )
              : null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getAward(index + 1),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  "${index + 1}",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              "${listEveryAccount.firstWhere((element) => element.accountID == accountID).firstName} ${listEveryAccount.firstWhere((element) => element.accountID == accountID).lastName}",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16, right: 24),
            child: Text(
              listAllChallengeStats
                  .firstWhere((element) => element.AccountID == accountID)
                  .challengeTotalReps
                  .toString(),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

getAward(int index) {
  if (index == 1) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Image.asset(
        "assets/images/diamond.png",
        width: 36,
        height: 24,
      ),
    );
  } else if (index == 2) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Image.asset(
        "assets/images/silver.png",
        width: 36,
        height: 24,
      ),
    );
  } else if (index == 3) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Image.asset(
        "assets/images/bronze.png",
        width: 36,
        height: 24,
      ),
    );
  } else {
    return Container(
      width: 36,
      margin: EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Text(
        "",
      ),
    );
  }
}
