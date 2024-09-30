import 'Librarysystem.dart';
void main() {
  Librarysystem myLibrary = Librarysystem();

  myLibrary.addNewBook(Buku('The Catcher in the Rye', ' J.D. Salinger', 1951));
  myLibrary.addNewBook(Buku('The Alchemist', 'Paulo Coelho', 1988));
  myLibrary.addNewBook(Buku('The Diary of a Young Girl', 'Anne Frank', 1478));

  myLibrary.listAllBooks();

  myLibrary.deleteBook('The Alchemist');

  myLibrary.listAllBooks();
}

