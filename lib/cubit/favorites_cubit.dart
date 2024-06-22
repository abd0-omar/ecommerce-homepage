import 'package:bloc/bloc.dart';

class FavoritesCubit extends Cubit<Map<String, Map<String, bool>>> {
  FavoritesCubit() : super({});

  void toggleFavorite(String categoryId, String productId) {
    final currentFavorites = state;
    final categoryFavorites = currentFavorites[categoryId] ?? {};
    final isFavorite = categoryFavorites[productId] ?? false;
    categoryFavorites[productId] = !isFavorite;
    final updatedFavorites =
        Map<String, Map<String, bool>>.from(currentFavorites)
          ..[categoryId] = categoryFavorites;
    emit(updatedFavorites);
  }
}
