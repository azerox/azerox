class AppConstants {
  static const apiBase = 'https://azerox.com.br/services';

  static const apiLogin = '$apiBase/jsonusers.asmx/GetUserLogin';
  static const apiPosts = '$apiBase/jsonposts.asmx/GetPostsAlbumByUser';
  static const apiRegister = '$apiBase/jsonusers.asmx/InsertUserFacebook';
  static const apiGetUserByEmail = '$apiBase/jsonusers.asmx/GetUserByEmail';
  static const apiFavoritePost = '$apiBase/jsonposts.asmx/InsertFavorite';
  static const apiDislikePost = '$apiBase/jsonposts.asmx/DeleteFavorite';
  static const apiFavoritedsPost =
      '$apiBase/jsonposts.asmx/GetPostsFavoritesByUser';
  static const apiGetPostsByUser = '$apiBase/jsonposts.asmx/GetPostsByUser';
  static const apiGetPUserBySearch =
      '$apiBase/jsonfriends.asmx/GetFriendsBySearch';
  static const apiInsertPost = '$apiBase/jsonposts.asmx/InsertPost';
  static const apiUploadImage =
      'https://s.azerox.com.br/Services/ImageHandler.ashx';
  static const apiUploadMp3 =
      'https://s.azerox.com.br/Services/AudioHandlerConverterIOS.ashx';

  static const uf = {
    "Acre": "AC",
    "Alagoas": "AL",
    "Amapá": "AP",
    "Amazonas": "AM",
    "Bahia": "BA",
    "Ceará": "CE",
    "Distrito Federal": "DF",
    "Espírito Santo": "ES",
    "Goiás": "GO",
    "Maranhão": "MA",
    "Mato Grosso": "MT",
    "Mato Grosso do Sul": "MS",
    "Minas Gerais": "MG",
    "Pará": "PA",
    "Paraíba": "PB",
    "Paraná": "PR",
    "Pernambuco": "PE",
    "Piauí": "PI",
    "Rio de Janeiro": "RJ",
    "Rio Grande do Norte": "RN",
    "Rio Grande do Sul": "RS",
    "Rondônia": "RO",
    "Roraima": "RR",
    "Santa Catarina": "SC",
    "São Paulo": "SP",
    "Sergipe": "SE",
    "Tocantins": "TO"
  };
}
