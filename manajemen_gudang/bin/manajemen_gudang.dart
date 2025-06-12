import 'package:manajemen_gudang/barang.dart';
import 'package:manajemen_gudang/gudang.dart';
import 'dart:io';


void main() {
  int counterID = 1;
  Gudang gudang = Gudang();
  stdout.write('\x1B[2J\x1B[0;0H');
  while(true) {
    print("Manajemen gudang");
    print("1. Tampilkan barang");
    print("2. Tambahkan barang");
    print("3. Cari barang berdasarkan nama barang");
    print("4. Cari barang berdasarkan id");
    print("5. Cari barang berdasarkan kode barang");
    print("6. Cari barang berdasarkan stok barang");
    print("7. Barang masuk");
    print("8. Barang keluar");
    print("9. Histori barang keluar dan masuk");
    print("10. Tampilkan stok barang terkecil ke terbesar");
    print("11. Tampilkan stok barang terbesar ke terkecil");

    String? userInput = stdin.readLineSync();
    
    switch(userInput) {
      case "1":
        gudang.tampilkanBarang();
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
      case "2":
        stdout.write("Masukkan kode barang : ");
        String? kodeBarang = stdin.readLineSync();
        stdout.write("Masukkan nama barang : ");
        String? namaBarang = stdin.readLineSync();
        stdout.write("Masukkan jumlah stok barang : ");
        int? stokBarang = int.parse(stdin.readLineSync()!);
        Barang barang = Barang("$kodeBarang", "$namaBarang", stokBarang, counterID++);
        gudang.tambahBarang(barang);
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
      case "3":
        stdout.write("Masukkan nama barang yang dicari : ");
        String? namaBarangYangDicari = stdin.readLineSync();
        gudang.cariBarangBerdasarkanNama(namaBarangYangDicari!);
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
      case "4":
        stdout.write("Masukkan id barang yang dicari : ");
        int? idBarangYangDicari = int.parse(stdin.readLineSync()!);
        gudang.cariBarangBerdasarkanId(idBarangYangDicari!);
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
      case "5":
        stdout.write("Masukkan kode barang yang dicari : ");
        String? kodeBarangYangDicari = stdin.readLineSync();
        gudang.cariBarangBerdasarkanKode(kodeBarangYangDicari!);
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
      case "6":
        stdout.write("Masukkan stok barang yang dicari : ");
        int? stokBarangYangDicari = int.parse(stdin.readLineSync()!);
        gudang.cariBarangBerdasarkanStok(stokBarangYangDicari);
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
      case "7":
        stdout.write("Masukkan kode barang yang akan ditambah stok : ");
        String kodeBarang = stdin.readLineSync()!;
        stdout.write("Jumlah barang masuk : ");
        int jumlahBarang = int.parse(stdin.readLineSync()!);
        gudang.barangMasuk(kodeBarang, jumlahBarang);
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
      case "8":
        stdout.write("Masukkan kode barang yang akan dikeluarkan stok :");
        String kodeBarang = stdin.readLineSync()!;
        stdout.write("Jumlah barang keluar : ");
        int jumlahBarang = int.parse(stdin.readLineSync()!);
        gudang.barangKeluar(kodeBarang, jumlahBarang);
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
      case "9":
        gudang.tampilkanHistoriTransaksi();
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
      case "10":
        gudang.tampilkanBarangUrutStokTerkecilKeTerbesar();
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
      case "11":
        gudang.tampilkanBarangUrutStokTerbesarKeTerkecil();
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
        stdout.write('\x1B[2J\x1B[0;0H');
    }
  }
}
