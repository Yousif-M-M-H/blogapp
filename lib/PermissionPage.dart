import 'dart:convert';

import 'package:blogapp/Widgets/CheckBox.dart';
import 'package:blogapp/Widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomerPermissionPage extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;

  const CustomerPermissionPage({
    Key? key,
    required this.name,
    required this.email,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<CustomerPermissionPage> createState() => _CustomerPermissionPageState();
}

// view create update delete
class _CustomerPermissionPageState extends State<CustomerPermissionPage> {
  bool viewCustomerChecked = false;
  bool createCustomerChecked = false;
  bool editCustomerChecked = false;
  bool deleteCustomerChecked = false;

  bool viewSuppliersChecked = false;
  bool createSuppliersChecked = false;
  bool editSuppliersChecked = false;
  bool deleteSuppliersChecked = false;

  bool viewInvoicesChecked = false;
  bool createInvoicesChecked = false;
  bool editInvoicesChecked = false;
  bool deleteInvoicesChecked = false;

  bool selectAllChecked = false;
  bool selectAllSuppliersChecked = false;
  bool selectAllInvoicesChecked = false;

  void _printSelectedPermissions() {
    final Map<String, dynamic> permissions = {
      'name': widget.name,
      'email': widget.email,
      'phoneNumber': widget.phoneNumber,
      'viewCustomer': viewCustomerChecked,
      'createCustomer': createCustomerChecked,
      'editCustomer': editCustomerChecked,
      'deleteCustomer': deleteCustomerChecked,
      'viewSuppliers': viewSuppliersChecked,
      'createSuppliers': createSuppliersChecked,
      'editSuppliers': editSuppliersChecked,
      'deleteSuppliers': deleteSuppliersChecked,
      'viewInvoices': viewInvoicesChecked,
      'createInvoices': createInvoicesChecked,
      'editInvoices': editInvoicesChecked,
      'deleteInvoices': deleteInvoicesChecked,
    };

    final jsonString = jsonEncode(permissions);
    print(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              "Customer",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Checkbox(
                          value: selectAllChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              selectAllChecked = value ?? false;
                              viewCustomerChecked = selectAllChecked;
                              createCustomerChecked = selectAllChecked;
                              deleteCustomerChecked = selectAllChecked;
                              editCustomerChecked = selectAllChecked;
                            });
                          },
                          checkColor: Colors.white,
                        ),
                      ],
                    ),
                    PermissionTile(
                      title: "View Customer",
                      checked: viewCustomerChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          viewCustomerChecked = value ?? false;
                        });
                      },
                    ),
                    PermissionTile(
                      title: "Create Customer",
                      checked: createCustomerChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          createCustomerChecked = value ?? false;
                        });
                      },
                    ),
                    PermissionTile(
                      title: "Delete Customer",
                      checked: deleteCustomerChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          deleteCustomerChecked = value ?? false;
                        });
                      },
                    ),
                    PermissionTile(
                      title: "Edit Customer",
                      checked: editCustomerChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          editCustomerChecked = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.business_sharp,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              "Suppliers",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Checkbox(
                          value: selectAllSuppliersChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              selectAllSuppliersChecked = value ?? false;
                              viewSuppliersChecked = selectAllSuppliersChecked;
                              createSuppliersChecked =
                                  selectAllSuppliersChecked;
                              deleteSuppliersChecked =
                                  selectAllSuppliersChecked;
                              editSuppliersChecked = selectAllSuppliersChecked;
                            });
                          },
                          checkColor: Colors.white,
                        ),
                      ],
                    ),
                    PermissionTile(
                      title: "View Suppliers",
                      checked: viewSuppliersChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          viewSuppliersChecked = value ?? false;
                        });
                      },
                    ),
                    PermissionTile(
                      title: "Update Suppliers",
                      checked: editSuppliersChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          editSuppliersChecked = value ?? false;
                        });
                      },
                    ),
                    PermissionTile(
                      title: "Delete Suppliers",
                      checked: deleteSuppliersChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          deleteSuppliersChecked = value ?? false;
                        });
                      },
                    ),
                    PermissionTile(
                      title: "Create Suppliers",
                      checked: createSuppliersChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          createSuppliersChecked = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.receipt,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              "Invoices",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Checkbox(
                          value: selectAllInvoicesChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              selectAllInvoicesChecked = value ?? false;
                              viewInvoicesChecked = selectAllInvoicesChecked;
                              createInvoicesChecked = selectAllInvoicesChecked;
                              editInvoicesChecked = selectAllInvoicesChecked;
                              deleteInvoicesChecked = selectAllInvoicesChecked;
                            });
                          },
                          checkColor: Colors.white,
                        ),
                      ],
                    ),
                    PermissionTile(
                      title: "View Invoices",
                      checked: viewInvoicesChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          viewInvoicesChecked = value ?? false;
                        });
                      },
                    ),
                    PermissionTile(
                      title: "Update Invoices",
                      checked: editInvoicesChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          editInvoicesChecked = value ?? false;
                        });
                      },
                    ),
                    PermissionTile(
                      title: "Delete Invoices",
                      checked: deleteInvoicesChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          deleteInvoicesChecked = value ?? false;
                        });
                      },
                    ),
                    PermissionTile(
                      title: "Create Invoices",
                      checked: createInvoicesChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          createInvoicesChecked = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              CustomButton(
                onPressed: () {
                  _printSelectedPermissions();
                  final snackBar = SnackBar(
                    content:
                        const Text("User's permissons printed successfully"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                label: "Print permission",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
