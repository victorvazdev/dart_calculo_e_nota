import 'dart:io';

void main() {
  Map<String, List<double>> estudantes = obterEstudantes();

  menu(estudantes);
}

Map<String, List<double>> obterEstudantes() {
  var estudantes = <String, List<double>>{};

  // Criar mock de estudantes
  estudantes['João'] = [9.3, 7.8, 8.5, 9.0];

  return estudantes;
}

void menu(Map<String, List<double>> estudantes) {
  String? entrada;
  List<int> entradasPermitidas = [1, 2, 3, 4];

  cabecalho();

  print('Escolhe uma opção:');
  print(' 1 - Registrar estudante');
  print(' 2 - Consultar estudantes');
  print(' 3 - Consultar média dos estudantes e da turma');
  print(' 4 - Sair');
  entrada = stdin.readLineSync();

  if (entrada != null &&
      entrada.isNotEmpty &&
      entradasPermitidas.contains(int.parse(entrada))) {
    switch (entrada) {
      case '1':
        cadastrarEstudante(estudantes);

        // Rertornar ao menu
        menu(estudantes);
        break;
      case '2':
        consultarEstudantes(estudantes);

        // Rertornar ao menu
        menu(estudantes);
        break;
      case '3':
        consultarMediaTurma(estudantes);

        // Rertornar ao menu
        menu(estudantes);
        break;
      case '4':
        break;
    }
  } else {
    print('Opção inválida');
    menu(estudantes);
  }
}

void consultarMediaTurma(Map<String, List<double>> estudantes) {
  double soma = 0;
  double somaMediaTurma = 0;

  print('Média dos estudantes:\n');

  for (var estudante in estudantes.keys) {
    for (var nota in estudantes[estudante]!) {
      soma += nota;
    }

    print('Nome: $estudante');
    print('Média do estudante: ${soma / estudantes[estudante]!.length}\n');

    somaMediaTurma += soma / estudantes[estudante]!.length;

    soma = 0;
  }

  print('A média da turma é: ${somaMediaTurma / estudantes.length}');
}

consultarEstudantes(Map<String, List<double>> estudantes) {
  print('Estudantes:');

  for (var estudante in estudantes.keys) {
    print('Nome: $estudante');
    print('Notas: ${estudantes[estudante].toString()}');
  }
}

void cadastrarEstudante(Map<String, List<double>> estudantes) {
  String? nome;
  List<double> notas = [];

  print('Digite o nome do estudante:');
  nome = stdin.readLineSync();

  if (nome != null && nome.isNotEmpty) {
    print('Digite as notas do estudante (digite -1 para sair):');
    while (true) {
      String? nota = stdin.readLineSync();
      if (nota != null && nota.isNotEmpty) {
        if (double.parse(nota) == -1) {
          break;
        }
        notas.add(double.parse(nota));
      }
    }

    registrarEstudante(estudantes, nome, notas);
  } else {
    print('Nome inválido');
    cadastrarEstudante(estudantes);
  }
}

void registrarEstudante(
    Map<String, List<double>> estudantes, String nome, List<double> notas) {
  estudantes[nome] = notas;
}

void cabecalho() {
  print("   ____    ___     _   _ ");
  print("  / ___|  ( _ )   | \\ | |");
  print(" | |      / _ \\/\\ |  \\| |");
  print(" | |___  | (_>  < | |\\  |");
  print("  \\____|  \\___/\\/ |_| \\_|");
  print("                         ");
}
