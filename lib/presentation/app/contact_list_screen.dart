import 'package:contact/presentation/app/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "phoneNumber": '+998(90)123-13-15'},
    {"id": 2, "name": "Aragon", "phoneNumber": '+998(90)123-13-15'},
    {"id": 3, "name": "Bob", "phoneNumber": '+998(90)123-13-15'},
    {"id": 4, "name": "Barbara", "phoneNumber": '+998(90)123-13-15'},
    {"id": 5, "name": "Candy", "phoneNumber": '+998(90)123-13-15'},
    {"id": 6, "name": "Colin", "phoneNumber": '+998(90)123-13-15'},
    {"id": 7, "name": "Audra", "phoneNumber": '+998(90)123-13-15'},
    {"id": 8, "name": "Banana", "phoneNumber": '+998(90)123-13-15'},
    {"id": 9, "name": "Caversky", "phoneNumber": '+998(90)123-13-15'},
    {"id": 10, "name": "Becky", "phoneNumber": '+998(90)123-13-15'},
    {"id": 11, "name": "Lonnie", "phoneNumber": '+998(90)123-13-15'},
    {"id": 12, "name": "Freda", "phoneNumber": '+998(90)123-13-15'},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where(
            (user) => user["name"].toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  bool active = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  splashRadius: 0.0001,
                  onPressed: () {},
                  icon: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.call,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  splashRadius: 0.0001,
                  onPressed: () {},
                  icon: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        width: 0.00001,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              cursorColor: Colors.white,
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(137, 66, 66, 66),
                filled: true,
                hintText: '${_allUsers.length} контактов',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: const [
                  Text('Все вызовы'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        color: Colors.black,
                        key: ValueKey(_foundUsers[index]["id"]),
                        elevation: 0,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: const GFAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          title: Text(
                            _foundUsers[index]['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          subtitle: Text(
                            '${_foundUsers[index]["phoneNumber"]}   Узбекистан',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(AddContactScreen.route());
          },
          backgroundColor: const Color.fromARGB(230, 34, 164, 92),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
