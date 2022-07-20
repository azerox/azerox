class PagedInfoNewEditor {
  int? currentPage;
  int? totalPages;
  int? totalRows;
  int? totalGeneric;

  PagedInfoNewEditor(
      {this.currentPage, this.totalPages, this.totalRows, this.totalGeneric});

  PagedInfoNewEditor.fromJson(Map<String, dynamic> json) {
    currentPage = json['CurrentPage'];
    totalPages = json['TotalPages'];
    totalRows = json['TotalRows'];
    totalGeneric = json['TotalGeneric'];
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