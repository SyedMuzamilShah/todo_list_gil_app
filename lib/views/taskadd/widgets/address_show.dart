import 'package:flutter/material.dart';

class AddressShow extends StatelessWidget {
  final String address;
  const AddressShow({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on_sharp),
      title: Text(address),
    );
  }
}
