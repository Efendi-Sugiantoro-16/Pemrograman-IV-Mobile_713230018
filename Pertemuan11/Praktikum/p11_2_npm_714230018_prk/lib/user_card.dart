import 'package:flutter/material.dart';
import 'user.dart';

class UserCard extends StatelessWidget {
  final UserCreate usrCreate;
  
  const UserCard({super.key, required this.usrCreate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), 
        color: Colors.lightBlue[200]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('ID', usrCreate.id.toString()),
          _buildInfoRow('Name', usrCreate.name),
          _buildInfoRow('Job', usrCreate.job),
          if (usrCreate.createdAt != null)
            _buildInfoRow('Created At', usrCreate.createdAt.toString()),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}