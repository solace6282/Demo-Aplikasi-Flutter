part of "../../global/widgets.dart";

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Constants.defaultGap),
      margin: EdgeInsets.all(Constants.defaultGap),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1)
          )
        ]
      ),
      child: Column(
        spacing: Constants.defaultGap,
        children: [
          // Text(product.id.toString()),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: "),
                  Text("Description: "),
                  Text("Product Category: "),
                  Text("Price: "),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name),
                    Text(product.description, overflow: TextOverflow.ellipsis,),
                    Text(product.category.name),
                    Text(product.harga.toString()),
                  ],
                ),
              ),
            ],
          ),
          Image.network(product.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: Constants.defaultGap,
            children: [
              TextButton(
                onPressed: (){
                  context.read<CartCubit>().addItemToCart(product);
                }, 
                child: Text("Add to Cart")
              ),
              Text("In cart: ${context.watch<CartCubit>().state.stateData.productInCart(product).count}")
            ],
          ),
        ],
      ),
    );
  }
}