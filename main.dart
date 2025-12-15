//classe base
class Item {
  String titulo;
  double anoPubli;
  double quantCopias;
  double precoBase;
  double multaDia;
}

//classe livro, puxa de item
class Livro extends Item {
  String autor;
  double isbn;
}

class Revista extends Item {
  double edicao;
  String mes; 
}

void main() {
  print("Olá, Seta! Dart está funcionando :)");

  int a = 10;
  int b = 15;
  print(a + b);
}
