import 'package:flutter/material.dart';
import 'package:test_order_life_cycle/core/shared_widgets/salem_drawer/drawer_widget.dart';

class Homedelivery extends StatelessWidget {
  const Homedelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: const Center(
        child: Text("Home"),
      ),
      drawer: const KDrawerWidget(),
    );
  }
}
