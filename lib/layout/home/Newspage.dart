import 'package:flutter/material.dart';
import 'package:latihan_android/layout/model/Getnews.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'apiPage/NewsCard.dart';

class Newspage extends StatefulWidget {
  Newspage({Key? key}) : super(key: key);

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  // Future function untuk mengambil data
  Future<List<Getnews>> fetchPosts() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var getPostData = json.decode(response.body) as List;
      var listPosts = getPostData.map((i) => Getnews.fromJson(i)).toList();
      return listPosts;
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  late Future<List<Getnews>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts(); // Inisialisasi Future
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: FutureBuilder<List<Getnews>>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Menampilkan loading indicator saat data di-fetch
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Menampilkan error jika ada
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                // Menampilkan ListView jika data berhasil di-load
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    var post = snapshot.data![index];
                    return Column(
                      children: [
                        Newscard(
                          getnews: Getnews(
                            id: post.id,
                            title: post.title,
                            body: post.body,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                );
              } else {
                // Jika tidak ada data
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ),
      ),
    );
  }
}
