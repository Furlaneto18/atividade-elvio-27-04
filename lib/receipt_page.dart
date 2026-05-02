import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  // Variável final para receber o parâmetro obrigatório da Tela 2
  final double valorFinal;

  // Construtor recebendo o parâmetro
  const ReceiptPage({super.key, required this.valorFinal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recibo do Pedido')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Exibe o texto com o valor formatado para duas casas decimais
              const Icon(Icons.check_circle_outline, size: 80, color: Colors.green),
              const SizedBox(height: 20),
              Text(
                // Formatação para exibir duas casas decimais
                'O valor total da sua compra é: R\$ ${valorFinal.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Utiliza Navigator.pop para remover a tela atual da pilha e voltar à anterior
                  Navigator.pop(context);
                },
                child: const Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}