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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<LoginCubit>().logout().then((value) {
            if (context.mounted) Navigator.of(context).pushNamedAndRemoveUntil(routes.loginScreen, (route) => false,);
          },);
        },
        child: Icon(Icons.logout),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 232, 250),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: Constants.defaultGap,
                    children: [
                      Text("Filter by: "),
                      BlocBuilder<ProductCubit, ProductState>(
                        builder: (context, state) {
                          return DropdownButton<ProductCategory>(
                            items: ProductCategory.values.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e.name),
                              );
                            },).toList(), 
                            value: state.stateData.filter,
                            onChanged: (value) {
                              context.read<ProductCubit>().filter(value);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<ProductCubit>().filter();
                    }, 
                    child: Text("Reset")
                  )
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.stateData.shown.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        product: state.stateData.shown[index]
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}