class AudioRes {
  static String basePath = 'audio';

  final angka = _Angka();
  final huruf = _Huruf();
  final home = _Home();
  final introMateri = _IntroMateri();
  final soalLiterasi = _SoalLiterasi();
  final soalNumerasi = _SoalNumerasi();
  final numerasi = _Numerasi();

  String get bg => 'bg.mp3';
  String get click => '${AudioRes.basePath}/click.mp3';
}

class _Numerasi {
  static String subPath = 'numerasi';

  final berhitung = _Berhitung();
  final mencocokanAngka = _MencocokanAngka();
  final mengenalAngka = _MengenalAngka();
  final mengenalBentuk = _MengenalBentuk();
  final mengenalPerbandingan = _MengenalPerbandingan();
  final mengenalPosisi = _MengenalPosisi();
  final mengenalPosisiUrutan = _MengenalPosisiUrutan();

  String get ayoBelajarAngka =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/ayo_belajar_angka.mp3';
}

class _Berhitung {
  static String subPathFolder = 'berhitung';

  String get kupu =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/6_kupu2.mp3';
  String get wortel =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/7_wortel.mp3';
  String get buahNaga =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/buah_naga.mp3';
  String get belajarBerhitung =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/belajar_berhitung.mp3';
}

class _MencocokanAngka {
  static String subPathFolder = 'mencocokan_angka';

  String get wortel10 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/10_wortel.mp3';
  String get apel1 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/1_apel.mp3';
  String get nanas2 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/2_nanas.mp3';
  String get telur3 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/3_telur.mp3';
  String get apel4 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/4_apel.mp3';
  String get apel5 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/5_apel.mp3';
  String get telur6 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/6_telur.mp3';
  String get sapi7 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/7_sapi.mp3';
  String get payung8 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/8_payung.mp3';
  String get ular9 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/9_ular.mp3';
  String get belajarMenghitungJumlahBenda =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/belajar_menghitung_jumlah_benda.mp3';
}

class _MengenalAngka {
  static String subPathFolder = 'mengenal_angka_&_jumlah_benda';

  String get berapaJumlahApel =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/berapa_jumlah_apel.mp3';
  String get berapaJumlahNanas =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/berapa_jumlah_nanas.mp3';
  String get berapaJumlahObat =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/berapa_jumlah_obat.mp3';
  String get berapaJumlahWortel =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/berapa_jumlah_wortel.mp3';
  String get berapaJumlahYoyo =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/berapa_jumlah_yoyo.mp3';
  String get mengenalAngkaJumlahBenda =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/mengenal_angka_&_jumlah_benda.mp3';
  String get pilihLevel =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/pilih_level.mp3';
}

class _MengenalBentuk {
  static String subPathFolder = 'mengenal_bentuk';

  String get belajarMengenalBentuk =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/belajar_mengenal_bentuk.mp3';
  String get lingkaran =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/lingkaran.mp3';
  String get lingkaranSegi3LingkaranSegi3 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/lingkaran_segi3_lingkaran_segi3.mp3';
  String get mengenalPola =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/mengenal_pola.mp3';
  String get persegi =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/persegi.mp3';
  String get persegiLingkaranPersegiLingkaran =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/persegi_lingkaran_persegi_lingkaran_.mp3';
  String get persegiPanjang =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/persegi_panjang.mp3';
  String get segi3 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/segu3.mp3';
}

class _MengenalPerbandingan {
  static String subPathFolder = 'mengenal_perbandingan';

  String get manaLebihBanyak =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/mana_yg_lebih_banyak.mp3';
  String get manaLebihSedikit =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/mana_yg_lebih_sedikit.mp3';
  String get perbandinganJumlahBenda =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/perbandingan_jumlah_benda.mp3';
}

class _MengenalPosisi {
  static String subPathFolder = 'mengenal_posisi';

  String get atasMeja =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/atas_meja.mp3';
  String get bawahMeja =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/bawah_meja.mp3';
  String get mengenalPosisi =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/mengenal_posisi.mp3';
  String get sampingMeja =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/samping_meja.mp3';
}

class _MengenalPosisiUrutan {
  static String subPathFolder = 'mengenal_posisi_urutan';

  String get ceritaUrutan =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/cerita_urutan.mp3';
  String get ceritaUrutan2 =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/cerita_urutan_2.mp3';
  String get manaPosisiSegi3Kuning =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/mana_posisi_segi3_kuning.mp3';
  String get mengenalPosisiUrutan =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/mengenal_posisi_urutan.mp3';
  String get mengenalUrutan =>
      '${AudioRes.basePath}/${_Numerasi.subPath}/$subPathFolder/mengenal_urutan.mp3';
}

class _Angka {
  static String subPath = 'angka';

