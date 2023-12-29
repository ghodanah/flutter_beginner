import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/23_12_29/mask/model/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Store> stores = [];
  var isLoading = true;

  Future fetch() async {
    setState(() {
      isLoading = true;
    });
    var url =
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json';

    var response = await http.get(Uri.parse(url));

    final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));

    final jsonStores = jsonResult['stores'];
    setState(() {
      stores.clear();
      jsonStores.forEach((e) {
        stores.add(Store.fromJson(e));
      });
      isLoading = false;
    });
    print('fetch 완료');
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳: ${stores.length}곳'),
        actions: [
          IconButton(onPressed: fetch, icon: Icon(Icons.refresh),),
        ],
      ),
      body: isLoading
          ? loadingWiget()
          : ListView(
        children: stores.map(
                (e) {
              return ListTile(title: Text(e.name!),
                subtitle: Text(e.addr!),
                trailing: _buildRemainStatWidget(e),);
            }).toList(),
      ),
    );
  }

  Widget _buildRemainStatWidget(Store store) {
    var remainStat = '판매중지';
    var description = '판매중지';
    var color = Colors.black;

    switch (store.remainStat) {
      case 'plenty' :
        remainStat = '충분';
        description = '100개 이상';
        color = Colors.green;
        break;
      case 'some' :
        remainStat = '보통';
        description = '30개 ~ 100개';
        color = Colors.yellow;
        break;
      case 'few' :
        remainStat = '부족';
        description = '2개 ~ 30개';
        color = Colors.red;
        break;
      case 'empty' :
        remainStat = '소진임박';
        description = '1개 이하';
        color = Colors.grey;
        break;
      default:
    }


    return Column(
      children: [
        Text(remainStat, style: TextStyle(color: color, fontWeight: FontWeight.bold),),
        Text(description, style: TextStyle(color: color),),
      ],
    );
  }

  Widget loadingWiget() {
    return Center(
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