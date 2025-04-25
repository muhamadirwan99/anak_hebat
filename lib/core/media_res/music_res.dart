class MusicRes {
  static String basePath = 'assets/music';

  final angka = _Angka();
  final huruf = _Huruf();

  String get bg => '${MusicRes.basePath}/bg.mp3';
  String get click => '${MusicRes.basePath}/click.mp3';
}

class _Angka {
  static String subPath = 'angka';

  String get nol => '${MusicRes.basePath}/$subPath/0.mp3';
  String get satu => '${MusicRes.basePath}/$subPath/1.mp3';
  String get dua => '${MusicRes.basePath}/$subPath/2.mp3';
  String get tiga => '${MusicRes.basePath}/$subPath/3.mp3';
  String get empat => '${MusicRes.basePath}/$subPath/4.mp3';
  String get lima => '${MusicRes.basePath}/$subPath/5.mp3';
  String get enam => '${MusicRes.basePath}/$subPath/6.mp3';
  String get tujuh => '${MusicRes.basePath}/$subPath/7.mp3';
  String get delapan => '${MusicRes.basePath}/$subPath/8.mp3';
  String get sembilan => '${MusicRes.basePath}/$subPath/9.mp3';
}

class _Huruf {
  static String subPath = 'huruf';

  String get a => '${MusicRes.basePath}/$subPath/a.mp3';
  String get b => '${MusicRes.basePath}/$subPath/b.mp3';
  String get c => '${MusicRes.basePath}/$subPath/c.mp3';
  String get d => '${MusicRes.basePath}/$subPath/d.mp3';
  String get e => '${MusicRes.basePath}/$subPath/e.mp3';
  String get f => '${MusicRes.basePath}/$subPath/f.mp3';
  String get g => '${MusicRes.basePath}/$subPath/g.mp3';
  String get h => '${MusicRes.basePath}/$subPath/h.mp3';
  String get i => '${MusicRes.basePath}/$subPath/i.mp3';
  String get j => '${MusicRes.basePath}/$subPath/j.mp3';
  String get k => '${MusicRes.basePath}/$subPath/k.mp3';
  String get l => '${MusicRes.basePath}/$subPath/l.mp3';
  String get m => '${MusicRes.basePath}/$subPath/m.mp3';
  String get n => '${MusicRes.basePath}/$subPath/n.mp3';
  String get o => '${MusicRes.basePath}/$subPath/o.mp3';
  String get p => '${MusicRes.basePath}/$subPath/p.mp3';
  String get q => '${MusicRes.basePath}/$subPath/q.mp3';
  String get r => '${MusicRes.basePath}/$subPath/r.mp3';
  String get s => '${MusicRes.basePath}/$subPath/s.mp3';
  String get t => '${MusicRes.basePath}/$subPath/t.mp3';
  String get u => '${MusicRes.basePath}/$subPath/u.mp3';
  String get v => '${MusicRes.basePath}/$subPath/v.mp3';
  String get w => '${MusicRes.basePath}/$subPath/w.mp3';
  String get x => '${MusicRes.basePath}/$subPath/x.mp3';
  String get y => '${MusicRes.basePath}/$subPath/y.mp3';
  String get z => '${MusicRes.basePath}/$subPath/z.mp3';
}
