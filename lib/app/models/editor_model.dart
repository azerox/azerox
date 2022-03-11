import 'package:azerox/app/models/user.dart';

class EditorModel {
  final int codUserFriend;
  final int codUserFriendStatus;
  final int codUserProfile;
  final UserModel editor;

  EditorModel(
    this.codUserFriend,
    this.codUserFriendStatus,
    this.codUserProfile,
    this.editor,
  );

  Map<String, dynamic> toJson() {
    return {
      'CodUserFriend': codUserFriend,
      'CodUserFriendStatus': codUserFriendStatus,
      'CodUserProfile': codUserProfile,
      'User': editor.toJson(),
    };
  }

  factory EditorModel.fromJson(Map<String, dynamic> map) {
    return EditorModel(
      map['CodUserFriend'] ?? '',
      map['CodUserFriendStatus'] ?? '',
      map['CodUserProfile'] ?? '',
      UserModel.fromJson(map['User']),
    );
  }

  @override
  String toString() {
    return 'EditorModel(codUserFriend: $codUserFriend, codUserFriendStatus: $codUserFriendStatus, codUserProfile: $codUserProfile, editor: $editor)';
  }
}
