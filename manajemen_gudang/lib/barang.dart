class Barang {
  String _kodeBarang;
  String _namaBarang;
  int _stokBarang;
  int _idBarang;

  Barang(this._kodeBarang, this._namaBarang, this._stokBarang, this._idBarang);

  void tambahStok(int jumlah) {
    _stokBarang += jumlah;
  }

  void kurangiStok(int jumlah) {
    if (_stokBarang >= jumlah) {
      _stokBarang -= jumlah;
    } else {
      print("Stok tidak cukup");
    }
  }

  int get idBarang {
    return _idBarang;
  }

  String get kodeBarang {
    return _kodeBarang;
  }

  String get namaBarang {
    return _namaBarang;
  } 

  int get stokBarang {
    return _stokBarang;
  }
}