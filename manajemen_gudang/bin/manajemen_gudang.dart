import 'package:manajemen_gudang/barang.dart';
import 'package:manajemen_gudang/gudang.dart';
import 'dart:io';


void main() {
  int counterID = 1;
  Gudang gudang = Gudang();

  while(true) {
    print("Manajemen gudang");
    print("1. Tampilkan barang gudang");
    print("2. Tambahkan barang gudang");
    print("3. Cari barang berdasarkan nama barang");
    print("4. Cari barang berdasarkan id");
    print("5. Cari barang berdasarkan kode barang");
    print("6. Cari barang berdasarkan stok barang");
    String? userInput = stdin.readLineSync();
    switch(userInput) {
      case "1":
        gudang.tampilkanBarang();
        stdout.write("Ketuk apa saja untuk melanjutkan ");
        stdin.readLineSync();
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
      case "3":
        stdout.write("Masukkan nama barang yang dicari : ");
        String? namaBarangYangDicari = stdin.readLineSync();
        gudang.cariBarangBerdasarkanNama(namaBarangYangDicari!);
      case "4":
        print("Masih belom ada ya beb");
      case "5":
        stdout.write("Masukkan kode barang yang dicari : ");
        String? kodeBarangYangDicari = stdin.readLineSync();
        gudang.cariBarangBerdasarkanKode(kodeBarangYangDicari!);
      case "6":
        stdout.write("Masukkan stok barang yang dicari : ");
        int? stokBarangYangDicari = int.parse(stdin.readLineSync()!);
        gudang.cariBarangBerdasarkanStok(stokBarangYangDicari);
    }
  }
}