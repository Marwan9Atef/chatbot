import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/app_bloc_observer.dart';

void observerInit() {
  Bloc.observer = AppBlocObserver();
}