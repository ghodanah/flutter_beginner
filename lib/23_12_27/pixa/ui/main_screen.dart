import 'package:flutter/material.dart';
import 'package:untitled/23_12_27/pixa/ui/image_item_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xFF4FB6B2),
                      ),
                    )),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                    ),
                    itemBuilder: (context, index) {
                      return ImageItemWidget();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
