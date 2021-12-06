class UserModel {
  String uid;
  String email;
  String firstName;
  String secondName;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
  });

  /// receiving data from the server

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      secondName: map['secondName'] as String,
    );
  }

  /// sending data to our server

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'email': this.email,
      'firstName': this.firstName,
      'secondName': this.secondName,
    };
  }
}
