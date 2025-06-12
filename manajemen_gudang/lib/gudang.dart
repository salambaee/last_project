import 'barang.dart';
import 'transaksi.dart';


class Gudang {
  List<Barang> daftarBarang = [];
  final riwayatTransaksi = RiwayatTransaksi();

  void tampilkanBarangUrutStokTerbesarKeTerkecil() {
    List<Barang> barangTerurut = List.from(daftarBarang);
    for (int i = 1; i < barangTerurut.length; i++) {
      Barang key = barangTerurut[i];
      int j = i - 1;

      while (j >= 0 && barangTerurut[j].stokBarang < key.stokBarang) {
        barangTerurut[j + 1] = barangTerurut[j];
        j--;
      }
      barangTerurut[j + 1] = key;
    }
    print("+----+------------+----------------------+------------+");
    print("| ID | Kode       | Nama Barang          | Stok       |");
    print("+----+------------+----------------------+------------+");
    for (Barang b in barangTerurut) {
      final id = b.idBarang.toString().padLeft(2);
      final kode = b.kodeBarang.padRight(10);
      final nama = b.namaBarang.padRight(20);
      final stok = b.stokBarang.toString().padLeft(10);
      print("| $id | $kode | $nama | $stok |");
    }
    print("+----+------------+----------------------+------------+");
  }

  void tampilkanBarangUrutStokTerkecilKeTerbesar() {
    List<Barang> barangTerurut = List.from(daftarBarang);
    for (int i = 1; i < barangTerurut.length; i++) {
      Barang key = barangTerurut[i];
      int j = i - 1;

      while (j >= 0 && barangTerurut[j].stokBarang > key.stokBarang) {
        barangTerurut[j + 1] = barangTerurut[j];
        j--;
      }
      barangTerurut[j + 1] = key;
    }
    print("+----+------------+----------------------+------------+");
    print("| ID | Kode       | Nama Barang          | Stok       |");
    print("+----+------------+----------------------+------------+");
    for (Barang b in barangTerurut) {
      final id = b.idBarang.toString().padLeft(2);
      final kode = b.kodeBarang.padRight(10);
      final nama = b.namaBarang.padRight(20);
      final stok = b.stokBarang.toString().padLeft(10);
      print("| $id | $kode | $nama | $stok |");
    }
    print("+----+------------+----------------------+------------+");
  }

  void tampilkanHistoriTransaksi() {
    riwayatTransaksi.tampilkanRiwayatTransaksiTerbaru();
  }

  void barangKeluar(String kodeBarang, int jumlah) {
    daftarBarang.sort((a, b) => a.kodeBarang.compareTo(b.kodeBarang));
    int kiri = 0;
    int kanan = daftarBarang.length - 1;
    bool ditemukan = false;

    while (kiri <= kanan) {
      int tengah = (kiri + kanan) ~/ 2;
      if (daftarBarang[tengah].kodeBarang == kodeBarang) {
        daftarBarang[tengah].stokBarang -= jumlah;
        riwayatTransaksi.tambahkanRiwayatTransaksi(Transaksi('Keluar', daftarBarang[tengah].namaBarang, jumlah));
        print("Stok barang ${daftarBarang[tengah].namaBarang} berhasil keluar");
        ditemukan = true;
      } else if (kodeBarang.compareTo(daftarBarang[tengah].kodeBarang) < 0) {
        kanan = tengah - 1;
      } else {
        kiri = tengah + 1;
      }
    }
    if (!ditemukan) {
      print("Barang dengan kode $kodeBarang tidak ditemukan");
    }
  }

  void barangMasuk(String kodeBarang, int jumlah) {
    daftarBarang.sort((a, b) => a.kodeBarang.compareTo(b.kodeBarang));
    int kiri = 0;
    int kanan = daftarBarang.length - 1;
    bool ditemukan = false;

    while (kiri <= kanan) {
      int tengah = (kiri + kanan) ~/ 2;
      if (daftarBarang[tengah].kodeBarang == kodeBarang) {
        daftarBarang[tengah].stokBarang += jumlah;
        riwayatTransaksi.tambahkanRiwayatTransaksi(Transaksi('Masuk', daftarBarang[tengah].namaBarang, jumlah));
        print("Stok barang ${daftarBarang[tengah].namaBarang} berhasil ditambahkan.");
        ditemukan = true;
        break;
      } else if (kodeBarang.compareTo(daftarBarang[tengah].kodeBarang) < 0) {
        kanan = tengah - 1;
      } else {
        kiri = tengah + 1;
      }
    }
    if (!ditemukan) {
      print("Barang dengan kode $kodeBarang tidak ditemukan");
    }
  }

  void tambahBarang(Barang barang) {
    daftarBarang.add(barang);
    print("Barang ${barang.namaBarang} telah ditambahkan dengan kode ${barang.kodeBarang}");
  }

