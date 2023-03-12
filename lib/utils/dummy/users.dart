enum Verification { organisation, user, none }

class User {
  final String name;
  final Verification verification;

  User(this.name, this.verification);
}

List<User> users = [
  User("Strathmore University", Verification.organisation),
  User("A.I.C Church", Verification.organisation),
  User("Chicken Inn", Verification.organisation),
  User("John Doe", Verification.user),
  User("Riara University", Verification.organisation),
  User("Org X", Verification.organisation),
  User("Matt Murr", Verification.none),
];
