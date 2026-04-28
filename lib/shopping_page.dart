import 'package:flutter/material.dart';
import 'receipt_page.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final TextEditingController _qtyController = TextEditingController();

  // Valores fixos
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
            TextField(
              controller: _qtyController,
              decoration: const InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number, // Abre teclado numérico
            ),
            const SizedBox(height: 20),
            const Text('Selecione o Frete:'),
            // Opções de rádio para o frete
            RadioListTile<double>(
              title: const Text('Normal (R\$ 10,00)'),
              value: 10.0,
              groupValue: _valorFrete,
              onChanged: (value) {
                setState(() => _valorFrete = value!);
              },
            ),
            RadioListTile<double>(
              title: const Text('Expresso (R\$ 25,00)'),
              value: 25.0,
              groupValue: _valorFrete,
              onChanged: (value) {
                setState(() => _valorFrete = value!);
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _calcularETelaFinal,
                child: const Text('Calcular Total'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}