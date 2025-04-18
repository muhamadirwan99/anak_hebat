// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import 'package:universal_html/html.dart' as html;

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final nameC = TextEditingController();
  final usernameLoginC = TextEditingController();
  final passwordLoginC = TextEditingController();
  final usernameSignupC = TextEditingController();
  final passwordSignupC = TextEditingController();

  bool obscure = true;
  bool isContentLogin = true;

  void clearTextFields() {
    nameC.clear();
    usernameLoginC.clear();
    passwordLoginC.clear();
    usernameSignupC.clear();
    passwordSignupC.clear();
  }

  void login() async {
    if (usernameLoginC.text.isEmpty || passwordLoginC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showCircleLoading();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "${usernameLoginC.text}@anakhebat.com",
        password: passwordLoginC.text,
      );

      html.window.location.replace("/");
    } on FirebaseAuthException catch (e) {
      Get.back();

      showCustomSnackBar(
        context: context,
        message:
            "Login error: ${e.message?.replaceAll(RegExp(r'email address|Email Address|Email address|email Address'), "username")}",
        backgroundColor: Colors.red,
      );
    } catch (e) {
      Get.back();

      showCustomSnackBar(
        context: context,
        message: "Unexpected error: $e",
        backgroundColor: Colors.red,
      );
    }
  }

  void addUser() async {
    if (nameC.text.isEmpty || usernameSignupC.text.isEmpty || passwordSignupC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showCircleLoading();

    CollectionReference users = _firestore.collection('users');

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "${usernameSignupC.text}@anakhebat.com",
        password: passwordSignupC.text,
      );

      await users.add({
        'name': nameC.text,
        'username': usernameSignupC.text,
      });

      showCustomSnackBar(
        context: context,
        message: "User successfully added!",
      );

      Get.back();

      clearTextFields();
      isContentLogin = true;
      update();
    } on FirebaseAuthException catch (e) {
      Get.back();

      showCustomSnackBar(
        context: context,
        message:
            "Auth error: ${e.message?.replaceAll(RegExp(r'email address|Email Address|Email address|email Address'), "username")}",
        backgroundColor: Colors.red,
      );
    } catch (e) {
      Get.back();

      showCustomSnackBar(
        context: context,
        message: "Unexpected error: $e",
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
