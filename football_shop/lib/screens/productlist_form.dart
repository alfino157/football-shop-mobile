import 'package:flutter/material.dart';
import 'package:football_shop/screens/product_entry_list.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  // === Deklarasi variabel form ===
  String _name = "";
  String _brand = "";
  String _description = "";
  String _category = "Shoes"; // default
  String _thumbnail = "";
  double _price = 0;
  int _stock = 0;
  bool _isFeatured = false;

  final List<String> _categories = [
    'Shorts',
    'Ball',
    'Shoes',
    'Shirts',
    'Hoodies',
    'Socks',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Add Product")),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    hintText: "Enter product name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => setState(() => _name = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Product name can't be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // === Brand ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Brand",
                    hintText: "e.g., Adidas, Nike",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => setState(() => _brand = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Brand can't be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Description",
                    hintText: "Enter product description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => setState(() => _description = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description can't be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // === Category ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(cat),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "URL Thumbnail",
                    hintText: "https://contoh.com/gambar.jpg",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => setState(() => _thumbnail = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "URL thumbnail can't be empty!";
                    } else if (!Uri.tryParse(value)!.hasAbsolutePath) {
                      return "Format URL isn't valid!";
                    }
                    return null;
                  },
                ),
              ),

              // === Price ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Price",
                    hintText: "Enter product price (Rp)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _price = double.tryParse(value) ?? 0;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Price can't be empty!";
                    }
                    final price = double.tryParse(value);
                    if (price == null || price <= 0) {
                      return "Price must be a positive number!";
                    }
                    return null;
                  },
                ),
              ),

              // === Stock ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Stock",
                    hintText: "Enter product stock",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _stock = int.tryParse(value) ?? 0;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Stock can't be empty!";
                    }
                    final stock = int.tryParse(value);
                    if (stock == null || stock < 0) {
                      return "Stock must be a postitive number!";
                    }
                    return null;
                  },
                ),
              ),

              // === Is Featured ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Mark as featured"),
                  value: _isFeatured,
                  onChanged: (value) {
                    setState(() => _isFeatured = value);
                  },
                ),
              ),

              // === Tombol Save ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.postJson(
                          // Gunakan URL sesuai platform (chrome vs emulator)
                          "http://localhost:8000/create-flutter/",
                          jsonEncode({
                            "name": _name,
                            "brand": _brand,
                            "description": _description,
                            "category": _category,
                            "thumbnail": _thumbnail,
                            "price": _price.toInt(),
                            "stock": _stock,
                            "is_featured": _isFeatured,
                          }),
                        );

                        if (!mounted) return;

                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Product successfully saved!")),
                          );

                          // Setelah selesai create → kembali ke ProductList & refresh
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductEntryListPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Something went wrong, please try again."),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
