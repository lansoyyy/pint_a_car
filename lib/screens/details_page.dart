import 'package:flutter/material.dart';
import 'package:pintacar/widgets/text_widget.dart';

import '../utils/const.dart';

class DetailsPage extends StatefulWidget {
  Widget img;
  String name;

  DetailsPage({super.key, required this.img, required this.name});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera),
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: TextWidget(
          text: 'Details',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.img,
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: 'Name: ${widget.name}',
              fontSize: 22,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              align: TextAlign.left,
              text:
                  'Details: ${cars.where((car) => car.model == widget.name).first.details}',
              fontSize: 14,
              fontFamily: 'Regular',
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
