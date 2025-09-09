import 'package:flutter/material.dart';

extension StringExtensions on String {
  bool get isNullOrEmpty => isEmpty;

  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension DateTimeExtensions on DateTime {
  String toFormattedString() {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year}';
  }
}