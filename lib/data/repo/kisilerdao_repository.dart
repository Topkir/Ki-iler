import 'package:kisiler_app/sqlite/veritabani_yardimcisi.dart';
import '../entity/kisiler.dart';

class KisilerDaoRepository {
  Future<void>  kaydet(String kisi_ad,String kisi_tel) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniKisi = Map<String,dynamic>();
    yeniKisi['kisi_ad'] = kisi_ad;
    yeniKisi['kisi_tel'] = kisi_tel;
    await db.insert('Kisiler', yeniKisi);
  }

  Future<void> guncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenKisi = Map<String,dynamic>();
    guncellenenKisi['kisi_ad'] = kisi_ad;
    guncellenenKisi['kisi_tel'] = kisi_tel;
    await db.update('Kisiler', guncellenenKisi,where: 'kisi_id = ?',whereArgs: [kisi_id]);
  }

  Future<void> sil(int kisi_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete('Kisiler',where: 'kisi_id = ?',whereArgs: [kisi_id]);
  }

  Future<List<Kisiler>> ara(String aramakelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_ad like '%$aramakelimesi%'");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Kisiler(kisi_id: satir['kisi_id'], kisi_ad: satir['kisi_ad'], kisi_tel: satir['kisi_tel']);
    });
  }

  Future<List<Kisiler>> KisileriYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery('SELECT * FROM kisiler');

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Kisiler(kisi_id: satir['kisi_id'], kisi_ad: satir['kisi_ad'], kisi_tel: satir['kisi_tel']);
    });
  }

}