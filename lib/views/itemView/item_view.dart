// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testpts/models/data_model.dart';
import 'package:testpts/models/login_success_model.dart';
import 'package:testpts/models/user_data_model.dart';
import 'package:testpts/views/homePage/home_page_view.dart';
import 'package:testpts/views/homePage/providers/home_page_provider.dart';
import 'package:testpts/views/itemView/providers/item_page_provider.dart';
import 'package:testpts/views/registrationPage/subViews/loginPage/providers/login_page_provider.dart';

class ItemViewPage extends StatefulWidget {
  final UserData data;

  const ItemViewPage({super.key, required this.data});

  @override
  State<ItemViewPage> createState() => _ItemViewPageState();
}

class _ItemViewPageState extends State<ItemViewPage> {
  void backButton() {
    final itemPageProvider =
        Provider.of<ItemPageProvider>(context, listen: false);
    itemPageProvider.setNamePermission(edit: false);
    Navigator.pop(context);
  }

  void editName() async {
    final itemPageProvider =
        Provider.of<ItemPageProvider>(context, listen: false);
    final loginPageProvider =
        Provider.of<LoginPageProvider>(context, listen: false);
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    itemPageProvider.updateItem(
        userData: widget.data,
        bearerToken: loginPageProvider.logInSuccessModel.data!.token!);
    itemPageProvider.setNamePermission(edit: false);
    await homePageProvider.getAllData(
        userToken: loginPageProvider.logInSuccessModel.data!.token!);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePageView()));
  }

  void getEditPermission() {
    final itemPageProvider =
        Provider.of<ItemPageProvider>(context, listen: false);
    itemPageProvider.setNamePermission(edit: true);
  }

  @override
  Widget build(BuildContext context) {
    final itemPageProvider = Provider.of<ItemPageProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: WillPopScope(
        onWillPop: () async {
          itemPageProvider.setNamePermission(edit: false);
          return true;
        },
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.arrow_back_ios_new)),
                      onPressed: backButton,
                    ),
                    const Spacer(),
                    (itemPageProvider.editName)
                        ? GestureDetector(
                            onTap: editName,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : IconButton(
                            icon: const CircleAvatar(
                              child: Icon(Icons.edit),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: getEditPermission,
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CircleAvatar(
                radius: 60,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Image.network(widget.data.profilepicture!),
                ),
              ),
              const SizedBox(height: 20),
              (itemPageProvider.editName)
                  ? SizedBox(
                      width: 250,
                      child: TextField(
                        controller: itemPageProvider.name,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: widget.data.name!.toString(),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                      ),
                    )
                  : Text(
                      widget.data.name!.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              Text(widget.data.email!.toString()),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .8,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.info),
                            SizedBox(width: 10),
                            Text(
                              'About',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'ID: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${widget.data.id!}',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Name: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.data.name!,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Email: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.data.email!,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Location: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.data.location!,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Create Date: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.data.createdat!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
