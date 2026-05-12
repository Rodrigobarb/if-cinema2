import 'package:flutter/material.dart';
import 'package:myapp/pages/home_top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HomeTopBar()],
          ),
        ),
      ),
    );
  }
}
