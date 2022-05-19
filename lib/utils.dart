import 'package:flutter/material.dart';

import 'Car.dart';

class Constants {
  static const inProgress = 'In Progress';
  static const rejected = 'Rejected';
  static const completed = 'Completed';
}

class CustomViews {
  Container colouredCircle(Color color) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: 8,
      height: 8,
    );
  }

  Text fadedText(String text) {
    return Text(text,
        style:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500));
  }

  Text boldText(String text, {double size = 15}) {
    return Text(text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: size));
  }

  Column incidentTextBlock(String title, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        boldText(title),
        fadedText(date),
      ],
    );
  }

  Container statusContainer(String text) {
    Color circleColor = Colors.lightGreenAccent;
    Color backgroundColor = Colors.green;
    if (text == Constants.inProgress) {
      backgroundColor = Colors.amber;
      circleColor = Colors.yellow;
    } else if (text == Constants.rejected) {
      backgroundColor = Colors.red;
      circleColor = Colors.orange;
    }
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: backgroundColor),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        children: [
          Text(text, style: const TextStyle(color: Colors.white)),
          colouredCircle(circleColor)
        ],
      ),
    );
  }

  Column vehicleTitle(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        boldText(text, size: 18),
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 32,
          height: 3,
          decoration: const BoxDecoration(color: Colors.amber),
        )
      ],
    );
  }

  Container imageBlock(String path) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0.0, 1.5), blurRadius: 2.0)
            ]),
        child: Image.asset(
          path,
          width: 140,
          height: 95,
          fit: BoxFit.cover,
        ));
  }

  Container singleItem(Car car) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.grey, offset: Offset(0.0, 1.5), blurRadius: 6.0)
          ]),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomViews().vehicleTitle(car.title!),
              CustomViews().statusContainer(car.status!)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomViews().imageBlock(car.imagePath!),
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomViews()
                              .incidentTextBlock('Incident Date', car.date!),
                          const SizedBox(height: 25),
                          CustomViews()
                              .incidentTextBlock('Incident Date', car.date!),
                        ],
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
