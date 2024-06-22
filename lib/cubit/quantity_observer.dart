import 'package:bloc/bloc.dart';

class QuantityObserver extends BlocObserver {
  const QuantityObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
