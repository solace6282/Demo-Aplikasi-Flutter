part of "../../global/screens.dart";

class CheckTokenScreen extends StatefulWidget {
  const CheckTokenScreen({super.key});

  @override
  State<CheckTokenScreen> createState() => _CheckTokenScreenState();
}

class _CheckTokenScreenState extends State<CheckTokenScreen> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CheckTokenCubit>().checkToken();
    },);
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckTokenCubit, CheckTokenState>(
      listener: (context, state) {
        if (state is CheckTokenExists){
          context.read<ProductCubit>().getProducts();
          context.read<CartCubit>().updateUser(state.user);
          Navigator.of(context).pushNamedAndRemoveUntil(routes.productScreen, (route) => false,);
        }

        if (state is CheckTokenNotExist){
          Navigator.of(context).pushNamedAndRemoveUntil(routes.loginScreen, (route) => false,);
        }
      },
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}