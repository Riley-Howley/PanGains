class Account {
  int accountID;
  String firstName;
  String lastName;
  String title;
  String profilePicUrl;
  String description;
  bool private;
  bool notifications;
  int averageChallengePos;
  String type;

  Account(
    this.accountID,
    this.firstName,
    this.lastName,
    this.title,
    this.profilePicUrl,
    this.description,
    this.private,
    this.notifications,
    this.averageChallengePos,
    this.type,
  );
}
