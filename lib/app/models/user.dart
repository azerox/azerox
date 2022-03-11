class UserModel {
  int? codUser;
  int? codUserType;
  int? codState;
  int? codCity;
  int? codCountry;
  String name;
  String? email;
  String filePicture;
  String? birthString;
  String? city;
  String? state;
  String? country;
  String? sessionID;
  String? password;
  String? nick;
  String? publicProfile;
  String? credential;
  String? urlProfile;
  String? birthDate;
  int? totalFriends;
  int? totalFollowings;
  bool? isCertificate;
  bool? isGreenCertificate;

  UserModel({
    this.codUser,
    this.codUserType,
    this.codState,
    this.codCity,
    this.codCountry,
    required this.name,
    this.email,
    this.filePicture =
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
    this.birthString,
    this.city,
    this.state,
    this.country,
    this.sessionID,
    this.password,
    this.nick,
    this.publicProfile,
    this.credential,
    this.urlProfile,
    this.birthDate,
    this.totalFriends,
    this.totalFollowings,
    this.isCertificate,
    this.isGreenCertificate,
  });

  Map<String, dynamic> toJson() {
    return {
      'CodUser': codUser,
      'CodUserType': codUserType,
      'CodState': codState,
      'CodCity': codCity,
      'CodCountry': codCountry,
      'Name': name,
      'Email': email,
      'FilePicture': filePicture,
      'BirthString': birthString,
      'City': city,
      'State': state,
      'Country': country,
      'SessionID': sessionID,
      'Password': password,
      'Nick': nick,
      'PublicProfile': publicProfile,
      'Credential': credential,
      'UrlProfile': urlProfile,
      'BirthDate': birthDate,
      'TotalFriends': totalFriends,
      'TotalFollowings': totalFollowings,
      'IsCertificate': isCertificate,
      'IsGreenCertificate': isGreenCertificate,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      codUser: map['CodUser'],
      codUserType: map['CodUserType'],
      codState: map['CodState'],
      codCity: map['CodCity'],
      codCountry: map['CodCountry'],
      name: map['Name'],
      email: map['Email'],
      filePicture: map['FilePicture'],
      birthString: map['BirthString'],
      city: map['City'],
      state: map['State'],
      country: map['Country'],
      sessionID: map['SessionID'],
      password: map['Password'],
      nick: map['Nick'],
      publicProfile: map['PublicProfile'],
      credential: map['Credential'],
      urlProfile: map['UrlProfile'],
      birthDate: map['BirthDate'],
      totalFriends: map['TotalFriends'],
      totalFollowings: map['TotalFollowings'],
      isCertificate: map['IsCertificate'],
      isGreenCertificate: map['IsGreenCertificate'],
    );
  }

  @override
  String toString() {
    return 'UserModel(codUser: $codUser, codUserType: $codUserType, codState: $codState, codCity: $codCity, codCountry: $codCountry, name: $name, email: $email, filePicture: $filePicture, birthString: $birthString, city: $city, state: $state, country: $country, sessionID: $sessionID, password: $password, nick: $nick, publicProfile: $publicProfile, credential: $credential, urlProfile: $urlProfile, birthDate: $birthDate, totalFriends: $totalFriends, totalFollowings: $totalFollowings, isCertificate: $isCertificate, isGreenCertificate: $isGreenCertificate)';
  }
}
