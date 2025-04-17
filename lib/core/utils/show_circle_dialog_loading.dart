import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';

void showCircleLoading() {
  showDialog(
    context: globalContext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(16.0),
          child: const CircularProgressIndicator(),
        ),
      );
    },
  );
}
