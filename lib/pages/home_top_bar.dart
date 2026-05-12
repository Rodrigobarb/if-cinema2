import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Olá, Aluno'),
                SizedBox(height: 2.0),
                Row(
                  children: [
                    Text('Passo Fundo'),
                    SizedBox(width: 4.0),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF2A2A2A),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.chevron_right),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 44.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: Color(0xFF2A2A2A),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.search),
            ),
          ),
          SizedBox(width: 12.0),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 44.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: Color(0xFF2A2A2A),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}
