import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/23_12_29/mask/ui/remain_stat_list_tile.dart';
import '../model/store.dart';
import '../view_model/store_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳: ${storeModel.stores.length}곳'),
        actions: [
          IconButton(
            onPressed: () {
              storeModel.fetch();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: storeModel.isLoading
          ? loadingWiget()
          : ListView(
        children: storeModel.stores.map((e) {
          return ListTile(
            title: Text(e.name!),
            subtitle: Text(e.addr!),
            trailing: RemainStatListTile(e),
          );
        }).toList(),
      ),
    );
  }


  Widget loadingWiget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('정보를 가져오는 중'),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
