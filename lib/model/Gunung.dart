class Gunung {
  final int id;
  final String nama;
  final String thumbnail;
  final String alamat;
  final String status;

  Gunung({this.id, this.nama, this.thumbnail, this.alamat, this.status});

  factory Gunung.fromJson(Map<String, dynamic> json) {
    return Gunung(
        id: json['id'] as int,
        nama: json['nama'] as String,
        alamat: json['alamat'] as String,
        thumbnail: json['thumbnail'] as String,
        status: json['status'] as String,
    );
  }
}