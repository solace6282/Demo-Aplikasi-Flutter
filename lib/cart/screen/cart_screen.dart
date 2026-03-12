part of "../../global/screens.dart";

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        // actionsPadding: EdgeInsets.only(right: Constants.defaultGap),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 232, 250),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: "),
                      Text("Email: "),
                      Text("Address: "),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.read<CartCubit>().state.stateData.userDetail.name),
                      Text(context.read<CartCubit>().state.stateData.userDetail.email),
                      Text(context.read<CartCubit>().state.stateData.userDetail.address),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.stateData.cart.length,
                    itemBuilder: (context, index) {
                      return CartWidget(
                        cart: state.stateData.cart[index],
                      );
                    },
                  );
                },
              ),
            ),
            BlocListener<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartFailed){
                  final message = switch (state.error) {
                    CartError.noItems => "Masukkan minimal satu item",
                  };
                  GlobalDialog.showError(context, message);
                  return;
                }

                if (state is CartSuccess){
                  GlobalDialog.showSuccess(context, 'Anda berhasil membuat pesanan')
                    .then((value) {
                      dev.log("message");
                      if (!context.mounted) return;
                      context.read<CartCubit>().reset();
                      Navigator.of(context).pop();
                    },);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 2, offset: Offset(-1, 0))],
                ),
                width: double.infinity,
                padding: EdgeInsets.all(Constants.defaultGap),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Grand total: ${context.watch<CartCubit>().state.stateData.total}"),
                    TextButton(
                      onPressed: () {
                        context.read<CartCubit>().submit();
                      }, 
                      child: Text("Checkout"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
