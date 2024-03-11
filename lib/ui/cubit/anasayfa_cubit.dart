import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/data/repo/kisilerdao_repository.dart';
import '../../data/entity/kisiler.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>>{
  AnasayfaCubit():super(<Kisiler>[]);

  var krepo = KisilerDaoRepository();

  Future<void> KisileriYukle() async {
    var liste = await krepo.KisileriYukle();
    emit(liste);
  }

  Future<void> ara(String aramakelimesi) async {
    var find = await krepo.ara(aramakelimesi);
    emit(find);
  }

  Future<void> sil(int kisi_id) async {
    await krepo.sil(kisi_id);
    await KisileriYukle();
  }


}