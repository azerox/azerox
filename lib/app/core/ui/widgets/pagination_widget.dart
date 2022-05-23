import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../controllers/pagination_controller.dart';

class PaginationWidget<T> extends StatefulWidget {
  final PaginationController<T> controller;
  final Widget Function(BuildContext context, T item) builder;

  const PaginationWidget({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  @override
  State<PaginationWidget<T>> createState() => _PaginationWidgetState<T>();
}

class _PaginationWidgetState<T> extends State<PaginationWidget<T>> {
  @override
  void initState() {
    super.initState();
    widget.controller.refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final List<T>? itemsList = widget.controller.value.itemsList;
        if (itemsList == null) {
          return const Center(child: CupertinoActivityIndicator());
        }

        return LazyLoadScrollView(
          onEndOfPage: () => widget.controller.loadMoreItems(),
          isLoading: widget.controller.value.isLoading,
          scrollOffset: 200,
          child: RefreshIndicator(
            onRefresh: () => widget.controller.refreshItems(),
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              itemCount: itemsList.length,
              itemBuilder: (context, index) {
                final isLastest = index == itemsList.length - 1;
                final isLoading = widget.controller.value.isLoading;
                if (isLastest && isLoading) {
                  return Column(
                    children: [
                      widget.builder(context, itemsList[index]),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: const CupertinoActivityIndicator(),
                      ),
                    ],
                  );
                }
                return widget.builder(context, itemsList[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
