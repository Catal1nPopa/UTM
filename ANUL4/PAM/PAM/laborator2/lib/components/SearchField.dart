import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon:
              const Icon(Icons.search, color: Color.fromARGB(255, 8, 8, 8)),
          suffixIcon: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("|", style: TextStyle(color: Colors.grey)),
              SizedBox(width: 6),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.mic_none_outlined,
                    color: Color.fromARGB(255, 5, 5, 5)),
              ),
            ],
          ),
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 214, 209, 209),
            ),
          ),
        ),
      ),
    );
  }
}
