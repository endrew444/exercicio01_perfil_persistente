import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Tela de formulário para entrada de dados do usuário
class TelaFormulario extends StatefulWidget {
  const TelaFormulario({super.key});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  // Controladores para os campos de texto
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();

  // Valor inicial para a cor favorita
  String _corFavorita = 'Azul';

  // Lista de opções de cores disponíveis
  final List<String> _cores = ['Azul', 'Verde', 'Vermelho', 'Amarelo'];

  // Método para salvar os dados no SharedPreferences
  Future<void> _salvarDados() async {
    // Obtém os valores dos campos de texto e realiza validações
    final nome = _nomeController.text.trim();
    final idade = int.tryParse(_idadeController.text.trim()) ?? 0;

    // Verifica se os campos estão preenchidos corretamente
    if (nome.isEmpty || idade <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos corretamente.')),
      );
      return;
    }

    // Salva os dados no SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', nome);
    await prefs.setInt('idade', idade);
    await prefs.setString('cor', _corFavorita);

    // Navega para a tela de visualização
    Navigator.pushReplacementNamed(context, '/visualizacao');
  }

  @override
  void dispose() {
    // Libera os controladores para evitar vazamentos de memória
    _nomeController.dispose();
    _idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de texto para o nome
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 10),
            // Campo de texto para a idade
            TextField(
              controller: _idadeController,
              decoration: const InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            // Dropdown para selecionar a cor favorita
            DropdownButton<String>(
              value: _corFavorita,
              onChanged: (String? novaCor) {
                setState(() {
                  _corFavorita = novaCor!;
                });
              },
              items: _cores
                  .map((cor) => DropdownMenuItem(value: cor, child: Text(cor)))
                  .toList(),
            ),
            const SizedBox(height: 20),
            // Botão para salvar os dados
            Center(
              child: ElevatedButton(
                onPressed: _salvarDados,
                child: const Text('Salvar e Ver Perfil'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
