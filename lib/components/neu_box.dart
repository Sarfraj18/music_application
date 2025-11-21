import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  const NeuBox({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        boxShadow: [
          // darker shadow on bottom right
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(5,5)

          ),
          // lighter shadow on top left

          BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: const Offset(-5,-5)

          )
        ]
      ),
      padding: EdgeInsets.all(15),
      child: child,


    );

  }
}
