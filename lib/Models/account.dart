class Account {
  int accountID;
  String firstName;
  String lastName;
  String email;
  String password;
  String title;
  String profilePicUrl;
  String description;
  bool private;
  bool notifications;
  int averageChallengePos;
  String type;
  String MessageToken;

  Account(
    this.accountID,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.title,
    this.profilePicUrl,
    this.description,
    this.private,
    this.notifications,
    this.averageChallengePos,
    this.type,
    this.MessageToken,
  );
}
