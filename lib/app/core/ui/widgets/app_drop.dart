import 'package:flutter/material.dart';

class AppDrop<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? items;
  final String label;
  final void Function(T?)? onChanged;
  const AppDrop({
    Key? key,
    required this.items,
    required this.onChanged,
    this.label = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[400]!),
            color: Colors.white,

          ),
          child: DropdownButton<T>(
            items: items,
            hint: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  label
              ),
            ),
            underline: const SizedBox(),
            isExpanded: true,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
