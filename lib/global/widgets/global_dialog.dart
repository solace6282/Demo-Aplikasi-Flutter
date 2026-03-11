part of '../widgets.dart';

class GlobalDialog extends StatelessWidget {
  const GlobalDialog({super.key, required this.center, required this.title, required this.subtitle});

  final Widget center;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          center,
          Text(title),
          Text(subtitle)
        ],
      ),
    );
  }

  Future<T?> show<T>(
    BuildContext context, {
      bool dismissable = false,
    }
  ) async {
    return await showDialog<T>(
      barrierDismissible: dismissable || kDebugMode,
      useRootNavigator: true,
      context: context, 
      builder: build
    );
  }

  static void showLoading(BuildContext context) {
    GlobalDialog(
      center: CircularProgressIndicator(),
      subtitle: "Sistem sedang memproses",
      title: "Memuat...",
    ).show(context);
  }

  static void showError(BuildContext context, String message) {
    GlobalDialog(
      center: Icon(Icons.warning_rounded),
      subtitle: message,
      title: "Error",
    ).show(context);
  }
}