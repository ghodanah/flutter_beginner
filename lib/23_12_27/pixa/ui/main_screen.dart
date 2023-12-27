import 'package:flutter/material.dart';
import 'package:untitled/23_12_27/pixa/repository/image_item_repository.dart';
import 'package:untitled/23_12_27/pixa/ui/image_item_widget.dart';

import '../model/image_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEditingController = TextEditingController();
  final repository = PixaImageItemRepository();
  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String query) async {
    setState(() {
      isLoading = true;
    });
    imageItems = await repository.getImageItems(query);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color(0xFF4FB6B2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color(0xFF4FB6B2),
                      ),
                    ),
                    hintText: 'Search',
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchImage(searchTextEditingController.text);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xFF4FB6B2),
                      ),
                    )),
              ),
              const SizedBox(
                height: 24,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: GridView.builder(
                          itemCount: imageItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 32,
                            mainAxisSpacing: 32,
                          ),
                          itemBuilder: (context, index) {
                            final imageItem = imageItems[index];
                            return ImageItemWidget(
                              imageItem: imageItem,
                            );
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
