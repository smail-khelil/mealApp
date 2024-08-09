import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/damedata.dart';
// Provider for static data
final mealProvider = Provider((ref) => availableMeals);