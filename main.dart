// Classe base
class ItemBiblioteca {
  String titulo;
  int anoPubli;
  int quantCopias;
  double precoBase;
  double multaDia;

  ItemBiblioteca(
    this.titulo,
    this.anoPubli,
    this.quantCopias,
    this.precoBase,
    this.multaDia,
  );
}

class Livro extends ItemBiblioteca {
  String autor;
  String isbn;

  Livro(String titulo, int anoPubli, int quantCopias, this.autor, this.isbn)
    : super(titulo, anoPubli, quantCopias, 15.0, 2.5);
}

class Revista extends ItemBiblioteca {
  int edicao;
  String mes;

  Revista(String titulo, int anoPubli, int quantCopias, this.edicao, this.mes)
    : super(titulo, anoPubli, quantCopias, 5.0, 1.0);
}

void main() {
  print("Olá, Seta! Dart está funcionando :)");

  int a = 10;
  int b = 15;
  print(a + b);
}
