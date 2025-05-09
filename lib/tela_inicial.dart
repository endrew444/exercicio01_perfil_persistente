import 'package:flutter/material.dart';

// Classe que representa a tela inicial do aplicativo
class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de aplicativo com o título "Bem-vindo"
      appBar: AppBar(
        title: const Text('Bem-vindo'),
      ),
      // Corpo da tela centralizado
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os widgets verticalmente
          children: [
            // Botão para navegar para a tela de formulário
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/formulario'),
              child: const Text('Preencher Perfil'), // Texto do botão
            ),
            const SizedBox(height: 10), // Espaçamento entre os botões
            // Botão para navegar para a tela de visualização do perfil
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/visualizacao'),
              child: const Text('Ver Perfil'), // Texto do botão
            ),
          ],
        ),
      ),
    );
  }
}
