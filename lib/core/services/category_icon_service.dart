import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneymanager/core/models/category.dart';

class CategoryIconService {
  //* FIRST : EXPENSE LIST
  final expenseList = {
    Category(0, "Food", FontAwesomeIcons.pizzaSlice, Colors.green),
    Category(1, "Bills", FontAwesomeIcons.moneyBill, Colors.blue),
    Category(2, "Transportaion", FontAwesomeIcons.bus, Colors.blueAccent),
    Category(3, "Home", FontAwesomeIcons.home, Colors.brown),
    Category(4, "Entertainment", FontAwesomeIcons.gamepad, Colors.cyanAccent),
    Category(5, "Shopping", FontAwesomeIcons.shoppingBag, Colors.deepOrange),
    Category(6, "Clothing", FontAwesomeIcons.tshirt, Colors.deepOrangeAccent),
    Category(7, "Insurance", FontAwesomeIcons.hammer, Colors.indigo),
    Category(8, "Telephone", FontAwesomeIcons.phone, Colors.indigoAccent),
    Category(9, "Health", FontAwesomeIcons.briefcaseMedical, Colors.lime),
    Category(10, "Sport", FontAwesomeIcons.footballBall, Colors.limeAccent),
    Category(11, "Beauty", FontAwesomeIcons.marker, Colors.pink),
    Category(12, "Education", FontAwesomeIcons.book, Colors.teal),
    Category(13, "Gift", FontAwesomeIcons.gift, Colors.redAccent),
    Category(14, "Pet", FontAwesomeIcons.dog, Colors.deepPurpleAccent),
  };
  //* SECOND : INCOME LIST
  final incomeList = {
    Category(0, "Salary", FontAwesomeIcons.wallet, Colors.green),
    Category(1, "Awards", FontAwesomeIcons.moneyCheck, Colors.amber),
    Category(2, "Grants", FontAwesomeIcons.gifts, Colors.lightGreen),
    Category(3, "Rental", FontAwesomeIcons.houseUser, Colors.yellow),
    Category(4, "Investment", FontAwesomeIcons.piggyBank, Colors.cyanAccent),
    Category(5, "Lottery", FontAwesomeIcons.dice, Colors.deepOrange),
  };
}
