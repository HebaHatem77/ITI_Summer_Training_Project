import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iti_project/layout/product_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../API/api_provider.dart';
import '../models/products_model.dart';
import '../widget/build_item_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Products productInUI;
  bool isLoading = true;

  final Map<String, IconData> categoryIcons = {
    "beauty": FontAwesomeIcons.spa,
    "fragrances": FontAwesomeIcons.sprayCan,
    "furniture": FontAwesomeIcons.couch,
    "groceries": FontAwesomeIcons.breadSlice,
  };

  getDataFromApiProvider() async {
    productInUI = await ApiProvider().getProductsFromApi();

    print("Product count: ${productInUI.products.length}");
    print("First product title: ${productInUI.products[0].title}");

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromApiProvider();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Center(
            child: CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 158, 123, 115),
              ),
            ),
          )
        : SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 239, 228, 227),
                    Color.fromARGB(255, 253, 250, 249),
                  ],
                ),
              ),
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Color.fromARGB(255, 243, 220, 210),
                    width: double.infinity,
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Text(
                          "Unique Mall",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontFamily: "cursive",
                            color: Colors.grey[800],
                            shadows: [
                              Shadow(
                                color: Colors.white,
                                offset: Offset(5, 5),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Search",
                              hintText: "Enter the category",
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Robot",
                        color: Color.fromARGB(255, 158, 123, 115),
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(5, 5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3,
                    children: [
                      for (var category
                          in productInUI.products
                              .map((p) => p.category)
                              .toSet())
                        Container(
                          padding: EdgeInsets.only(top: 15, bottom: 2),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 241, 238),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(
                                categoryIcons[category] ?? FontAwesomeIcons.box,
                                size: 30,
                                color: Color.fromARGB(255, 251, 199, 186),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductScreen(
                                        selectedCategory: category,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  category.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    // width: double.infinity,
                    child: Text(
                      "Popular Items",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Robot",
                        color: Color.fromARGB(255, 158, 123, 115),
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            offset: Offset(5, 5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (isLoading)
                    Center(
                      child: CircularProgressIndicator(
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 158, 123, 115),
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 1,
                        horizontal: 10.0,
                      ),
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        children: [
                          for (int i = 7; i < productInUI.products.length; i++)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              margin: const EdgeInsets.only(
                                top: 1,
                                bottom: 7,
                                left: 7,
                                right: 7,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 255, 255, 255),
                                    Color.fromARGB(255, 248, 240, 236),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: BuildItemWidget(
                                  name: productInUI.products[i].title,
                                  message: productInUI.products[i].category,
                                  date: productInUI.products[i].price
                                      .toString(),
                                  photo: productInUI.products[i].thumbnail,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
  }
}
