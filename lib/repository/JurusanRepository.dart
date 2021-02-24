import 'package:school_app/apiutils/api_connection.dart';
import 'package:school_app/model/jurusanModel.dart';

class JurusanRepository {
  Future<bool> addJurusan({String name, int kuota}) async {
    JurusanModel jurusanModel = JurusanModel(kuota: kuota, namaJurusan: name);
    bool result = await createJurusan(jurusanModel);
    return result;
  }

  Future<List<JurusanModel>> getJurusan({int id}) async {
    List<JurusanModel> result = await getJurusanAvail();
    return result;
  }
}
