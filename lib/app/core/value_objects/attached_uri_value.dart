class AttachedUriValue {
  final Uri value;
  const AttachedUriValue(this.value);
  AttachedUriValue.fromUrl(String url) : value = Uri.parse(url);

  String get path {
    return value.pathSegments.sublist(value.pathSegments.length - 3).join('/');
  }

  String get fullUrl => value.toString();

  @override
  String toString() => 'AttachedUriValue(value: $value)';
}
