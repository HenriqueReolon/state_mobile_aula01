
import 'package:flutter/material.dart';
import 'product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Produtos"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProductPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
