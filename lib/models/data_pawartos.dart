class DataPawartos {
  String? nama;
  String? umur;
  String? alamat;
  String? sedoDinten;
  String? sedoTgl;
  String? sedoTabuh;
  String? sedoWonten;
  String? kuburDinten;
  String? kuburTgl;
  String? kuburTabuh;
  String? kuburWonten;
  List<Kerabat>? kerabat;

  DataPawartos({
    this.nama,
    this.umur,
    this.alamat,
    this.kerabat,
    this.sedoDinten,
    this.sedoTgl,
    this.sedoTabuh,
    this.sedoWonten,
    this.kuburDinten,
    this.kuburTgl,
    this.kuburTabuh,
    this.kuburWonten,
  });

  DataPawartos.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    umur = json['umur'];
    alamat = json['alamat'];
    if (json['kerabat'] != null) {
      kerabat = <Kerabat>[];
      json['kerabat'].forEach((v) {
        kerabat!.add(Kerabat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['umur'] = umur;
    data['alamat'] = alamat;
    data['dinten_sedo'] = sedoDinten;
    data['tgl_sedo'] = sedoTgl;
    data['wekdal_sedo'] = sedoTabuh;
    data['wonten_sedo'] = sedoWonten;
    data['dinten_kubur'] = kuburDinten;
    data['tgl_kubur'] = kuburTgl;
    data['wekdal_kubur'] = kuburTabuh;
    data['wonten_kubur'] = kuburWonten;
    data['alamat'] = alamat;
    if (kerabat != null) {
      data['kerabat'] = kerabat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kerabat {
  String? nama;
  String? status;

  Kerabat({this.nama, this.status});

  Kerabat.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['status'] = status;
    return data;
  }
}
