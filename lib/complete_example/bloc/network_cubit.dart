import 'package:flutter_application_1/complete_example/bloc/network_state.dart';
import 'package:flutter_application_1/complete_example/services/network_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkCubit extends Cubit<NetworkCubitState> {
  final NetworkService networkService;
  NetworkCubit({required this.networkService}) : super(NetworkCubitInitial());

  Future<void> fetchData() async {
    try {
      emit(NetworkCubitLoading());
      final response = await networkService.fetchData();
      emit(NetworkCubitLoaded(response));
    } catch (e) {
      emit(NetworkCubitError(e.toString()));
    }
  }
}
