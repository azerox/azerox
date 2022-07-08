class SocialNetworks {
  int? codNetWork;
  int? codNetWorkTypeDisplay;
  String? network;
  bool? showUrl;
  String? userNetWorkUrl;

  SocialNetworks(
      {this.codNetWork,
        this.codNetWorkTypeDisplay,
        this.network,
        this.showUrl,
        this.userNetWorkUrl});

  SocialNetworks.fromJson(Map<String, dynamic> json) {
    codNetWork = json['CodNetWork'];
    codNetWorkTypeDisplay = json['CodNetWorkTypeDisplay'];
    network = json['Network'];
    showUrl = json['ShowUrl'];
    userNetWorkUrl = json['UserNetWorkUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CodNetWork'] = this.codNetWork;
    data['CodNetWorkTypeDisplay'] = this.codNetWorkTypeDisplay;
    data['Network'] = this.network;
    data['ShowUrl'] = this.showUrl;
    data['UserNetWorkUrl'] = this.userNetWorkUrl;
    return data;
  }

  @override
  String toString() {
    return 'SocialNetworks{codNetWork: $codNetWork, codNetWorkTypeDisplay: $codNetWorkTypeDisplay, network: $network, showUrl: $showUrl, userNetWorkUrl: $userNetWorkUrl}';
  }
}