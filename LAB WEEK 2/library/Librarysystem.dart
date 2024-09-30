class Buku {
  String judul;
  String penulis;
  int tahunpublish;

  Buku(this.judul, this.penulis, this.tahunpublish);

  void showDetails() {
    print('Judul: $judul, Penulis: $penulis, Tahun Terbit: $tahunpublish');
  }
}

class Librarysystem {
  List<Buku> _bookCollection = []; 

  void addNewBook(Buku buku) {
    _bookCollection.add(buku);
    print('Buku "${buku.judul}" telah berhasil ditambahkan ke perpustakaan.');
  }

  void deleteBook(String judul) {
    _bookCollection.removeWhere((buku) => buku.judul == judul);
    print('Buku "$judul" telah berhasil dihapus dari perpustakaan.');
  }

  void listAllBooks() {
    if (_bookCollection.isEmpty) {
      print('Tidak ada buku ini di perpustakaan.');
    } else {
      print('Daftar Buku di Perpustakaan:');
      for (var buku in _bookCollection) {
        buku.showDetails();
      }
    }
  }
}