  void tampilkanBarang() {
    if (daftarBarang.isEmpty) {
      print("Daftar barang kosong");
      return;
    }
    print("+----+------------+----------------------+------------+");
    print("| ID | Kode       | Nama Barang          | Stok       |");
    print("+----+------------+----------------------+------------+");
    for (var barang in daftarBarang) {
      final id = barang.idBarang.toString().padLeft(2);
      final kode = barang.kodeBarang.padRight(10);
      final nama = barang.namaBarang.padRight(20);
      final stok = barang.stokBarang.toString().padLeft(10);

      print("| $id | $kode | $nama | $stok |");
    }
    print("+----+------------+----------------------+------------+");
  }

  void cariBarangBerdasarkanNama(String namaBarangYangDicari) {
    if (daftarBarang.isEmpty) {
      print("Daftar barang kosong");
      return;
    }
    if (namaBarangYangDicari != '') { 
      print("+----+------------+----------------------+------------+");
      print("| ID | Kode       | Nama Barang          | Stok       |");
      print("+----+------------+----------------------+------------+");
      for (var barang in daftarBarang) {
        if (barang.namaBarang.toLowerCase().contains(namaBarangYangDicari.toLowerCase())) {
          final id = barang.idBarang.toString().padLeft(2);
          final kode = barang.kodeBarang.padRight(10);
          final nama = barang.namaBarang.padRight(20);
          final stok = barang.stokBarang.toString().padLeft(10);
          print("| $id | $kode | $nama | $stok |");
        } else {
          print("Barang tidak ditemukan!");
          return;
        }
      }
      print("+----+------------+----------------------+------------+");
    } else {
      print("Input jangan dibiarkan kosong!");
    }
  }

  void cariBarangBerdasarkanKode(String kodeBarangYangDicari) {
    if (daftarBarang.isEmpty) {
      print("Daftar barang kosong");
      return;
    } 
    if (kodeBarangYangDicari != '') {
      for (var barang in daftarBarang) {
        if (barang.kodeBarang.toLowerCase().contains(kodeBarangYangDicari.toLowerCase())) {
          print("+----+------------+----------------------+------------+");
          print("| ID | Kode       | Nama Barang          | Stok       |");
          print("+----+------------+----------------------+------------+");
          final id = barang.idBarang.toString().padLeft(2);
          final kode = barang.kodeBarang.padRight(10);
          final nama = barang.namaBarang.padRight(20);
          final stok = barang.stokBarang.toString().padLeft(10);
          print("| $id | $kode | $nama | $stok |");
          print("+----+------------+----------------------+------------+");
        } else {
          print("Barang tidak ditemukan!");
          return;
        }
      }
    } else {
      print("Input jangan dibiarkan kosong!");
    }
  }

  void cariBarangBerdasarkanId(int idBarangYangDicari) {
    if (daftarBarang.isEmpty) {
      print("Daftar barang kosong");
      return;
    }
    if (idBarangYangDicari.toString() != '' || idBarangYangDicari >= 0) {
      for (var barang in daftarBarang) {
        if (barang.idBarang == idBarangYangDicari) {
          print("+----+------------+----------------------+------------+");
          print("| ID | Kode       | Nama Barang          | Stok       |");
          print("+----+------------+----------------------+------------+");
          final id = barang.idBarang.toString().padLeft(2);
          final kode = barang.kodeBarang.padRight(10);
          final nama = barang.namaBarang.padRight(20);
          final stok = barang.stokBarang.toString().padLeft(10);
          print("| $id | $kode | $nama | $stok |");
          print("+----+------------+----------------------+------------+");
        } else {
          print("Barang tidak ditemukan!");
          return;
        }
      }
    } else {
      print("Input tidak boleh kosong");
    }
  }

  void cariBarangBerdasarkanStok(int stokBarangYangDicari) {
    if (daftarBarang.isEmpty) {
      print("Daftar barang kosong");
      return;
    }
    if (stokBarangYangDicari.toString() != '' || stokBarangYangDicari >= 0) {
      for (var barang in daftarBarang) {
        if (barang.stokBarang == stokBarangYangDicari) {
          print("+----+------------+----------------------+------------+");
          print("| ID | Kode       | Nama Barang          | Stok       |");
          print("+----+------------+----------------------+------------+");
          final id = barang.idBarang.toString().padLeft(2);
          final kode = barang.kodeBarang.padRight(10);
          final nama = barang.namaBarang.padRight(20);
          final stok = barang.stokBarang.toString().padLeft(10);
          print("| $id | $kode | $nama | $stok |");
          print("+----+------------+----------------------+------------+");
        } else {
          print("Barang tidak ditemukan!");
          return;
        }
      }
    } else {
      print("Input jangan dibiarkan kosong atau keluar indeks");
    }
  }
}
