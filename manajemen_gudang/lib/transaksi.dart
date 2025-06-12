class Transaksi {
  String jenis;
  String namaBarang;
  int jumlah;
  DateTime waktu;

  Transaksi(this.jenis, this.namaBarang, this.jumlah) : waktu = DateTime.now();

  @override
  String toString() {
    return ("$waktu - $jenis - $namaBarang sebanyak $jumlah");
  }
}

class Node<T> {
  T value;
  Node<T>? prev;
  Node<T>? next;

  Node(this.value, {this.prev, this.next});
}

class DoubleLinkedList<T> {
  Node<T>? _head;
  Node<T>? _tail;
  int _length = 0;

  bool isEmpty() {
    return _head == null;
  }

  int length() {
    return _length;
  }

  void addFirst(T value) {
    final newNode = Node(value);
    if (isEmpty()) {
      _head = newNode;
    } else {
      newNode.next = _head;
      _head!.prev = newNode;
      _head = newNode;
    }
    _length++;
  }

  void addLast(T value) {
    final newNode = Node(value);
    if (isEmpty()) {
      _head = newNode;
    } else {
      _tail!.next = newNode;
      newNode.prev = _tail;
      _tail = newNode;
    }
    _length++;
  }

  void printFordward() {
    Node<T>? current = _head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }

  void printReverse() {
    Node<T>? current = _tail;
    while (current != null) {
      print(current.value);
      current = current.prev;
    }
  }
}

class RiwayatTransaksi {
  final DoubleLinkedList<Transaksi> _riwayat = DoubleLinkedList();

  void tambahkanRiwayatTransaksi(Transaksi transaksi) {
    _riwayat.addFirst(transaksi);
  }

  void tampilkanRiwayatTransaksiTerbaru() {
    _riwayat.printFordward();
  }

  void tampilkanRiwayatTransaksiTerlama() {
    _riwayat.printReverse();
  }
}
