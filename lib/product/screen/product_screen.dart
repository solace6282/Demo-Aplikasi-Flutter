part of "../../global/screens.dart";

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        // actionsPadding: EdgeInsets.only(right: Constants.defaultGap),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket_outlined),
            onPressed: () {
              Navigator.of(context).pushNamed(routes.cartScreen);
            },
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ProductWidget(
              product: ProductModel(
                id: index.toString(),
                name: "Product $index",
                image: "imagine_file_$index.jpg",
                description: "description number $index",
                harga: (900 * index).toDouble(),
                category: ProductCategory.values[Random.secure().nextInt(3)]
              )
            );
          },
        ),
      ),
    );
  }
}