class SocialNetworks {
  int? codUser;
  String? sessionID;
  int? codNetWork;
  int? codNetWorkTypeDisplay;
  String? network;
  bool? showUrl;
  String? userNetWorkUrl;

  SocialNetworks({
    this.codUser,
    this.sessionID,
    this.codNetWork,
    this.codNetWorkTypeDisplay,
    this.network,
    this.showUrl,
    this.userNetWorkUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'CodUser': codUser,
      'SessionID': sessionID,
      'CodNetWork': codNetWork,
      'CodNetWorkTypeDisplay': codNetWorkTypeDisplay,
      'Network': network,
      'ShowUrl': showUrl,
      'UserNetWorkUrl': userNetWorkUrl,
    };
  }

  factory SocialNetworks.fromJson(Map<String, dynamic> map) {
    return SocialNetworks(
      codUser: map['CodUser'],
      sessionID: map['SessionID'],
      codNetWork: map['CodNetWork'],
      codNetWorkTypeDisplay: map['CodNetWorkTypeDisplay'],
      network: map['Network'],
      showUrl: map['ShowUrl'],
      userNetWorkUrl: map['UserNetWorkUrl'],
    );
  }

  @override
  String toString() {
    return 'SocialNetworks{codUser: $codUser, sessionID: $sessionID, codNetWork: $codNetWork, codNetWorkTypeDisplay: $codNetWorkTypeDisplay, network: $network, showUrl: $showUrl, userNetWorkUrl: $userNetWorkUrl}';
  }

  SocialNetworks copyWith({
    int? codUser,
    String? sessionID,
    int? codNetWork,
    int? codNetWorkTypeDisplay,
    String? network,
    bool? showUrl,
    String? userNetWorkUrl,
  }) {
    return SocialNetworks(
      codUser: codUser ?? this.codUser,
      sessionID: sessionID ?? this.sessionID,
      codNetWork: codNetWork ?? this.codNetWork,
      codNetWorkTypeDisplay:
          codNetWorkTypeDisplay ?? this.codNetWorkTypeDisplay,
      network: network ?? this.network,
      showUrl: showUrl ?? this.showUrl,
      userNetWorkUrl: userNetWorkUrl ?? this.userNetWorkUrl,
    );
  }
}
