import 'barang.dart';
import 'transaksi.dart';

class Gudang {
  List<Barang> daftarBarang = [];
  List<Transaksi> historiTransaksi = [];

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
        if (barang.namaBarang.toLowerCase() == namaBarangYangDicari.toLowerCase()) {
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
        if (barang.kodeBarang.toLowerCase() == kodeBarangYangDicari.toLowerCase()) {
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