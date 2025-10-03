void tampilkanDataTerformat({
  required String judul,
  required Map<String, dynamic> data,
}) {
  print('\n--- $judul ---');
  data.forEach((label, nilai) {
    String labelPadded = label.padRight(12);
  
    if (nilai is List<String>) {
      print('${labelPadded}:');
      if (nilai.isEmpty) {
        print('  (Belum ada)');
      } else {
        for (var item in nilai) {
          print('  - $item');
        }
      }
    } 
    else {
      print('$labelPadded: $nilai');
    }
  });
}

class Mahasiswa {
  String nama;
  String nim;
  String jurusan;
  int angkatan;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.angkatan,
  });

  Map<String, dynamic> get dataDasar => {
        'Nama': nama,
        'NIM': nim,
        'Jurusan': jurusan,
        'Angkatan': angkatan,
      };

  void tampilkanData() {
    tampilkanDataTerformat(
      judul: 'Profil Mahasiswa',
      data: dataDasar,
    );
  }
}

class AsistenDosen extends Mahasiswa {
  String mataKuliah;
  String status = "Asisten Dosen";

  AsistenDosen({
    required super.nama,
    required super.nim,
    required super.jurusan,
    required super.angkatan,
    required this.mataKuliah,
  });

  @override
  void tampilkanData() {
    final dataLengkap = {
      ...dataDasar,
      'Mengasuh': mataKuliah,
    };

    tampilkanDataTerformat(
      judul: 'Profil $status',
      data: dataLengkap,
    );
  }
}

abstract class Pendaftaran {
  void daftarMatkul(String matkul);
}

class MahasiswaAktif extends Mahasiswa implements Pendaftaran {
  List<String> matkulDiambil = [];

  MahasiswaAktif({
    required super.nama,
    required super.nim,
    required super.jurusan,
    required super.angkatan,
  });

  @override
  void daftarMatkul(String matkul) {
    matkulDiambil.add(matkul);
    print("✔ Matkul '$matkul' berhasil ditambahkan untuk $nama.");
  }

  @override
  void tampilkanData() {
    final dataLengkap = {
      ...dataDasar,
      'Mata Kuliah': matkulDiambil,
    };

    tampilkanDataTerformat(
      judul: 'Data Mahasiswa Aktif',
      data: dataLengkap,
    );
  }
}

void main() {
  final mhs1 = Mahasiswa(
    nama: "Muhammad Vargas Cahyadhi",
    nim: "1123150071",
    jurusan: "Informatika",
    angkatan: 2023,
  );
  mhs1.tampilkanData();

  final asdos = AsistenDosen(
    nama: "Pak Budi",
    nim: "998877",
    jurusan: "Teknik Informatika",
    angkatan: 2020,
    mataKuliah: "Mobile Programming",
  );
  asdos.tampilkanData();

  final mhs2 = MahasiswaAktif(
    nama: "Siti Aminah",
    nim: "1123150088",
    jurusan: "Teknik Informatika",
    angkatan: 2023,
  );
  mhs2.daftarMatkul("Web Programming");
  mhs2.daftarMatkul("Mobile Programming");
  mhs2.tampilkanData();
}