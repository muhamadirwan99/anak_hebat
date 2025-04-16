import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  final namaC = TextEditingController();
  final usernameLoginC = TextEditingController();
  final passwordLoginC = TextEditingController();
  final usernameSignupC = TextEditingController();
  final passwordSignupC = TextEditingController();

  bool obscure = true;
  bool isContentLogin = true;

  void clearTextFields() {
    namaC.clear();
    usernameLoginC.clear();
    passwordLoginC.clear();
    usernameSignupC.clear();
    passwordSignupC.clear();
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
