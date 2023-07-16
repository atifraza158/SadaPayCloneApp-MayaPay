import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maya_pay/widgets/atmCards/physical_card.dart';
import 'package:maya_pay/widgets/atmCards/virtual_card.dart';

class AtmCardScreen extends StatefulWidget {
  const AtmCardScreen({super.key});

  @override
  State<AtmCardScreen> createState() => _AtmCardScreenState();
}

class _AtmCardScreenState extends State<AtmCardScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "My Cards",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              child: CarouselSlider(
                items: [
                  VirtualCard(),
                  PhysicalCard(),
                ],
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  reverse: false,
                  aspectRatio: 16 / 9,
                  autoPlay: false,
                  scrollPhysics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 0.9,
                  enableInfiniteScroll: false,
                  height: 430,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: _currentIndex == 0
                ? VirtualCardProperties()
                : PhysicalCardProperties(),
          ),
        ],
      ),
    );
  }
}

class VirtualCardProperties extends StatefulWidget {
  const VirtualCardProperties({super.key});

  @override
  State<VirtualCardProperties> createState() => _VirtualCardPropertiesState();
}

class _VirtualCardPropertiesState extends State<VirtualCardProperties> {
  bool _switchvalue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {},
        leading: Icon(
          Icons.wb_iridescent_outlined,
          color: Colors.lightBlue,
          size: 30,
        ),
        title: Text(
          "Freeze Card",
          style: TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          "Lock this card temporarily",
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Switch(
          value: _switchvalue,
          onChanged: (value) {
            setState(() {
              _switchvalue = value;
            });
          },
          inactiveThumbColor: Colors.grey,
          inactiveTrackColor: Colors.grey[300],
          activeColor: Colors.lightBlue,
          activeTrackColor: Colors.lightBlue.withOpacity(.3),
        ),
      ),
    );
  }
}

class PhysicalCardProperties extends StatefulWidget {
  const PhysicalCardProperties({super.key});

  @override
  State<PhysicalCardProperties> createState() => _PhysicalCardPropertiesState();
}

class _PhysicalCardPropertiesState extends State<PhysicalCardProperties> {
  bool _switchvalue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.wb_iridescent_outlined,
              color: Colors.lightBlue,
              size: 30,
            ),
            title: Text(
              "Freeze Card",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "Lock this card temporarily",
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Switch(
              value: _switchvalue,
              onChanged: (value) {
                setState(() {
                  _switchvalue = value;
                });
              },
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
              activeColor: Colors.lightBlue,
              activeTrackColor: Colors.lightBlue.withOpacity(.3),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.shield_outlined,
              color: Colors.lightBlue,
              size: 30,
            ),
            title: Text(
              "Change Debit Card Pin",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "Update Debit Card Pin",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.add_card,
              color: Colors.lightBlue,
              size: 30,
            ),
            title: Text(
              "Report An issue with your Card",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "Card is lost, stolen, damaged or compromised",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
