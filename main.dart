import 'dart:io';

// Classe base
class ItemBiblioteca {
  String titulo;
  int anoPubli;
  int quantCopias;
  double precoBase;
  double multaDia;
  DateTime? dataEmprestimo; /* garante que o campo dataEmprestimo so possa 
  armazenar valores válidos de data e hora, o que é essencial para calcular a multa */

  ItemBiblioteca(
    this.titulo,
    this.anoPubli,
    this.quantCopias,
    this.precoBase,
    this.multaDia,
  );

  //metodo para emprestar
  bool emprestar() {
    if (quantCopias > 0) {
      quantCopias--;
      dataEmprestimo = DateTime.now();
      print('o item {$titulo} foi emprestado com sucesso!');
      return true;
    } else {
      print('o item não está disponivel.');
      return false;
    }
  }

  //metodo para devolver
  double devolver(DateTime dataDevolucao) {
    int atraso = 0;
    quantCopias++;
    int diasEmprestados = dataDevolucao.difference(dataEmprestimo!).inDays;
    int diasPermitidos = 7; //chutei esse valor
    if (diasEmprestados > diasPermitidos)
      atraso = diasEmprestados - diasPermitidos;
    double valorTotal = precoBase + (atraso * multaDia);
    return valorTotal;
  }
}

class Livro extends ItemBiblioteca {
  String autor;
  String isbn;

  Livro(String titulo, int anoPubli, int quantCopias, this.autor, this.isbn)
    : super(titulo, anoPubli, quantCopias, 15.0, 2.5);

  //metodo para exibir
  void exibirDetalhes() {
    print('Livro: $titulo');
    print('Autor: $autor');
    print('ISBN: $isbn');
    print('Ano de publicação: $anoPubli');
    print('Cópias disponíveis: $quantCopias');
    print('---');
  }
}

class Revista extends ItemBiblioteca {
  int edicao;
  String mes;

  Revista(String titulo, int anoPubli, int quantCopias, this.edicao, this.mes)
    : super(titulo, anoPubli, quantCopias, 5.0, 1.0);

    //metodo para exibir
  void exibirDetalhes() {
    print('revista: $titulo');
    print('edição: $edicao');
    print('mês de publicação: $mes');
    print('ano de publicação: $anoPubli');
    print('disponíveis: $quantCopias');
    print('------');
    
  }
}

//listar o estoque
void listarEstoque(List<ItemBiblioteca> itens) {
  print('\n=== ACERVO DISPONIVEL ===');
  for(var item in itens){
    if (item is Livro) {
      item.exibirDetalhes();
    } else if (item is Revista) {
      item.exibirDetalhes();
    }
  }
}

void main() {
  List<ItemBiblioteca> acervo = [
    // nome  , ano , quant, autor , isbn
    Livro('O Hobbit', 1937, 2, 'J.R.R. Tolkien', '123456'),
    Livro('1984', 1949, 2, 'George Orwell', '654321'),
    Livro('Dom Casmurro', 1899, 1, 'Machado de Assis', '987654'),
    // nome  , ano , quant, edicao , mes
    Revista('Superinteressante', 2024, 5, 420, 'Janeiro'),
    Revista('Veja', 2024, 4, 1050, 'Fevereiro'),
    Revista('Galileu', 2024, 2, 380, 'Março'),
  ];

   int opcao = 0;

  while (opcao != 4) {
    print('\n=== MENU BIBLIOTECA ===');
    print('1 - Listar acervo');
    print('2 - Emprestar item');
    print('3 - Devolver item');
    print('4 - Sair');

    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        listarEstoque(acervo);
        break;

      case 2:
        print('Digite o título do item:');
        String titulo = stdin.readLineSync()!;

        for (var item in acervo) {
          if (item.titulo == titulo) {
            item.emprestar();
          }
        }
        break;

      case 3:
        print('Digite o título do item:');
        String titulo = stdin.readLineSync()!;

        print('Quantos dias o item ficou emprestado?');
        int dias = int.parse(stdin.readLineSync()!);

        DateTime dataDevolucao =
        DateTime.now().add(Duration(days: dias));

        for (var item in acervo) {
          if (item.titulo == titulo) {
            double valor = item.devolver(dataDevolucao);
            print('Valor a pagar: R\$ ${valor.toStringAsFixed(2)}');
          }
        }
        break;

      case 4:
        print('Encerrando sistema...');
        break;

      default:
        print('Opção inválida.');
    }
  }
}
