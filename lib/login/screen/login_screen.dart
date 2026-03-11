part of "../../global/screens.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading){
            
          }
          if (state is LoginFailed){
            // pop loading dialog
            // show error message
          }
          if (state is LoginSuccess){
            // pop loading dialog
            // navigate to product screen
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(Constants.defaultGap),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: Constants.defaultGap * 2,
              children: [
                LabelTextfield(
                  label: 'Email', 
                  onChanged: (value) {
                    context.read<LoginCubit>().update(email: value);
                  },
                ),
                LabelTextfield(
                  obscure: true,
                  label: 'Password', 
                  onChanged: (value) {
                    context.read<LoginCubit>().update(password: value);
                  },
                ),
                TextButton(
                  onPressed: context.read<LoginCubit>().login,
                  child: Text("Login")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}