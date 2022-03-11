import 'package:azerox/app/models/post_item.dart';
import 'package:azerox/app/models/user.dart';

class Post {
  int? codPost;
  int? codPostMaster;
  int? codPostStatus;
  String? nameEvent;
  String? dateEventString;
  String? date;
  List<PostItens>? postItens;
  List<Post>? listRepost;
  UserModel? user;
  late bool isFavorite;

  Post({
    this.codPost,
    this.codPostMaster,
    this.codPostStatus,
    this.nameEvent,
    this.dateEventString,
    this.postItens,
    this.user,
    this.isFavorite = false,
  });

  Post.fromJson(Map<String, dynamic> json) {
    codPost = json['CodPost'];
    codPostMaster = json['CodPostMaster'];
    codPostStatus = json['CodPostStatus'];
    nameEvent = json['NameEvent'];
    dateEventString = json['DateEventString'];
    date = json['Date'];
    if (json['PostItens'] != null) {
      postItens = <PostItens>[];
      json['PostItens'].forEach((v) {
        postItens?.add(PostItens.fromJson(v));
      });
    }
    if (json['ListRepost'] != null) {
      listRepost = <Post>[];
      json['ListRepost'].forEach((v) {
        listRepost?.add(Post.fromJson(v));
      });
    }
    user = UserModel.fromJson(json['User']);
    isFavorite = json['IsFavorite'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['CodPost'] = codPost;
    data['CodPostMaster'] = codPostMaster;
    data['CodPostStatus'] = codPostStatus;
    data['NameEvent'] = nameEvent;
    data['DateEventString'] = dateEventString;
    data['Date'] = date;
    if (postItens != null) {
      data['PostItens'] = postItens?.map((v) => v.toJson()).toList();
    }
    if (postItens != null) {
      data['ListRepost'] = listRepost?.map((v) => v.toJson()).toList();
    }
    data['User'] = user;
    data['IsFavorite'] = isFavorite;
    return data;
  }
}
