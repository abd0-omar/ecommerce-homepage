import 'package:bloc/bloc.dart';

class FavoritesObserver extends BlocObserver {
  const FavoritesObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
