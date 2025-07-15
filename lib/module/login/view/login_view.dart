import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    MediaRes.images.login,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(27),
                      ),
                    ),
                    child: Image.asset(
                      MediaRes.logo.logo,
                      height: 125,
                      width: 125,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Image.asset(
                    MediaRes.logo.undiksha,
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Media pembelajaran interaktif berdiferensiasi berbasis gaya belajar untuk meningkatkan kemampuan literasi dan numerasi anak TK",
                    style: GoogleFonts.baloo2(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  controller.isContentLogin
                      ? _contentLogin(controller)
                      : _contentSignup(controller),
                  const Spacer(),
                  Text(
                    "© Hak Cipta oleh Anak Hebat Universal",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff1E1E1E),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _contentLogin(LoginController controller) {
    return Column(
      children: [
        CustomFormField(
          label: 'Username',
          hint: 'Masukkan username',
          icon: Icons.person,
          controller: controller.usernameLoginC,
        ),
        const SizedBox(
          height: 32.0,
        ),
        CustomFormField(
          label: 'Kata Sandi',
          hint: 'Masukkan kata sandi',
          icon: Icons.lock,
          controller: controller.passwordLoginC,
          obscureText: controller.obscure,
          isPassword: true,
          onEditingComplete: () {
            controller.login();
          },
        ),
        const SizedBox(
          height: 40.0,
        ),
        CustomButton(
          text: "Masuk",
          onPressed: () {
            SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);

            controller.login();
          },
          isPrimary: true,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          children: [
            const Expanded(child: Divider(thickness: 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Belum punya akun?",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff616161),
                ),
              ),
            ),
            const Expanded(child: Divider(thickness: 1)),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomButton(
          text: "Buat Akun",
          onPressed: () {
            SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
            controller.clearTextFields();
            controller.isContentLogin = false;
            controller.update();
          },
          isPrimary: false,
        ),
      ],
    );
  }

  _contentSignup(LoginController controller) {
    return Column(
      children: [
        CustomFormField(
          key: const ValueKey("signup_name"),
          label: 'Nama Lengkap',
          hint: 'Masukkan nama lengkap',
          icon: Icons.person,
          controller: controller.nameC,
        ),
        const SizedBox(
          height: 32.0,
        ),
        CustomFormField(
          key: const ValueKey("signup_username"),
          label: 'Username',
          hint: 'Masukkan username',
          icon: Icons.person,
          controller: controller.usernameSignupC,
          obscureText: false, // penting juga!
          isPassword: false,
        ),
        const SizedBox(
          height: 32.0,
        ),
        CustomFormField(
          key: const ValueKey("signup_password"),
          label: 'Kata Sandi',
          hint: 'Masukkan kata sandi',
          icon: Icons.lock,
          controller: controller.passwordSignupC,
          obscureText: controller.obscure,
          isPassword: true,
          onEditingComplete: () {
            controller.addUser();
          },
        ),
        const SizedBox(
          height: 40.0,
        ),
        CustomButton(
          text: "Buat Akun",
          onPressed: () {
            SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
            controller.addUser();
          },
          isPrimary: true,
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomButton(
          text: "Kembali",
          onPressed: () {
            SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
            controller.clearTextFields();
            controller.isContentLogin = true;
            controller.update();
          },
          isPrimary: false,
        ),
      ],
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
