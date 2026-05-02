import 'package:flutter/material.dart';
import 'receipt_page.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  // Controlador para o campo de quantidade
  final TextEditingController _qtyController = TextEditingController();

  // Variáveis para armazenar o valor do produto e do frete
  final double _precoUnitario = 50.0;
  double _valorFrete = 10.0; // Padrão: Normal

  void _calcularETelaFinal() {
    // Converte a entrada para int, se vazio ou inválido assume 0
    int quantidade = int.tryParse(_qtyController.text) ?? 0;

    // Lógica de cálculo: (Preço * Qtd) + Frete
    double totalCalculado = (_precoUnitario * quantidade) + _valorFrete;

    // Navegação enviando a variável totalCalculado como parâmetro
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReceiptPage(valorFinal: totalCalculado),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Área de Compras')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Produto: Camiseta Flutter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('Valor Unitário 50,00'),
            const SizedBox(height: 20),
            // Campo de entrada para a quantidade com teclado numérico
            TextField(
              controller: _qtyController,
              decoration: const InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number, // Abre teclado numérico
            ),
            const SizedBox(height: 20),
            const Text('Selecione o Frete:'),
            // Opção de Frete Normal usando RadioListTile e atualizando estado
            RadioListTile<double>(
              title: const Text('Normal (R\$ 10,00)'),
              value: 10.0,
              groupValue: _valorFrete,
              onChanged: (value) {
                setState(() => _valorFrete = value!);
              },
            ),
            // Opção de Frete Expresso
            RadioListTile<double>(
              title: const Text('Expresso (R\$ 25,00)'),
              value: 25.0,
              groupValue: _valorFrete,
              onChanged: (value) {
                setState(() => _valorFrete = value!);
              },
            ),
            // Botão para calcular o total e navegar
            const Spacer(),
            // Botão para calcular o total e navegar
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tenta converter o texto. Retorna null se estiver vazio ou inválido.
                  int? quantidade = int.tryParse(_qtyController.text);

                  // Validação: se for null ou zero, exibe o erro e para por aqui.
                  if (quantidade == null || quantidade <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, insira uma quantidade válida!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return; // O 'return' interrompe a execução e impede a navegação
                  }

                  // Se passou pela validação, faz o cálculo normalmente
                  double totalCalculado = (_precoUnitario * quantidade) + _valorFrete;

                  // Navegação para a Tela 3 passando o valor calculado como parâmetro
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReceiptPage(valorFinal: totalCalculado),
                    ),
                  );
                },
                child: const Text('Calcular Total'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}