class UserProfile {
  String? sessionID;
  int? codUser;
  String filePicture;


  UserProfile({
    this.sessionID,
    this.codUser,
    this.filePicture =
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
  });

  Map<String, dynamic> toJson() {
    return {
      'SessionID': sessionID,
      'CodUser': codUser,
      'FilePicture': filePicture,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> map) {
    return UserProfile(
      codUser: map['CodUser'],
      filePicture: map['FilePicture'] ??
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
      sessionID: map['SessionID'],
    );
  }

  @override
  String toString() {
    return 'UserModel(, sessionID: $sessionID, codUser: $codUser, filePicture: $filePicture)';
  }
}
