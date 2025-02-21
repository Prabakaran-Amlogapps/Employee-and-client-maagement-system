// lib/screens/employee_list_screen.dart

import 'package:employee_client_management/employee_content/employee_components/employees_details/models/models_employee.dart';
import 'package:employee_client_management/employee_content/employee_components/employees_details/screen/employee_details.dart';
import 'package:employee_client_management/employee_content/employee_components/employees_details/screen/employee_form.dart';
import 'package:employee_client_management/employee_content/employee_components/employees_details/services/employee_services.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final StorageService _storageService = StorageService();
  List<Employee> _employees = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchEmployees();
  }

  Future<void> _fetchEmployees() async {
    try {
      setState(() => _isLoading = true);

      final request = ModelQueries.list(Employee.classType);
      final response = await Amplify.API.query(request: request).response;

      final employees = response.data?.items ?? [];

      // Load image URLs for employees with images
      final employeesWithImages = await Future.wait(
        employees.map((employee) async {
          if (employee.image != null) {
            final imageUrl =
                await _storageService.getDownloadUrl(employee.image!);
            return employee.copyWith(image: imageUrl);
          }
          return employee;
        }),
      );

      setState(() {
        _employees = employeesWithImages;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching employees: ${e.toString()}')),
      );
    }
  }

  Future<void> _deleteEmployee(Employee employee) async {
    try {
      // Delete employee image if exists
      if (employee.image != null) {
        await Amplify.Storage.remove(key: employee.image!);
      }

      // Delete employee proof document if exists
      if (employee.proofDocument != null) {
        await Amplify.Storage.remove(key: employee.proofDocument!);
      }

      // Delete employee record
      final request = ModelMutations.delete(employee);
      await Amplify.API.mutate(request: request).response;

      setState(() {
        _employees.removeWhere((e) => e.id == employee.id);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Employee deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting employee: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchEmployees,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _employees.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'No employees found',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmployeeFormScreen(),
                          ),
                        ).then((_) => _fetchEmployees()),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Employee'),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _fetchEmployees,
                  child: ListView.builder(
                    itemCount: _employees.length,
                    itemBuilder: (context, index) {
                      final employee = _employees[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: employee.image != null
                                ? NetworkImage(employee.image!)
                                : null,
                            child: employee.image == null
                                ? Text(employee.name[0])
                                : null,
                          ),
                          title: Text(employee.name),
                          subtitle: Text(employee.position),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'view',
                                child: Text('View Details'),
                              ),
                              const PopupMenuItem(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                            onSelected: (value) {
                              switch (value) {
                                case 'view':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EmployeeDetailScreen(
                                        employee: employee,
                                      ),
                                    ),
                                  );
                                  break;
                                case 'edit':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EmployeeFormScreen(
                                        employee: employee,
                                      ),
                                    ),
                                  ).then((_) => _fetchEmployees());
                                  break;
                                case 'delete':
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Employee'),
                                      content: Text(
                                        'Are you sure you want to delete ${employee.name}?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _deleteEmployee(employee);
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                  break;
                              }
                            },
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeeDetailScreen(
                                employee: employee,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EmployeeFormScreen(),
          ),
        ).then((_) => _fetchEmployees()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
