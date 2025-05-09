import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaVisualizacao extends StatefulWidget {
  const TelaVisualizacao({super.key});

  @override
  State<TelaVisualizacao> createState() => _TelaVisualizacaoState();
}

class _TelaVisualizacaoState extends State<TelaVisualizacao> {
  String? _nome;
  int? _idade;
  String? _cor;

  final Map<String, Color> _coresMap = {
    'Azul': Colors.blue,
    'Verde': Colors.green,
    'Vermelho': Colors.red,
    'Amarelo': Colors.yellow,
  };

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  // Método para carregar os dados do SharedPreferences
  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nome = prefs.getString('nome') ?? 'Não informado';
      _idade = prefs.getInt('idade') ?? 0;
      _cor = prefs.getString('cor') ?? 'Não informado';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define a cor de fundo com base na cor favorita
    final corFundo = _coresMap[_cor] ?? Colors.white;

    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(title: const Text('Perfil')),
      body: _nome == null
          ? const Center(child: CircularProgressIndicator()) // Exibe um indicador de carregamento
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Exibe o nome
                  Text('Nome: $_nome', style: const TextStyle(fontSize: 18)),
                  // Exibe a idade
                  Text('Idade: $_idade', style: const TextStyle(fontSize: 18)),
                  // Exibe a cor favorita
                  Text('Cor Favorita: $_cor',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 20),
                  // Botão para voltar à tela inicial
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                      child: const Text('Voltar à Tela Inicial'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
