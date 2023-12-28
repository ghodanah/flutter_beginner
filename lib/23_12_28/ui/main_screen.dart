import 'package:flutter/material.dart';
import 'package:untitled/23_12_28/model/image_data.dart';
import 'package:untitled/23_12_28/repository/pixaimage_item_repository.dart';
import 'package:untitled/23_12_28/ui/image_widget.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  final textEditingController = TextEditingController();
  List<ImageData> imageDataList = [];
  final repository = PixabayImageItemRepository();

  Future<void> searchImage(String query) async {
    imageDataList = await repository.getImageItems(query);

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                      searchImage(textEditingController.text);
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  ),
                  itemCount: imageDataList.length,
                  itemBuilder: (context, index) {
                    final imageData = imageDataList[index];
                    return ImageWidget(
                      imageData: imageData,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
