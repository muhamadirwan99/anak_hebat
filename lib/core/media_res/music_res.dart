class AudioRes {
  static String basePath = 'audio';

  final angka = _Angka();
  final huruf = _Huruf();

  String get bg => 'bg.mp3';
  String get click => '${AudioRes.basePath}/click.mp3';
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
