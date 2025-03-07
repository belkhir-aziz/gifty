import 'package:flutter/material.dart';

class FancyNotificationBanner extends StatelessWidget {
  final String message;
  final bool isError;
  final IconData icon;

  const FancyNotificationBanner({
    super.key,
    required this.message,
    this.isError = false,
    this.icon = Icons.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isError ? Colors.redAccent : Colors.greenAccent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
        gradient: LinearGradient(
          colors: isError
              ? [Colors.red.shade400, Colors.red.shade900]
              : [Colors.green.shade400, Colors.green.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
