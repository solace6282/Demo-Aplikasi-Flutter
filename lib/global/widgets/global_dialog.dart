part of '../widgets.dart';

class GlobalDialog<T> extends StatelessWidget {
  const GlobalDialog({super.key, required this.center, required this.title, required this.subtitle});

  final Widget center;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          center,
          SizedBox(height: 24,),
          Text(title, style: TextStyle(fontSize: 16),),
          Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey),)
        ],
      ),
    );
  }

  Future<T?> show(
    BuildContext context, {
      bool dismissable = false,
    }
  ) async {
    return await showDialog<T>(
      barrierDismissible: dismissable || kDebugMode,
      useRootNavigator: true,
      context: context, 
      fullscreenDialog: false,
      builder: (context) => Dialog(child: build(context),),
    );
  }

  static Future<T?> showLoading<T>(BuildContext context) async {
    return await GlobalDialog<T>(
      center: CircularProgressIndicator(),
      subtitle: "Sistem sedang memproses",
      title: "Memuat...",
    ).show(context);
  }

  static Future<T?> showError<T>(BuildContext context, String message) async {
    return await GlobalDialog<T>(
      center: Icon(Icons.warning_rounded, size: 100,),
      subtitle: message,
      title: "Error",
    ).show(context, dismissable: true);
  }

  static Future<T?> showSuccess<T>(BuildContext context, String message) async {
    return await GlobalDialog<T>(
      center: Icon(Icons.check, color: Colors.green, size: 100,),
      subtitle: message,
      title: "Success",
    ).show(context, dismissable: true);
  }
}