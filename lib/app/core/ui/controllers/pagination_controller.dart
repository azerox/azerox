import 'package:flutter/foundation.dart';

abstract class PaginationController<T>
    extends ValueNotifier<PaginationState<T>> {
  PaginationController() : super(PaginationState.empty<T>());

  @protected
  Future<List<T>> getCurrentPageItems();

  void _setLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  Future<void> refreshItems() async {
    value = PaginationState.empty<T>();
    final itemsList = await getCurrentPageItems();
    value = value.copyWith(itemsList: itemsList);
  }

  Future<void> loadMoreItems() async {
    if (value.itemsList == null) return refreshItems();
    if (value.isLoading) return;

    try {
      _setLoading(true);
      final currentPageItems = await getCurrentPageItems();
      final newItemsList = value.itemsList! + currentPageItems;
      value = value.copyWith(itemsList: newItemsList);
    } catch (ex, stack) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }
}

class PaginationState<T> {
  final List<T>? itemsList;
  final bool isLoading;
  final int page;

  PaginationState({
    required this.itemsList,
    required this.isLoading,
    required this.page,
  });
  static PaginationState<T> empty<T>() => PaginationState(
        itemsList: null,
        isLoading: false,
        page: 1,
      );

  PaginationState<T> copyWith({
    List<T>? itemsList,
    bool? isLoading,
    int? page,
  }) {
    return PaginationState<T>(
      itemsList: itemsList ?? this.itemsList,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaginationState<T> &&
        listEquals(other.itemsList, itemsList) &&
        other.isLoading == isLoading &&
        other.page == page;
  }

  @override
  int get hashCode => itemsList.hashCode ^ isLoading.hashCode ^ page.hashCode;

  @override
  String toString() =>
      'PaginationState(itemsList: $itemsList, isLoading: $isLoading, page: $page)';
}
