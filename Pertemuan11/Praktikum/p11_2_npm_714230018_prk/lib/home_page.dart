import 'package:flutter/material.dart';
import 'user.dart';
import 'data_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataService _dataService = DataService();
  final _formKey = GlobalKey<FormState>();
  final _nameCtl = TextEditingController();
  final _jobCtl = TextEditingController();
  String _result = '-';
  List<User> _users = [];
  UserCreate? _usCreate;

  @override
  void dispose() {
    _nameCtl.dispose();
    _jobCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API (DIO)'),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Name Field
                TextField(
                  controller: _nameCtl,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Name',
                    suffixIcon: IconButton(
                      onPressed: _nameCtl.clear,
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                
                // Job Field
                TextField(
                  controller: _jobCtl,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Job',
                    suffixIcon: IconButton(
                      onPressed: _jobCtl.clear,
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),

                // Action Buttons Row 1
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () async {
                            try {
                              final res = await _dataService.getUsers();
                              setState(() {
                                _result = res?.toString() ?? 'No data received';
                                _users = []; // Clear user list when showing raw response
                              });
                            } catch (e) {
                              setState(() => _result = 'Error: ${e.toString()}');
                            }
                          },
                          child: const Text('GET'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[600],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () async {
                            if (_nameCtl.text.isEmpty || _jobCtl.text.isEmpty) {
                              displaySnackbar('Semua field harus diisi');
                              return;
                            }
                            try {
                              final res = await _dataService.postUser(
                                  _nameCtl.text, _jobCtl.text);
                              if (res != null) {
                                setState(() {
                                  _result = '{\n  "name": "${_nameCtl.text}",\n  "job": "${_jobCtl.text}",\n  "id": "${res['id']}",\n  "createdAt": "${res['createdAt']}"\n}';
                                  _usCreate = UserCreate.fromJson({
                                    'id': res['id'],
                                    'name': _nameCtl.text,
                                    'job': _jobCtl.text,
                                    'createdAt': res['createdAt']
                                  });
                                });
                                
                                _nameCtl.clear();
                                _jobCtl.clear();
                                displaySnackbar('User created successfully!');
                              } else {
                                setState(() => _result = 'Failed to create user');
                              }
                            } catch (e) {
                              setState(() => _result = 'Error: ${e.toString()}');
                              debugPrint('Error in POST: $e');
                            }
                          },
                          child: const Text('POST'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),

                // Action Buttons Row 2
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[600],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () async {
                            if (_nameCtl.text.isEmpty || _jobCtl.text.isEmpty) {
                              displaySnackbar('Semua field harus diisi');
                              return;
                            }
                            try {
                              final res = await _dataService.putUser(
                                  '1', _nameCtl.text, _jobCtl.text);
                              if (res != null) {
                                setState(() {
                                  _result = '{\n  "name": "${_nameCtl.text}",\n  "job": "${_jobCtl.text}",\n  "updatedAt": "${res['updatedAt']}"\n}';
                                  displaySnackbar('User updated successfully!');
                                });
                                _nameCtl.clear();
                                _jobCtl.clear();
                              } else {
                                setState(() => _result = 'Failed to update user');
                              }
                            } catch (e) {
                              setState(() => _result = 'Error: ${e.toString()}');
                            }
                          },
                          child: const Text('PUT'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[600],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () async {
                            try {
                              final res = await _dataService.deleteUser('1');
                              setState(() {
                                _result = res?.toString() ?? 'User deleted successfully';
                                displaySnackbar('User deleted successfully!');
                              });
                            } catch (e) {
                              setState(() => _result = 'Error: ${e.toString()}');
                            }
                          },
                          child: const Text('DELETE'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),

                // Model Class and Reset Buttons Row
                Row(
                  children: [
                    // Model Class Button
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan[600],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () async {
                            try {
                              final users = await _dataService.getUserModel();
                              setState(() {
                                _users = users?.toList() ?? [];
                                _result = _users.isNotEmpty ? 'Found ${_users.length} users' : 'No users found';
                              });
                            } catch (e) {
                              setState(() => _result = 'Error: ${e.toString()}');
                            }
                          },
                          child: const Text('Model Class User Example'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    // Reset Button
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0, bottom: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 2,
                        ),
                        onPressed: () {
                          setState(() {
                            _users = [];
                            _result = '-';
                            _nameCtl.clear();
                            _jobCtl.clear();
                            _usCreate = null;
                          });
                        },
                        child: const Text('Reset'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                // Result Section
                const Text(
                  'Result',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),

                // Display Result or User List
                _users.isEmpty
                    ? hasilCard(context)
                    : _buildListUser(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Extract value from the response string
  String _extractValue(String response, String key) {
    try {
      // Handle the case where the response is already in the format we want
      if (response.contains('$key:')) {
        final start = response.indexOf('$key:') + key.length + 1;
        var end = response.indexOf(',', start);
        if (end == -1) end = response.indexOf('}', start);
        if (end == -1) end = response.length;
        return response.substring(start, end).trim();
      }
      
      // Handle the case where the response is in JSON format
      final start = response.indexOf('{');
      final end = response.lastIndexOf('}');
      if (start == -1 || end == -1) return 'N/A';
      
      // Extract and clean the content
      var content = response.substring(start + 1, end).trim();
      content = content.replaceAll('{', '').replaceAll('}', '');
      
      // Split by comma and find the key-value pair
      final pairs = content.split(',');
      for (var pair in pairs) {
        final parts = pair.split(':');
        if (parts.length >= 2) {
          var currentKey = parts[0].trim().replaceAll('"', '');
          if (currentKey == key) {
            return parts.sublist(1).join(':').trim().replaceAll('"', '');
          }
        }
      }
      return 'N/A';
    } catch (e) {
      debugPrint('Error extracting value: $e');
      return 'N/A';
    }
  }

  Widget _buildUserDetailCard() {
    try {
      // Extract values from the response
      final id = _extractValue(_result, 'id') == 'N/A' ? 'N/A' : _extractValue(_result, 'id');
      final name = _extractValue(_result, 'name') == 'N/A' ? 'N/A' : _extractValue(_result, 'name');
      final job = _extractValue(_result, 'job') == 'N/A' ? 'N/A' : _extractValue(_result, 'job');
      var createdAt = _extractValue(_result, 'createdAt');
      if (createdAt == 'N/A') {
        // Try to get updatedAt if createdAt is not available
        createdAt = _extractValue(_result, 'updatedAt');
      }
      
      // Format the date if it's in ISO format
      String formattedDate = createdAt;
      final date = DateTime.tryParse(createdAt);
      if (date != null) {
        formattedDate = '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')} ${date.hour < 12 ? 'AM' : 'PM'}';
      }

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 16.0),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.blue[100]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('ID', id),
            const SizedBox(height: 8.0),
            _buildDetailRow('Name', name),
            const SizedBox(height: 8.0),
            _buildDetailRow('Job', job),
            const SizedBox(height: 8.0),
            _buildDetailRow('Created At', formattedDate),
          ],
        ),
      );
    } catch (e) {
      // If parsing fails, return an empty container
      return const SizedBox.shrink();
    }
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            '$label :',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget hasilCard(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _result == '-'
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 48.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'No data to display',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Try making a request or check your connection',
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Response:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: SelectableText(
                      _result,
                      style: const TextStyle(fontFamily: 'monospace'),
                    ),
                  ),
                  _buildUserDetailCard(),
                ],
              ),
      ),
    );
  }

  Widget _buildListUser() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _users.length,
      itemBuilder: (context, index) {
        final user = _users[index];
        return Card(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(user.avatar),
            ),
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Text(user.email),
          ),
        );
      },
    );
  }

  void displaySnackbar(String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }
}