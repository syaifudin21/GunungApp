class Berita {
  final int id;
  final String gunung;
  final String alamat;
  final String judul;
  final String text_pembuka;
  final String berita;
  final String lampiran;
  final String created_at;
  final String updated_at;

  Berita({this.id, this.gunung, this.alamat, this.judul, this.text_pembuka, this.berita, this.created_at, this.lampiran, this.updated_at});

  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
        id: json['id'],
        gunung: json['gunung'],
        alamat: json['alamat'],
        judul: json['judul'],
        text_pembuka: json['text_pembuka'],
        berita: json['berita'],
        lampiran: json['lampiran'],
        created_at: json['created_at'],
    );
  }
}