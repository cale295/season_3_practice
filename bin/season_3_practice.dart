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

  void tampilkanData() {
    print("Nama : $nama");
    print("NIM : $nim");
    print("Jurusan : $jurusan");
    print("Angkatan : $angkatan");
  }
}
class AsistenDosen extends Mahasiswa {
  String mataKuliah;

  AsistenDosen({
    required String nama,
    required String nim,
    required String jurusan,
    required int angkatan,
    required this.mataKuliah,
  }) : super(
        nama: nama,
        nim: nim,
        jurusan: jurusan,
        angkatan: angkatan,
      );

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Asisten MK: $mataKuliah");
  }
}

abstract class Pendaftaran {
  void daftarMatkul(String matkul);
}

class MahasiswaAktif extends Mahasiswa implements Pendaftaran {
  List<String> mataKuliah = [];

  MahasiswaAktif({
    required String nama,
    required String nim,
    required String jurusan,
    required int angkatan,
  }) : super(
        nama: nama,
        nim: nim,
        jurusan: jurusan,
        angkatan: angkatan,
      );

  @override
  void daftarMatkul(String matkul) {
    mataKuliah.add(matkul);
    print("$nama telah mendaftar mata kuliah: $matkul");
  }

  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Mata Kuliah Terdaftar: ${mataKuliah.join(', ')}");
  }
}

void main() {
  AsistenDosen asisten = AsistenDosen(
    nama: "Budi",
    nim: "123456789",
    jurusan: "Informatika",
    angkatan: 2021,
    mataKuliah: "Pemrograman Lanjut",
  );

  MahasiswaAktif mahasiswa = MahasiswaAktif(
    nama: "Siti",
    nim: "987654321",
    jurusan: "Sistem Informasi",
    angkatan: 2022,
  );

  asisten.tampilkanData();
  print("");
  mahasiswa.tampilkanData();
  print("");
  mahasiswa.daftarMatkul("Basis Data");
  mahasiswa.daftarMatkul("Jaringan Komputer");
  print("");
  mahasiswa.tampilkanData();
}