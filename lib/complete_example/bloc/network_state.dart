import 'package:equatable/equatable.dart';

abstract class NetworkCubitState extends Equatable {
  const NetworkCubitState();

  @override
  List<Object?> get props => [];
}

class NetworkCubitInitial extends NetworkCubitState {
  @override
  List<Object?> get props => [];
}

class NetworkCubitLoading extends NetworkCubitState {
  @override
  List<Object?> get props => [];
}

class NetworkCubitLoaded extends NetworkCubitState {
  final String data;

  const NetworkCubitLoaded(this.data);
  @override
  List<Object?> get props => [];
}

class NetworkCubitError extends NetworkCubitState {
  final String message;
  const NetworkCubitError(this.message);
  @override
  List<Object?> get props => [];
}
