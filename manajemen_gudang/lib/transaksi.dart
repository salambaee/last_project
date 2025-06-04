class Transaksi {
  String jenis;
  String namaBarang;
  int jumlah;
  DateTime waktu;

  Transaksi(this.jenis, this.namaBarang, this.jumlah) : waktu = DateTime.now();

  void tampilkanTransaksi() {
    print("$waktu - $jenis - $namaBarang sebanyak $jumlah");
  }
}