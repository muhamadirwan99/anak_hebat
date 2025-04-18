import 'package:anak_hebat/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class RouteGuards {
  static Future<String?> authGuard(BuildContext context, GoRouterState state) async {
    final user = FirebaseAuth.instance.currentUser;
    final isLoggingIn = state.matchedLocation == RouterUtils.root;

    if (user == null && !isLoggingIn) {
      return RouterUtils.root; // not logged in, redirect to login
    }

    if (user != null && isLoggingIn) {
      return RouterUtils.home; // logged in, but trying to go to login
    }

    return null; // no redirect
  }
}
