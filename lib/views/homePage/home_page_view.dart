import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testpts/views/homePage/providers/home_page_provider.dart';
import 'package:testpts/views/itemView/item_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  TextEditingController _searchController = TextEditingController();
  searchFeild(){}

  @override
  Widget build(BuildContext context) {
    final homePageProvider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            const Text(
              'Users',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search item',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListView.builder(
                  itemCount: homePageProvider.dataList.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemViewPage(
                                    data: homePageProvider
                                        .dataList.data![index])));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: Image.network(homePageProvider
                                .dataList.data![index].profilepicture!),
                          ),
                          title: Text(
                              homePageProvider.dataList.data![index].name!),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ID - ${homePageProvider.dataList.data![index].id!}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'Email - ${homePageProvider.dataList.data![index].email!}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
