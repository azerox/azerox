class PaginationFilter {
  int? page;
  int? pagesize;

  @override
  String toString() {
    return 'PaginationFilterAlbum{page: $page, pagesize: $pagesize}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationFilter &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          pagesize == other.pagesize;

  @override
  int get hashCode => page.hashCode ^ pagesize.hashCode;
}