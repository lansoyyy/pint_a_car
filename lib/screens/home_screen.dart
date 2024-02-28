import 'package:flutter/material.dart';
import 'package:pintacar/screens/details_page.dart';
import 'package:pintacar/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedStatus = [
    'Toyota',
    'Honda',
    'Hyundai',
  ];

  String selectedChip = 'Toyota';
  List<String> toyotas = [
    'Toyota Fortuner',
    'Toyota Corola',
    'Toyota Land Cruiser',
  ];
  List<String> hondas = [
    'Honda Civic',
    'Honda CR-V',
    'Honda Accord',
  ];
  List<String> hyundais = [
    'Hyundai Kona',
    'Hyundai Tucson',
    'Hyundai  Ioniq 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'Home',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: selectedStatus.map((String status) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChip = status;
                      });

                      print('asdadsd');
                    },
                    child: FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(
                          color: selectedChip == status
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      showCheckmark: false,
                      backgroundColor: const Color(0xFFC6C6C6),
                      disabledColor: Colors.grey,
                      selectedColor: Colors.blue,
                      label: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          status,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: 'Bold'),
                        ),
                      ),
                      selected: selectedChip == status,
                      onSelected: (bool selected) {
                        print('asdadsd');
                        setState(() {
                          selectedChip = status;
                        });
                        // This can be an empty callback since we're handling onTap separately
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  img: selectedChip == 'Toyota'
                                      ? Image.asset(
                                          'assets/images/toyota${index + 1}.png')
                                      : selectedChip == 'Honda'
                                          ? Image.asset(
                                              'assets/images/honda${index + 1}.png')
                                          : Image.asset(
                                              'assets/images/hyundai${index + 1}.png'),
                                  name: selectedChip == 'Toyota'
                                      ? toyotas[index]
                                      : selectedChip == 'Honda'
                                          ? hondas[index]
                                          : hyundais[index],
                                )));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            selectedChip == 'Toyota'
                                ? Image.asset(
                                    'assets/images/toyota${index + 1}.png')
                                : selectedChip == 'Honda'
                                    ? Image.asset(
                                        'assets/images/honda${index + 1}.png')
                                    : Image.asset(
                                        'assets/images/hyundai${index + 1}.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextWidget(
                                text: selectedChip == 'Toyota'
                                    ? toyotas[index]
                                    : selectedChip == 'Honda'
                                        ? hondas[index]
                                        : hyundais[index],
                                fontSize: 18,
                                fontFamily: 'Bold',
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
