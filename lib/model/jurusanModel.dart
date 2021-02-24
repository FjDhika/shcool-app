class JurusanModel {
  int id;
  String namaJurusan;
  int kuota;

  JurusanModel({
    this.id,
    this.namaJurusan,
    this.kuota,
  });

  factory JurusanModel.fromDatabaseJson(Map<String, dynamic> data) =>
      JurusanModel(
        id: data['id'],
        namaJurusan: data['namaJurusan'],
        kuota: data['kuota'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "namaJurusan": this.namaJurusan,
        "kuota": this.kuota,
      };
}
