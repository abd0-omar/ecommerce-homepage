import 'package:bloc/bloc.dart';

class QuantityCubit extends Cubit<Map<String, Map<String, int>>> {
  QuantityCubit() : super({});

  void increaseQuantity(String category, String productId) {
    final currentCategory = state[category] ?? {};
    final currentQuantity = currentCategory[productId] ?? 0;
    currentCategory[productId] = currentQuantity + 1;
    emit({
      ...state,
      category: currentCategory,
    });
  }

  void decreaseQuantity(String category, String productId) {
    final currentCategory = state[category] ?? {};
    final currentQuantity = currentCategory[productId] ?? 0;
    if (currentQuantity > 0) {
      currentCategory[productId] = currentQuantity - 1;
      emit({
        ...state,
        category: currentCategory,
      });
    }
  }
}
