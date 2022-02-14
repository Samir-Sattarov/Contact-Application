import 'package:contact/presentation/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';

class AddContactScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: ((context) => AddContactScreen()));

  AddContactScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать Контакт'),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Align(
              child: GFAvatar(
                backgroundColor: Colors.grey,
                size: 50,
              ),
            ),
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const TextFormFieldWidget(
                      hintTextColor: Color.fromARGB(255, 158, 158, 158),
                      hintText: 'Полное имя',
                      enableSuffix: true,
                      borderSide: true,
                      wightBorderFocus: 2,
                      colorFocusedBorder: Colors.blue,
                      color: Color.fromARGB(137, 66, 66, 66),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 110,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(137, 66, 66, 66),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TextFormFieldWidget(
                            hintTextColor: Color.fromARGB(255, 158, 158, 158),
                            hintText: 'Компания',
                          ),
                          TextFormFieldWidget(
                            hintTextColor: Color.fromARGB(255, 158, 158, 158),
                            hintText: 'Должность',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const TextFormFieldWidget(
                      preffixText: 'Мобильный',
                      enablePreffix: true,
                      hintTextColor: Color.fromARGB(129, 143, 143, 143),
                      hintText: 'Телефон',
                      borderSide: true,
                      wightBorderFocus: 2,
                      colorFocusedBorder: Colors.blue,
                      color: Color.fromARGB(137, 66, 66, 66),
                    ),
                    const SizedBox(height: 5),
                    const TextFormFieldWidget(
                      enablePreffix: true,
                      preffixText: 'Рабочий',
                      hintTextColor: Color.fromARGB(129, 143, 143, 143),
                      hintText: 'Email',
                      borderSide: true,
                      wightBorderFocus: 2,
                      colorFocusedBorder: Colors.blue,
                      color: Color.fromARGB(137, 66, 66, 66),
                    ),
                    const ListTile(
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      title: Text(
                        'Имя группы',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Добавить поле',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
