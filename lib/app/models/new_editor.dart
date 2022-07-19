import 'package:azerox/app/models/post_item.dart';
import 'package:azerox/app/models/user.dart';

class NewEditor {
  int? codUserFriend;
  int? codUserFriendStatus;
  int? codUserProfile;
  int? codUserRequired;
  UserModel? user;

  NewEditor(
      {this.codUserFriend,
      this.codUserFriendStatus,
      this.codUserProfile,
      this.codUserRequired,
      this.user});

  NewEditor.fromJson(Map<String, dynamic> json) {
    codUserFriend = json['CodUserFriend'];
    codUserFriendStatus = json['CodUserFriendStatus'];
    codUserProfile = json['CodUserProfile'];
    codUserRequired = json['CodUserRequired'];
    user = UserModel.fromJson(json['User']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CodUserFriend'] = this.codUserFriend ?? '';
    data['CodUserFriendStatus'] = this.codUserFriendStatus ?? '';
    data['CodUserProfile'] = this.codUserProfile ?? '';
    data['CodUserRequired'] = this.codUserRequired ?? '';
    data['User'] = user ?? '';
    return data;
  }

  @override
  String toString() {
    return 'FriendsModel{codUserFriend: $codUserFriend, codUserFriendStatus: $codUserFriendStatus, codUserProfile: $codUserProfile, codUserRequired: $codUserRequired, user: $user}';
  }
}
