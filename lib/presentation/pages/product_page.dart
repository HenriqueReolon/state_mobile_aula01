import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product {
  final String name;
  final double price;
  bool favorite;

  Product({
    required this.name,
    required this.price,
    this.favorite = false,
  });
}

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(name: 'Memória RAM SODIMM 512MB', price: 3499.99),
    Product(name: 'Processador AMD Athlon', price: 8599.99),
    Product(name: 'Monitor ITAU TEC', price: 2099.99),
    Product(name: 'Kit teclado e mouse gamer KNUPP', price: 849.99),
  ];

  List<Product> get products => _products;

  void toggleFavorite(int index) {
    _products[index].favorite = !_products[index].favorite;
    notifyListeners();
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Produtos'),
        ),
        body: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                final product = provider.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(
                      product.favorite ? Icons.favorite : Icons.favorite_border,
                      color: product.favorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      provider.toggleFavorite(index);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
