class Berita {
  final int id;
  final String gunung;
  final String alamat;
  final String judul;
  final String textPembuka;
  final String berita;
  final String lampiran;
  final String createdAt;
  final String updatedAt;

  Berita({this.id, this.gunung, this.alamat, this.judul, this.textPembuka, this.berita, this.createdAt, this.lampiran, this.updatedAt});

  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
        id: json['id'],
        gunung: json['gunung'],
        alamat: json['alamat'],
        judul: json['judul'],
        textPembuka: json['text_pembuka'],
        berita: json['berita'],
        lampiran: json['lampiran'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']
    );
  }
}