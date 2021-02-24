class SiswaModel {
  int id;
  String username,
      password,
      role,
      nama,
      alamat,
      foto,
      noTlp,
      sekolahAsal,
      namaOrtu,
      jurusanId;

  SiswaModel({
    this.id,
    this.username,
    this.password,
    this.role,
    this.nama,
    this.noTlp,
    this.alamat,
    this.foto,
    this.jurusanId,
    this.namaOrtu,
    this.sekolahAsal,
  });

  factory SiswaModel.fromJson(Map<String, dynamic> data) => SiswaModel(
        id: data['id'],
        username: data['username'],
        password: data['password'],
        role: data['role'],
        nama: data['nama'],
        noTlp: data['noTlp'],
        alamat: data['alamat'],
        foto: data['foto'],
        jurusanId: data['jurusanId'],
        namaOrtu: data['namaOrtu'],
        sekolahAsal: data['sekolahAsal'],
      );

  Map<String, dynamic> toJson() => {
        "id": this.id ?? "",
        "username": this.username ?? "",
        "password": this.password ?? "",
        "role": this.role ?? "",
        "nama": this.nama ?? "",
        "noTlp": this.noTlp ?? "",
        "alamat": this.alamat ?? "",
        "foto": this.foto ?? "",
        "jurusanId": this.jurusanId ?? "",
        "namaOrtu": this.namaOrtu ?? "",
        "sekolahAsal": this.sekolahAsal ?? "",
      };
}
