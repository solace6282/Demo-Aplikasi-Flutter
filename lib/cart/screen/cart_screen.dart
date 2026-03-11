part of "../../global/screens.dart";

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
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
        child: Column(
          children: [
            Expanded(
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: Offset(-1, 0)
                  )
                ]
              ),
              width: double.infinity,
              padding: EdgeInsets.all(Constants.defaultGap),
              child: Text("xdd"),
            )
          ],
        ),
      ),
    );
  }
}