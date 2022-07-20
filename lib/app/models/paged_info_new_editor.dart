// To parse this JSON data, do
//
//     final pagedInfoNewEditor = pagedInfoNewEditorFromMap(jsonString);

import 'dart:convert';

PagedInfoNewEditor pagedInfoNewEditorFromMap(String str) => PagedInfoNewEditor.fromMap(json.decode(str));

String pagedInfoNewEditorToMap(PagedInfoNewEditor data) => json.encode(data.toMap());

class PagedInfoNewEditor {
  PagedInfoNewEditor({
    this.listFriends,
    this.pagedInfo,
  });

  List<ListFriend>? listFriends;
  PagedInfo? pagedInfo;

  PagedInfoNewEditor copyWith({
    List<ListFriend>? listFriends,
    PagedInfo? pagedInfo,
  }) =>
      PagedInfoNewEditor(
        listFriends: listFriends ?? this.listFriends,
        pagedInfo: pagedInfo ?? this.pagedInfo,
      );

  factory PagedInfoNewEditor.fromMap(Map<String, dynamic> json) => PagedInfoNewEditor(
    listFriends: List<ListFriend>.from(json["ListFriends"].map((x) => ListFriend.fromMap(x))),
    pagedInfo: PagedInfo.fromMap(json["PagedInfo"]),
  );

  Map<String, dynamic> toMap() => {
    "ListFriends": List<dynamic>.from(listFriends!.map((x) => x.toMap())),
    "PagedInfo": pagedInfo!.toMap(),
  };
}

class ListFriend {
  ListFriend({
    this.codUserFriend,
    this.codUserFriendStatus,
    this.codUserProfile,
    this.codUserRequired,
    this.user,
  });

  int? codUserFriend;
  int? codUserFriendStatus;
  int? codUserProfile;
  int? codUserRequired;
  User? user;

  ListFriend copyWith({
    int? codUserFriend,
    int? codUserFriendStatus,
    int? codUserProfile,
    int? codUserRequired,
    User? user,
  }) =>
      ListFriend(
        codUserFriend: codUserFriend ?? this.codUserFriend,
        codUserFriendStatus: codUserFriendStatus ?? this.codUserFriendStatus,
        codUserProfile: codUserProfile ?? this.codUserProfile,
        codUserRequired: codUserRequired ?? this.codUserRequired,
        user: user ?? this.user,
      );

  factory ListFriend.fromMap(Map<String, dynamic> json) => ListFriend(
    codUserFriend: json["CodUserFriend"],
    codUserFriendStatus: json["CodUserFriendStatus"],
    codUserProfile: json["CodUserProfile"],
    codUserRequired: json["CodUserRequired"],
    user: User.fromMap(json["User"]),
  );

  Map<String, dynamic> toMap() => {
    "CodUserFriend": codUserFriend,
    "CodUserFriendStatus": codUserFriendStatus,
    "CodUserProfile": codUserProfile,
    "CodUserRequired": codUserRequired,
    "User": user!.toMap(),
  };
}

class User {
  User({
    this.codUser,
    this.codUserType,
    this.name,
    this.email,
    this.password,
    this.nick,
    this.publicProfile,
    this.credential,
    this.filePicture,
    this.urlProfile,
    this.birth,
    this.birthDate,
    this.birthString,
    this.city,
    this.state,
    this.country,
    this.totalFriends,
    this.totalFollowings,
    this.isCertificate,
    this.isGreenCertificate,
    this.relationship,
  });

  int? codUser;
  int? codUserType;
  String? name;
  dynamic? email;
  dynamic? password;
  String? nick;
  String? publicProfile;
  dynamic? credential;
  String? filePicture;
  String? urlProfile;
  String? birth;
  String? birthDate;
  DateTime? birthString;
  dynamic? city;
  dynamic? state;
  String? country;
  int? totalFriends;
  int? totalFollowings;
  bool? isCertificate;
  bool? isGreenCertificate;
  dynamic? relationship;

