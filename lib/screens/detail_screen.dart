import 'package:flutter/material.dart';
import '../models/cat.dart';

final List<Cat> cats = [];

final List<String> replies = [
  "저 근엄한 눈빛!",
  "어느 고양이별에서 왔니?",
  "냐오오옹",
  "집사에게 충성!",
  "중요한건 꺾이지 않는 냥미모",
  "왕족이다냥"
];

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.cat,
  });
  final Cat cat;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cat.title),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
              right: 10.0,
            ),
            physics: const ClampingScrollPhysics(),
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: Image.asset(
                  widget.cat.link,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.cat.title,
                    style: const TextStyle(
                        fontSize: 20.0, color: Color(0xFF777777)),
                  ),
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.thumb_up_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                      ),
                      Text(
                        widget.cat.likeCount.toString(),
                      ),
                    ],
                  )
                ],
              ),
              Text("댓글 ${widget.cat.replyCount}개"),
              ...List.generate(
                replies.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Row(children: [
                    const Text(
                      "익명",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0)),
                    Text(
                      replies[index],
                    ),
                  ]),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Text(
                    "${widget.cat.created.year}년 ${widget.cat.created.month}월 ${widget.cat.created.day}일",
                    style: const TextStyle(color: Color(0xFFAAAAAA)),
                  ))
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                color: Theme.of(context).canvasColor,
                child: const TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      top: 5.0,
                      bottom: 5.0,
                      left: 10.0,
                    ),
                    border: OutlineInputBorder(),
                    hintText: "댓글을 입력하세요.",
                    suffixIcon: Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
