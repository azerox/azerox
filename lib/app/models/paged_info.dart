class PagedInfo {
  int? currentPage;
  int? totalPages;
  int? totalRows;
  int? totalGeneric;

  PagedInfo(
      {this.currentPage, this.totalPages, this.totalRows, this.totalGeneric});

  factory PagedInfo.fromJson(Map<String, dynamic> map) {
    return PagedInfo(
      currentPage: map['CurrentPage'] ?? 0,
      totalPages: map['TotalPages'] ?? 0,
      totalRows: map['TotalRows'] ?? 0,
      totalGeneric: map['TotalGeneric'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CurrentPage'] = this.currentPage;
    data['TotalPages'] = this.totalPages;
    data['TotalRows'] = this.totalRows;
    data['TotalGeneric'] = this.totalGeneric;
    return data;
  }

  @override
  String toString() {
    return 'PagedInfoNewEditor{currentPage: $currentPage, totalPages: $totalPages, totalRows: $totalRows, totalGeneric: $totalGeneric}';
  }
}
