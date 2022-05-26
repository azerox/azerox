class AssinanteModel {
  String? sessionID;
  int? codUser;
  int? codUserMaster;
  int? codUserStatus;
  int? codState;
  int? codCity;
  int? codCountry;
  int? codUserType;
  bool? isPickupProfile;
  String? iso3;
  String? name;
  String? nick;
  String? email;
  Null? password;
  String? publicProfile;
  Null? credential;
  String? filePicture;
  String? urlProfile;
  int? totalFriends;
  int? totalFollowings;
  bool? isCertificate;
  bool? isGreenCertificate;
  Null? gender;
  String? birth;
  String? birthString;
  String? birthDate;
  Null? zipCode;
  int? codTypeRelationShip;
  int? codTypeEthnicity;
  int? codTypeReligion;
  int? codTypePolicy;
  int? codTypeHumor;
  int? codTypeSexualOrientation;
  int? codTypeStyle;
  int? codTypeDwelling;
  int? codTypeInterest;
  int? codTypeLasteAnimal;
  int? codTypeBlood;
  String? fileBackGround;
  Null? description;
  Null? children;
  Null? smoke;
  Null? drink;
  Null? homeTown;
  Null? bloodDonor;
  Null? marrowDonor;
  Null? residencialPhone;
  Null? celularPhone;
  Null? address;
  String? city;
  String? state;
  String? country;
  Null? latitude;
  Null? longitude;
  bool? notificationDeclaration;
  bool? notificationChat;
  bool? notificationFriendRequest;
  bool? notificationPost;
  bool? visualizationPostPeding;
  int? loginCount;
  bool? sacEnable;
  Null? sacBody;
  UserSignature? userSignature;

  AssinanteModel(
      {this.sessionID,
        this.codUser,
        this.codUserMaster,
        this.codUserStatus,
        this.codState,
        this.codCity,
        this.codCountry,
        this.codUserType,
        this.isPickupProfile,
        this.iso3,
        this.name,
        this.nick,
        this.email,
        this.password,
        this.publicProfile,
        this.credential,
        this.filePicture,
        this.urlProfile,
        this.totalFriends,
        this.totalFollowings,
        this.isCertificate,
        this.isGreenCertificate,
        this.gender,
        this.birth,
        this.birthString,
        this.birthDate,
        this.zipCode,
        this.codTypeRelationShip,
        this.codTypeEthnicity,
        this.codTypeReligion,
        this.codTypePolicy,
        this.codTypeHumor,
        this.codTypeSexualOrientation,
        this.codTypeStyle,
        this.codTypeDwelling,
        this.codTypeInterest,
        this.codTypeLasteAnimal,
        this.codTypeBlood,
        this.fileBackGround,
        this.description,
        this.children,
        this.smoke,
        this.drink,
        this.homeTown,
        this.bloodDonor,
        this.marrowDonor,
        this.residencialPhone,
        this.celularPhone,
        this.address,
        this.city,
        this.state,
        this.country,
        this.latitude,
        this.longitude,
        this.notificationDeclaration,
        this.notificationChat,
        this.notificationFriendRequest,
        this.notificationPost,
        this.visualizationPostPeding,
        this.loginCount,
        this.sacEnable,
        this.sacBody,
        this.userSignature});

  AssinanteModel.fromJson(Map<String, dynamic> json) {
    sessionID = json['SessionID'];
    codUser = json['CodUser'];
    codUserMaster = json['CodUserMaster'];
    codUserStatus = json['CodUserStatus'];
    codState = json['CodState'];
    codCity = json['CodCity'];
    codCountry = json['CodCountry'];
    codUserType = json['CodUserType'];
    isPickupProfile = json['IsPickupProfile'];
    iso3 = json['Iso3'];
    name = json['Name'];
    nick = json['Nick'];
    email = json['Email'];
    password = json['Password'];
    publicProfile = json['PublicProfile'];
    credential = json['Credential'];
    filePicture = json['FilePicture'];
    urlProfile = json['UrlProfile'];
    totalFriends = json['TotalFriends'];
    totalFollowings = json['TotalFollowings'];
    isCertificate = json['IsCertificate'];
    isGreenCertificate = json['IsGreenCertificate'];
    gender = json['Gender'];
    birth = json['Birth'];
    birthString = json['BirthString'];
    birthDate = json['BirthDate'];
    zipCode = json['ZipCode'];
    codTypeRelationShip = json['CodTypeRelationShip'];
    codTypeEthnicity = json['CodTypeEthnicity'];
    codTypeReligion = json['CodTypeReligion'];
    codTypePolicy = json['CodTypePolicy'];
    codTypeHumor = json['CodTypeHumor'];
    codTypeSexualOrientation = json['CodTypeSexualOrientation'];
    codTypeStyle = json['CodTypeStyle'];
    codTypeDwelling = json['CodTypeDwelling'];
    codTypeInterest = json['CodTypeInterest'];
    codTypeLasteAnimal = json['CodTypeLasteAnimal'];
    codTypeBlood = json['CodTypeBlood'];
    fileBackGround = json['FileBackGround'];
    description = json['Description'];
    children = json['Children'];
    smoke = json['Smoke'];
    drink = json['Drink'];
    homeTown = json['HomeTown'];
    bloodDonor = json['BloodDonor'];
    marrowDonor = json['MarrowDonor'];
    residencialPhone = json['ResidencialPhone'];
    celularPhone = json['CelularPhone'];
    address = json['Address'];
    city = json['City'];
    state = json['State'];
    country = json['Country'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    notificationDeclaration = json['NotificationDeclaration'];
    notificationChat = json['NotificationChat'];
    notificationFriendRequest = json['NotificationFriendRequest'];
    notificationPost = json['NotificationPost'];
    visualizationPostPeding = json['VisualizationPostPeding'];
    loginCount = json['LoginCount'];
    sacEnable = json['SacEnable'];
    sacBody = json['SacBody'];
    userSignature = json['UserSignature'] != null
        ? new UserSignature.fromJson(json['UserSignature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SessionID'] = this.sessionID;
    data['CodUser'] = this.codUser;
    data['CodUserMaster'] = this.codUserMaster;
    data['CodUserStatus'] = this.codUserStatus;
    data['CodState'] = this.codState;
    data['CodCity'] = this.codCity;
    data['CodCountry'] = this.codCountry;
    data['CodUserType'] = this.codUserType;
    data['IsPickupProfile'] = this.isPickupProfile;
    data['Iso3'] = this.iso3;
    data['Name'] = this.name;
    data['Nick'] = this.nick;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['PublicProfile'] = this.publicProfile;
    data['Credential'] = this.credential;
    data['FilePicture'] = this.filePicture;
    data['UrlProfile'] = this.urlProfile;
    data['TotalFriends'] = this.totalFriends;
    data['TotalFollowings'] = this.totalFollowings;
    data['IsCertificate'] = this.isCertificate;
    data['IsGreenCertificate'] = this.isGreenCertificate;
    data['Gender'] = this.gender;
    data['Birth'] = this.birth;
    data['BirthString'] = this.birthString;
    data['BirthDate'] = this.birthDate;
    data['ZipCode'] = this.zipCode;
    data['CodTypeRelationShip'] = this.codTypeRelationShip;
    data['CodTypeEthnicity'] = this.codTypeEthnicity;
    data['CodTypeReligion'] = this.codTypeReligion;
    data['CodTypePolicy'] = this.codTypePolicy;
    data['CodTypeHumor'] = this.codTypeHumor;
    data['CodTypeSexualOrientation'] = this.codTypeSexualOrientation;
    data['CodTypeStyle'] = this.codTypeStyle;
    data['CodTypeDwelling'] = this.codTypeDwelling;
    data['CodTypeInterest'] = this.codTypeInterest;
    data['CodTypeLasteAnimal'] = this.codTypeLasteAnimal;
    data['CodTypeBlood'] = this.codTypeBlood;
    data['FileBackGround'] = this.fileBackGround;
    data['Description'] = this.description;
    data['Children'] = this.children;
    data['Smoke'] = this.smoke;
    data['Drink'] = this.drink;
    data['HomeTown'] = this.homeTown;
    data['BloodDonor'] = this.bloodDonor;
    data['MarrowDonor'] = this.marrowDonor;
    data['ResidencialPhone'] = this.residencialPhone;
    data['CelularPhone'] = this.celularPhone;
    data['Address'] = this.address;
    data['City'] = this.city;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['NotificationDeclaration'] = this.notificationDeclaration;
    data['NotificationChat'] = this.notificationChat;
    data['NotificationFriendRequest'] = this.notificationFriendRequest;
    data['NotificationPost'] = this.notificationPost;
    data['VisualizationPostPeding'] = this.visualizationPostPeding;
    data['LoginCount'] = this.loginCount;
    data['SacEnable'] = this.sacEnable;
    data['SacBody'] = this.sacBody;
    if (this.userSignature != null) {
      data['UserSignature'] = this.userSignature!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'AssinanteModel{sessionID: $sessionID, codUser: $codUser, codUserMaster: $codUserMaster, codUserStatus: $codUserStatus, codState: $codState, codCity: $codCity, codCountry: $codCountry, codUserType: $codUserType, isPickupProfile: $isPickupProfile, iso3: $iso3, name: $name, nick: $nick, email: $email, password: $password, publicProfile: $publicProfile, credential: $credential, filePicture: $filePicture, urlProfile: $urlProfile, totalFriends: $totalFriends, totalFollowings: $totalFollowings, isCertificate: $isCertificate, isGreenCertificate: $isGreenCertificate, gender: $gender, birth: $birth, birthString: $birthString, birthDate: $birthDate, zipCode: $zipCode, codTypeRelationShip: $codTypeRelationShip, codTypeEthnicity: $codTypeEthnicity, codTypeReligion: $codTypeReligion, codTypePolicy: $codTypePolicy, codTypeHumor: $codTypeHumor, codTypeSexualOrientation: $codTypeSexualOrientation, codTypeStyle: $codTypeStyle, codTypeDwelling: $codTypeDwelling, codTypeInterest: $codTypeInterest, codTypeLasteAnimal: $codTypeLasteAnimal, codTypeBlood: $codTypeBlood, fileBackGround: $fileBackGround, description: $description, children: $children, smoke: $smoke, drink: $drink, homeTown: $homeTown, bloodDonor: $bloodDonor, marrowDonor: $marrowDonor, residencialPhone: $residencialPhone, celularPhone: $celularPhone, address: $address, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude, notificationDeclaration: $notificationDeclaration, notificationChat: $notificationChat, notificationFriendRequest: $notificationFriendRequest, notificationPost: $notificationPost, visualizationPostPeding: $visualizationPostPeding, loginCount: $loginCount, sacEnable: $sacEnable, sacBody: $sacBody, userSignature: $userSignature}';
  }
}


class UserSignature {
  int? codSignature;
  String? emailUserPaying;
  String? emailUserAnnouncer;
  bool? lifetime;
  bool? active;
  String? dueDate;
  List<String>? emailUsersPresented;

  UserSignature(
      {this.codSignature,
        this.emailUserPaying,
        this.emailUserAnnouncer,
        this.lifetime,
        this.active,
        this.dueDate,
        this.emailUsersPresented});

  UserSignature.fromJson(Map<String, dynamic> json) {
    codSignature = json['CodSignature'];
    emailUserPaying = json['EmailUserPaying'];
    emailUserAnnouncer = json['EmailUserAnnouncer'];
    lifetime = json['Lifetime'];
    active = json['Active'];
    dueDate = json['DueDate'];
    emailUsersPresented = json['EmailUsersPresented'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CodSignature'] = this.codSignature;
    data['EmailUserPaying'] = this.emailUserPaying;
    data['EmailUserAnnouncer'] = this.emailUserAnnouncer;
    data['Lifetime'] = this.lifetime;
    data['Active'] = this.active;
    data['DueDate'] = this.dueDate;
    data['EmailUsersPresented'] = this.emailUsersPresented;
    return data;
  }

  @override
  String toString() {
    return 'UserSignature{codSignature: $codSignature, emailUserPaying: $emailUserPaying, emailUserAnnouncer: $emailUserAnnouncer, lifetime: $lifetime, active: $active, dueDate: $dueDate, emailUsersPresented: $emailUsersPresented}';
  }
}
