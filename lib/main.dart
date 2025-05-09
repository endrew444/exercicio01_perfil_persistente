import 'package:flutter/material.dart';
import '/tela_inicial.dart';
import '/tela_formulario.dart';
import '/tela_visualizacao.dart';

// Função principal que inicia o aplicativo
void main() {
  runApp(const MeuPerfilApp());
}

// Classe principal do aplicativo
class MeuPerfilApp extends StatelessWidget {
  const MeuPerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título do aplicativo
      title: 'Meu Perfil Persistente',
      // Define a rota inicial do aplicativo
      initialRoute: '/',
      // Mapeia as rotas para as telas correspondentes
      routes: {
        '/': (context) => const TelaInicial(), // Tela inicial
        '/formulario': (context) => const TelaFormulario(), // Tela de formulário
        '/visualizacao': (context) => const TelaVisualizacao(), // Tela de visualização
      },
      // Remove a faixa de debug no canto superior direito
      debugShowCheckedModeBanner: false,
    );
  }
}
