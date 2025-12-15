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
  List<ItemBiblioteca> acervo = [
    Livro('O Hobbit', 1937, 3, 'J.R.R. Tolkien', '123456'),
    Livro('1984', 1949, 2, 'George Orwell', '654321'),
    Livro('Dom Casmurro', 1899, 1, 'Machado de Assis', '987654'),
    Revista('Superinteressante', 2024, 5, 420, 'Janeiro'),
    Revista('Veja', 2024, 4, 1050, 'Fevereiro'),
    Revista('Galileu', 2024, 2, 380, 'Março'),
  ];
}
