import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../controllers/pagination_controller.dart';

class PaginationWidget<T> extends StatefulWidget {
  final PaginationController<T> controller;
  final Widget Function(BuildContext context, T item) builder;
  final Widget? header;
  final bool autoRefresh;

  const PaginationWidget({
    Key? key,
    required this.controller,
    required this.builder,
    this.header,
    this.autoRefresh = true,
  }) : super(key: key);

  @override
  State<PaginationWidget<T>> createState() => _PaginationWidgetState<T>();
}

class _PaginationWidgetState<T> extends State<PaginationWidget<T>> {
  @override
  void initState() {
    super.initState();
    if (widget.autoRefresh) widget.controller.refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final List<T>? itemsList = widget.controller.value.itemsList;
        if (itemsList == null) {
          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              if (widget.header != null) widget.header!,
              const Expanded(
                child: Center(child: CupertinoActivityIndicator()),
              ),
            ],
          );
        }
        int itemsLength = itemsList.length;
        if (widget.header != null) itemsLength++;

        return LazyLoadScrollView(
          onEndOfPage: () => widget.controller.loadMoreItems(),
          isLoading: widget.controller.value.isLoading,
          scrollOffset: 200,
          child: RefreshIndicator(
            onRefresh: () => widget.controller.refreshItems(),
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).size.height / 1.5,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: itemsLength,
              itemBuilder: (context, index) {
                if (widget.header != null && index == 0) return widget.header!;

                int currentIndex = index;
                if (widget.header != null) currentIndex--;

                final isLastest = currentIndex == itemsList.length - 1;
                final isLoading = widget.controller.value.isLoading;
                if (isLastest && isLoading) {
                  return Column(
                    children: [
                      widget.builder(context, itemsList[currentIndex]),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: const CupertinoActivityIndicator(),
                      ),
                    ],
                  );
                }
                return widget.builder(context, itemsList[currentIndex]);
              },
            ),
          ),
        );
      },
    );
  }
}
