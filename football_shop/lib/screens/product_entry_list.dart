import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/screens/product_detail.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool isMyProducts;
  const ProductEntryListPage({super.key, this.isMyProducts = false});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    // Ubah URL ke endpoint JSON Django kamu
    String url;

    if (widget.isMyProducts) {
      url = 'http://localhost:8000/json/my-products';
    } else {
      // URL untuk semua produk
      url = 'http://localhost:8000/json/';
    }

    final response = await request.get(url);

    List<ProductEntry> listProducts = [];

    for (var d in response) {
      if (d != null) {
        listProducts.add(ProductEntry.fromJson(d));
      }
    }

    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        // Ubah judul berdasarkan mode filter
        title: Text(widget.isMyProducts ? 'My Products' : 'All Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.isMyProducts
                        ? 'You have not added any products yet.'
                        : 'There are no products available yet.',
                    style:
                        const TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}

