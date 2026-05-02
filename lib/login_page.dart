import 'package:flutter/material.dart';
import 'shopping_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores exigidos pela atividade para capturar os dados
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _fazerLogin() {
    // O .trim() remove espaços acidentais e o toLowerCase() garante minúsculas
    String usuario = _usuarioController.text.trim().toLowerCase();
    String senha = _senhaController.text.trim();

    // Dica de Debug: Isso fará o texto digitado aparecer no Console (Run) do Android Studio
    print("Tentando logar com -> Usuário: '$usuario' | Senha: '$senha'");

    if (usuario == 'admin' && senha == '123') { //[cite: 2]
      print("Login com sucesso!");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ShoppingPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário ou senha incorretos!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // O Scaffold é essencial para dar a "cara" de aplicativo
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - Loja de Vestuário'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de Usuário
            TextField(
              controller: _usuarioController,
              decoration: const InputDecoration(
                labelText: 'Usuário',
                border: OutlineInputBorder(), // Cria a caixa ao redor do campo
              ),
            ),
            const SizedBox(height: 16),

            // Campo de Senha
            TextField(
              controller: _senhaController,
              obscureText: true, // Oculta a senha conforme exigido
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Botão Entrar
            ElevatedButton(
              onPressed: _fazerLogin,
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}