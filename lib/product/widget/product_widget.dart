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
          Text(product.id),
          Text(product.name),
          Text(product.description),
          Text(product.category.name),
          Text(product.harga.toString()),
          Text(product.image),
          TextButton(
            onPressed: (){
              
            }, 
            child: Text("Add to Cart")
          )
        ],
      ),
    );
  }
}