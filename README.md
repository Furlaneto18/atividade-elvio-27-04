# Protótipo de Aplicativo de Vendas - Loja de Vestuário 🛒📱

Este é um projeto prático de desenvolvimento mobile com Flutter, focado em implementar rotas de navegação, passagem de parâmetros dinâmicos entre telas e construção de interfaces reativas.

## 🎯 Objetivo da Atividade
Desenvolver o protótipo inicial de um aplicativo de vendas de vestuário utilizando o Android Studio. O foco é a fixação prática de conceitos fundamentais como `Navigator.push`, `Navigator.pop`, gerenciamento de formulários com `TextEditingController` e transição de estados.

## 📂 Estrutura do Projeto
O fluxo do aplicativo é dividido em três telas principais, contidas no diretório `lib/`:

1. **`login_page.dart`**: Tela de Autenticação. Exige o preenchimento de usuário (`admin`) e senha (`123` - oculta) para prosseguir. Emite avisos visuais (`SnackBar`) em caso de credenciais incorretas.
2. **`shopping_page.dart`**: Área de Compras (`StatefulWidget`). Apresenta o produto, permite a entrada numérica da quantidade desejada, fornece opções de frete (Normal ou Expresso) gerenciadas via `setState` e realiza o cálculo final da compra.
3. **`receipt_page.dart`**: Recibo de Pedido. Recebe o valor total como um parâmetro obrigatório no construtor e exibe o valor formatado, permitindo ao usuário voltar à tela anterior fechando a atual.

## 🚀 Como Executar
1. Certifique-se de ter o [Flutter](https://flutter.dev/docs/get-started/install) e o [Android Studio](https://developer.android.com/studio) instalados.
2. Clone ou extraia este projeto em seu diretório local.
3. Abra a pasta do projeto no Android Studio.
4. Execute o comando `flutter pub get` no terminal para baixar as dependências.
5. Selecione o emulador configurado e clique no botão de "Run" (ou pressione `Shift + F10`).