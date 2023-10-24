import 'package:daily_cats_app/screens/detail_screen.dart';
import 'package:daily_cats_app/screens/upload_screen.dart';
import 'package:flutter/material.dart';
import '../models/cat.dart';

final List<Cat> cats = [
  Cat(id: "0", name: "별님이", title: "오늘의 귀염둥이", link: "assets/images/cat_00.jpeg", likeCount: 1930, replyCount: 6, created: DateTime.now()),
  Cat(id: "1", name: "레이", title: "암 소 씨리어스", link: "assets/images/cat_01.jpeg", likeCount: 2341, replyCount: 52, created: DateTime.now()),
  Cat(id: "2", name: "굿보이", title: "고양이와 함께 춤을", link: "assets/images/cat_02.jpeg", likeCount: 24, replyCount: 12, created: DateTime.now()),
  Cat(id: "3", name: "치라", title: "이래뵈어도 난 왕족 고양이야", link: "assets/images/cat_03.jpeg", likeCount: 523, replyCount: 77, created: DateTime.now()),
];

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Daily Cat'),
      actions: [ // 업로드 화면으로 이동
        IconButton(
          icon: const Icon(Icons.camera_alt),
          onPressed: () {
            showDialog(
              context: context, 
              builder: (_) => const UploadScreen(),
            );
          },
        ),
      ],
    ),
    body: GridView.builder(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.0,
      ),
      itemCount: cats.length,
      itemBuilder: (_, int index) => GestureDetector(
        // 상세화면으로 이동
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                cat: cats[index],
              ),
            ),
          );
        },
        child: Image.asset(
          cats[index].link,
          fit: BoxFit.cover,
        )
      ),
    ),
    );
  }
}