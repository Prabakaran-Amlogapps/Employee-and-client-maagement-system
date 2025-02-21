// lib/screens/employee_detail_screen.dart

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:employee_client_management/employee_content/employee_components/employees_details/models/models_employee.dart';
import 'package:employee_client_management/employee_content/employee_components/employees_details/screen/employee_form.dart';
import 'package:employee_client_management/employee_content/employee_components/employees_details/services/employee_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeDetailScreen extends StatefulWidget {
  final Employee employee;

  const EmployeeDetailScreen({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  _EmployeeDetailScreenState createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  final StorageService _storageService = StorageService();
  String? _proofDocumentUrl;
  bool _isLoadingProof = false;

  @override
  void initState() {
    super.initState();
    _loadProofDocument();
  }

  Future<void> _loadProofDocument() async {
    if (widget.employee.proofDocument != null) {
      setState(() => _isLoadingProof = true);
      try {
        final url = await _storageService
            .getDownloadUrl(widget.employee.proofDocument!);
        setState(() {
          _proofDocumentUrl = url;
          _isLoadingProof = false;
        });
      } catch (e) {
        setState(() => _isLoadingProof = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error loading proof document: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _deleteEmployee() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Employee'),
        content:
            Text('Are you sure you want to delete ${widget.employee.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed ?? false) {
      try {
        // Delete employee image if exists
        if (widget.employee.image != null) {
          await _storageService.deleteFile(widget.employee.image!);
        }

        // Delete proof document if exists
        if (widget.employee.proofDocument != null) {
          await _storageService.deleteFile(widget.employee.proofDocument!);
        }

        // Delete employee record
        final request = ModelMutations.delete(widget.employee);
        await Amplify.API.mutate(request: request).response;

        Navigator.of(context).pop(true); // Return true to indicate deletion
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting employee: ${e.toString()}')),
        );
      }
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeFormScreen(
                    employee: widget.employee,
                  ),
                ),
              ).then((value) {
                if (value == true) {
                  Navigator.pop(context, true); // Refresh list
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteEmployee,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            if (widget.employee.image != null)
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.employee.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Basic Information
                  Text(
                    widget.employee.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.employee.position,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const Divider(height: 32),

                  // Detailed Information
                  _buildInfoRow(
                    'Joining Date',
                    DateFormat('dd MMM yyyy')
                        .format(widget.employee.dateOfJoining),
                  ),
                  _buildInfoRow('Gender', widget.employee.gender),
                  _buildInfoRow(
                    'Salary',
                    NumberFormat.currency(symbol: '\$')
                        .format(widget.employee.salary),
                  ),
                  _buildInfoRow('Mobile', widget.employee.mobileNumber),

                  const Divider(height: 32),

                  // Address Information
                  const Text(
                    'Address Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildInfoRow('Current', widget.employee.currentAddress),
                  if (!widget.employee.sameAsAbove)
                    _buildInfoRow(
                        'Permanent', widget.employee.permanentAddress),
                  if (widget.employee.sameAsAbove)
                    const Text(
                      'Permanent address same as current address',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),

                  const Divider(height: 32),

                  // Proof Document
                  const Text(
                    'Proof Document',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  if (_isLoadingProof)
                    const Center(child: CircularProgressIndicator())
                  else if (_proofDocumentUrl != null)
                    Card(
                      child: InkWell(
                        onTap: () {
                          // Open document in full screen or download
                          // Implementation depends on your requirements
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              const Icon(Icons.description),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Text('View Document'),
                              ),
                              const Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    const Text(
                      'No proof document uploaded',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
