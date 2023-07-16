import 'package:flutter/material.dart';

class DiscoverCards extends StatefulWidget {
  const DiscoverCards({super.key});

  @override
  State<DiscoverCards> createState() => _DiscoverCardsState();
}

class _DiscoverCardsState extends State<DiscoverCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 190,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(21),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
