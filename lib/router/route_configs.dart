import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteConfigs {
  static Widget errorBuilder(BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 64.0,
            ),
            SizedBox(height: 16.0),
            Text(
              '404 - Page Not Found',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<String?> redirect(BuildContext context, GoRouterState state) {
    return RouteGuards.authGuard(context, state);
  }
}
