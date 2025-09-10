import 'package:flutter/material.dart';
import '../API/api_provider.dart';
import '../models/products_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.selectedCategory});

  final String selectedCategory;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Products productInUI;
  bool isLoading = true;

  List<Product> filteredProducts = [];

  getDataFromApiProvider() async {
    productInUI = await ApiProvider().getProductsFromApi();

    filteredProducts = productInUI.products
        .where((product) => product.category == widget.selectedCategory)
        .toList();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getDataFromApiProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 247, 246),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 158, 123, 115),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.selectedCategory.toUpperCase(),
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Arial",
                        color: Color.fromARGB(255, 151, 119, 102),
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(5, 5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),

                    for (var product in filteredProducts)
                      Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: const Color.fromARGB(255, 248, 239, 236),
                        child: ListTile(
                          leading: Image.network(
                            product.thumbnail,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            product.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${product.price}"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        253,
                                        155,
                                        132,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "ADD TO CART",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
