part of "../../global/widgets.dart";

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required this.cart});

  final CartModel cart;

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
          // Text(cart.product.id.toString()),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cart.product.name),
                  Text(cart.product.description, overflow: TextOverflow.ellipsis,),
                  Text(cart.product.category.name),
                  Text(cart.product.harga.toString()),
                ],
              ),
            ],
          ),
          Image.network(cart.product.image),
          Text("In cart: ${cart.count.toString()}"),
          Text("Total: ${cart.total}"),
          Row(
            spacing: Constants.defaultGap,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: (){
                  context.read<CartCubit>().addItemToCart(cart.product);
                }, 
                child: Text("Add more")
              ),
              TextButton(
                onPressed: (){
                  context.read<CartCubit>().deleteItemFromCart(cart.product);
                }, 
                child: Text("Delete one from Cart")
              ),
            ],
          ),
        ],
      ),
    );
  }
}