import 'package:flutter/material.dart';

class PlansCards extends StatelessWidget {
  const PlansCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shadowColor: Colors.grey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),      
      ),
    
      child: Container(
        width: 180,
        height: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emoji
            const Text("🚗", style: TextStyle(fontSize: 36)),
            const SizedBox(height: 12),

            // Title
            const Text(
              "Car Insurance",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Description
            const Text(
              "Comprehensive coverage for your vehicle.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
