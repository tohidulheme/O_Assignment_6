import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final List<Map<String, String>> contacts = [
    {'name': 'Jawad', 'phone': '01877-777777'},
    {'name': 'Ferdous', 'phone': '01673-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
  ];

  void addContact() {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please Enter both Name and Number')),
      );
      return;
    }

    setState(() {
      contacts.add({'name': name, 'phone': phone});
    });

    nameController.clear();
    phoneController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Enter Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: addContact,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                child: const Text("Add", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.brown,
                        size: 35,
                      ),
                      title: Text(
                        contacts[index]['name']!,
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        contacts[index]['phone']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: const Icon(Icons.phone, color: Colors.blue),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
