import 'package:flutter/material.dart';

import 'package:flutter_overlay_loader/flutter_overlay_loader.dart' as l;

void showLoaderNew(BuildContext context) {
  l.Loader.show(context,
      progressIndicator: CircularProgressIndicator(),
      overlayColor: Colors.green.withOpacity(0.5));
}

void hideLoaderNew() {
  l.Loader.hide();
}
