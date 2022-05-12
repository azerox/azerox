import 'package:flutter/material.dart';

mixin NotifierLoadingMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _overlayEntry;
  ValueNotifier get loadingNotifier;

  Widget loadingBuilder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          ),
          const SizedBox(height: 15),
          Text("Carregando",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Theme.of(context).primaryColor)),
        ],
      ),
    );
  }

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() async {
    removeOverlay();
    loadingNotifier.removeListener(_notifierListener);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      loadingNotifier.addListener(_notifierListener);
    });
  }

  void _notifierListener() {
    print('NOTIFICOU');
    final isLoading = loadingNotifier.value.isLoading;
    if (isLoading) {
      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.black.withOpacity(0.2),
            body: Center(child: loadingBuilder(context)),
          ),
        ),
      );
      Overlay.of(context)?.insert(_overlayEntry!);
    } else {
      removeOverlay();
    }
  }
}
