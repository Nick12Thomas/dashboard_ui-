import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0), // Reduced a bit for better mobile spacing
      child: LayoutBuilder(
        builder: (context, constraints) {
          // If the width is less than 600, stack items vertically
          bool isNarrow = constraints.maxWidth < 600;

          return isNarrow
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Home",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              buildSearchField(context),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Home",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(child: buildSearchField(context)),
            ],
          );
        },
      ),
    );
  }

  Widget buildSearchField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF301934),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white,
          size: 21,
        ),
      ),
    );
  }
}