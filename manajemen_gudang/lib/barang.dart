class Barang {
  String _kodeBarang;
  String _namaBarang;
  int _stokBarang;
  int _idBarang;

  Barang(this._kodeBarang, this._namaBarang, this._stokBarang, this._idBarang);

  set stokBarang(int value) {
    _stokBarang = value;
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
