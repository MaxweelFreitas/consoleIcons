import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Widget logo;
  final String logoName;
  final int index;
  const DetailsPage({
    super.key,
    required this.logo,
    required this.logoName,
    required this.index,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.logoName)),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Hero(
                tag: widget.index,
                child: widget.logo,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