  String get nol => '${AudioRes.basePath}/$subPath/0.mp3';
  String get satu => '${AudioRes.basePath}/$subPath/1.mp3';
  String get dua => '${AudioRes.basePath}/$subPath/2.mp3';
  String get tiga => '${AudioRes.basePath}/$subPath/3.mp3';
  String get empat => '${AudioRes.basePath}/$subPath/4.mp3';
  String get lima => '${AudioRes.basePath}/$subPath/5.mp3';
  String get enam => '${AudioRes.basePath}/$subPath/6.mp3';
  String get tujuh => '${AudioRes.basePath}/$subPath/7.mp3';
  String get delapan => '${AudioRes.basePath}/$subPath/8.mp3';
  String get sembilan => '${AudioRes.basePath}/$subPath/9.mp3';
}

class _Huruf {
  static String subPath = 'huruf';

  String get a => '${AudioRes.basePath}/$subPath/a.mp3';
  String get b => '${AudioRes.basePath}/$subPath/b.mp3';
  String get c => '${AudioRes.basePath}/$subPath/c.mp3';
  String get d => '${AudioRes.basePath}/$subPath/d.mp3';
  String get e => '${AudioRes.basePath}/$subPath/e.mp3';
  String get f => '${AudioRes.basePath}/$subPath/f.mp3';
  String get g => '${AudioRes.basePath}/$subPath/g.mp3';
  String get h => '${AudioRes.basePath}/$subPath/h.mp3';
  String get i => '${AudioRes.basePath}/$subPath/i.mp3';
  String get j => '${AudioRes.basePath}/$subPath/j.mp3';
  String get k => '${AudioRes.basePath}/$subPath/k.mp3';
  String get l => '${AudioRes.basePath}/$subPath/l.mp3';
  String get m => '${AudioRes.basePath}/$subPath/m.mp3';
  String get n => '${AudioRes.basePath}/$subPath/n.mp3';
  String get o => '${AudioRes.basePath}/$subPath/o.mp3';
  String get p => '${AudioRes.basePath}/$subPath/p.mp3';
  String get q => '${AudioRes.basePath}/$subPath/q.mp3';
  String get r => '${AudioRes.basePath}/$subPath/r.mp3';
  String get s => '${AudioRes.basePath}/$subPath/s.mp3';
  String get t => '${AudioRes.basePath}/$subPath/t.mp3';
  String get u => '${AudioRes.basePath}/$subPath/u.mp3';
  String get v => '${AudioRes.basePath}/$subPath/v.mp3';
  String get w => '${AudioRes.basePath}/$subPath/w.mp3';
  String get x => '${AudioRes.basePath}/$subPath/x.mp3';
  String get y => '${AudioRes.basePath}/$subPath/y.mp3';
  String get z => '${AudioRes.basePath}/$subPath/z.mp3';
}

class _Home {
  static String subPath = 'home';

  String get beranda => '${AudioRes.basePath}/$subPath/beranda.mp3';
}

class _IntroMateri {
  static String subPath = 'intro_materi';

  String get mengenalAngka =>
      '${AudioRes.basePath}/$subPath/mengenal_angka.mp3';
  String get mengenalHuruf =>
      '${AudioRes.basePath}/$subPath/mengenal_huruf.mp3';
}

class _SoalLiterasi {
  static String subPath = 'soal_literasi';

  String get satu => '${AudioRes.basePath}/$subPath/1.mp3';
  String get dua => '${AudioRes.basePath}/$subPath/2.mp3';
  String get tiga => '${AudioRes.basePath}/$subPath/3.mp3';
  String get empat => '${AudioRes.basePath}/$subPath/4.mp3';
  String get lima => '${AudioRes.basePath}/$subPath/5.mp3';
  String get enam => '${AudioRes.basePath}/$subPath/6.mp3';
  String get tujuh => '${AudioRes.basePath}/$subPath/7.mp3';
  String get delapan => '${AudioRes.basePath}/$subPath/8.mp3';
  String get sembilan => '${AudioRes.basePath}/$subPath/9.mp3';
  String get sepuluh => '${AudioRes.basePath}/$subPath/10.mp3';
}

class _SoalNumerasi {
  static String subPath = 'soal_numerasi';

  String get satu => '${AudioRes.basePath}/$subPath/1.mp3';
  String get dua => '${AudioRes.basePath}/$subPath/2.mp3';
  String get tiga => '${AudioRes.basePath}/$subPath/3.mp3';
  String get empat => '${AudioRes.basePath}/$subPath/4.mp3';
  String get lima => '${AudioRes.basePath}/$subPath/5.mp3';
  String get enam => '${AudioRes.basePath}/$subPath/6.mp3';
  String get tujuh => '${AudioRes.basePath}/$subPath/7.mp3';
  String get delapan => '${AudioRes.basePath}/$subPath/8.mp3';
  String get sembilan => '${AudioRes.basePath}/$subPath/9.mp3';
  String get sepuluh => '${AudioRes.basePath}/$subPath/10.mp3';
}
