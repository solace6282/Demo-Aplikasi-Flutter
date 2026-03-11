part of '../widgets.dart';

class LabelTextfield extends StatelessWidget {
  const LabelTextfield({super.key, required this.label, required this.onChanged, this.obscure = false});

  final String label;
  final Function(String value) onChanged;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: Constants.defaultGap,),
        TextField(
          obscureText: obscure,
          onChanged: onChanged,
        )
      ],
    );
  }
}