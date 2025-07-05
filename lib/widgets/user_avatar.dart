import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String name;
  final String? imageUrl;

  const UserAvatar({super.key, required this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: imageUrl != null
              ? ClipOval(
                  child: Image.network(
                    imageUrl!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                )
              : Text(
                  name.isNotEmpty ? name[0].toUpperCase() : '?',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
