import 'package:flutter/material.dart';

import '../models/bike.dart';

class BookingPage extends StatefulWidget {
  final Bike bike;
  const BookingPage({
    super.key,
    required this.bike,
  });

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