  User copyWith({
    int? codUser,
    int? codUserType,
    String? name,
    dynamic? email,
    dynamic? password,
    String? nick,
    String? publicProfile,
    dynamic? credential,
    String? filePicture,
    String? urlProfile,
    String? birth,
    String? birthDate,
    DateTime? birthString,
    dynamic? city,
    dynamic? state,
    String? country,
    int? totalFriends,
    int? totalFollowings,
    bool? isCertificate,
    bool? isGreenCertificate,
    dynamic? relationship,
  }) =>
      User(
        codUser: codUser ?? this.codUser,
        codUserType: codUserType ?? this.codUserType,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        nick: nick ?? this.nick,
        publicProfile: publicProfile ?? this.publicProfile,
        credential: credential ?? this.credential,
        filePicture: filePicture ?? this.filePicture,
        urlProfile: urlProfile ?? this.urlProfile,
        birth: birth ?? this.birth,
        birthDate: birthDate ?? this.birthDate,
        birthString: birthString ?? this.birthString,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        totalFriends: totalFriends ?? this.totalFriends,
        totalFollowings: totalFollowings ?? this.totalFollowings,
        isCertificate: isCertificate ?? this.isCertificate,
        isGreenCertificate: isGreenCertificate ?? this.isGreenCertificate,
        relationship: relationship ?? this.relationship,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
    codUser: json["CodUser"],
    codUserType: json["CodUserType"],
    name: json["Name"],
    email: json["Email"],
    password: json["Password"],
    nick: json["Nick"],
    publicProfile: json["PublicProfile"],
    credential: json["Credential"],
    filePicture: json["FilePicture"],
    urlProfile: json["UrlProfile"],
    birth: json["Birth"],
    birthDate: json["BirthDate"],
    birthString: DateTime.parse(json["BirthString"]),
    city: json["City"],
    state: json["State"],
    country: json["Country"],
    totalFriends: json["TotalFriends"],
    totalFollowings: json["TotalFollowings"],
    isCertificate: json["IsCertificate"],
    isGreenCertificate: json["IsGreenCertificate"],
    relationship: json["Relationship"],
  );

  Map<String, dynamic> toMap() => {
    "CodUser": codUser,
    "CodUserType": codUserType,
    "Name": name,
    "Email": email,
    "Password": password,
    "Nick": nick,
    "PublicProfile": publicProfile,
    "Credential": credential,
    "FilePicture": filePicture,
    "UrlProfile": urlProfile,
    "Birth": birth,
    "BirthDate": birthDate,
   // "BirthString": birthString.toIso8601String(),
    "City": city,
    "State": state,
    "Country": country,
    "TotalFriends": totalFriends,
    "TotalFollowings": totalFollowings,
    "IsCertificate": isCertificate,
    "IsGreenCertificate": isGreenCertificate,
    "Relationship": relationship,
  };
}

class PagedInfo {
  PagedInfo({
    this.currentPage,
    this.totalPages,
    this.totalRows,
    this.totalGeneric,
  });

  int? currentPage;
  int? totalPages;
  int? totalRows;
  int? totalGeneric;

  PagedInfo copyWith({
    int? currentPage,
    int? totalPages,
    int? totalRows,
    int? totalGeneric,
  }) =>
      PagedInfo(
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        totalRows: totalRows ?? this.totalRows,
        totalGeneric: totalGeneric ?? this.totalGeneric,
      );

  factory PagedInfo.fromMap(Map<String, dynamic> json) => PagedInfo(
    currentPage: json["CurrentPage"],
    totalPages: json["TotalPages"],
    totalRows: json["TotalRows"],
    totalGeneric: json["TotalGeneric"],
  );

  Map<String, dynamic> toMap() => {
    "CurrentPage": currentPage,
    "TotalPages": totalPages,
    "TotalRows": totalRows,
    "TotalGeneric": totalGeneric,
  };
}
