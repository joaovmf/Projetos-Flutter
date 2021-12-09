// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import './contact_form.dart';
import '../models/contact.dart';
import '../database/dao/contact_dao.dart';
import '../components/progress.dart';
import '../components/centered_message.dart';
import './transaction_form.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: [],
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Progress();
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data as List<Contact>;
                if (contacts.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Contact contact = contacts[index];
                      return _ContactItem(contact, onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TransactionForm(contact),
                          ),
                        );
                      });
                    },
                    itemCount: contacts.length,
                  );
                }
                return CenteredMessage('No transactions found',
                    icon: Icons.warning, iconSize: 30.0, fontSize: 24.0);
            }
            return CenteredMessage('Unknown error');
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then((value) => setState(() {
                    widget.createState();
                  }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  _ContactItem(this.contact, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(contact.name,
            style: TextStyle(
              fontSize: 24.0,
            )),
        subtitle: Text(contact.accountNumber.toString(),
            style: TextStyle(
              fontSize: 16.0,
            )),
      ),
    );
  }
}
