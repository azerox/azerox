class PostItens {
  int? codPostItem;
  int? codPost;
  int? codPostType;
  String? postItem;
  String? postItemMax;

  PostItens({
    this.codPostItem,
    this.codPost,
    this.codPostType,
    this.postItem,
    this.postItemMax,
  });

  PostItens.fromJson(Map<String, dynamic> json) {
    codPostItem = json['CodPostItem'];
    codPost = json['CodPost'];
    codPostType = json['CodPostType'];
    postItem = json['PostItem'];
    postItemMax = json['PostItemMax'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['CodPostItem'] = codPostItem;
    data['CodPost'] = codPost;
    data['CodPostType'] = codPostType;
    data['PostItem'] = postItem;
    data['PostItemMax'] = postItemMax;
    return data;
  }
}
