import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_route_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Search'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewRoutePage(),
                ),
              );
            },
            child: const Text(
              'Goto New Route',
            ),
          ),
        ],
      ),
    );
  }
}
