import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteConfigs {
  static Widget errorBuilder(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 64.0,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'An error occurred',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            CustomButton(
              text: "Kembali",
              onPressed: () {
                GoRouter.of(context).go(RouterUtils.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
