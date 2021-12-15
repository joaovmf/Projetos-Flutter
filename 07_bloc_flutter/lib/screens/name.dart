import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/name.dart';
class NameContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _nameController.text = context.read<NameCubit>().state;
    return Scaffold(
      appBar: AppBar(title: const Text('Change name')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "desired name"),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: Text("Change"),
                    onPressed: () {
                      final name = _nameController.text;
                      context.read<NameCubit>().change(name);
                      Navigator.pop(context);
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
