import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_application_1/complete_example/bloc/network_cubit.dart';
import 'package:flutter_application_1/complete_example/bloc/network_state.dart';
import 'package:flutter_application_1/complete_example/services/network_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mocktail/mocktail.dart';

class MockNetworkService extends Mock implements NetworkService {}

@GenerateMocks([NetworkService])
void main() {
  late NetworkCubit networkCubit;
  late MockNetworkService mockNetworkService;

  setUp(() {
    mockNetworkService = MockNetworkService();
    networkCubit = NetworkCubit(networkService: mockNetworkService);
  });
  tearDown(() {
    networkCubit.close();
  });
  group('NetworkCubit', () {
    test('initial state is NetworkCubitInitial', () {
      expect(networkCubit.state, NetworkCubitInitial());
    });
  });
  blocTest<NetworkCubit, NetworkCubitState>(
    'Fetch data test with success case',
    build: () {
      when(() => mockNetworkService.fetchData()).thenAnswer(
        (_) async => 'data',
      );
      return networkCubit;
    },
    act: (cubit) => cubit.fetchData(),
    expect: () => [
      NetworkCubitLoading(),
      const NetworkCubitLoaded('data'),
    ],
  );

  blocTest<NetworkCubit, NetworkCubitState>(
    'Fetch data test with error case',
    build: () {
      when(() => mockNetworkService.fetchData()).thenThrow('error');
      return networkCubit;
    },
    act: (cubit) => cubit.fetchData(),
    expect: () => [
      NetworkCubitLoading(),
      const NetworkCubitError('error'),
    ],
  );
  blocTest<NetworkCubit, NetworkCubitState>(
    'Fetch data test with error case',
    build: () {
      when(() => mockNetworkService.fetchData()).thenAnswer(
        (_) async => 'data',
      );
      return networkCubit;
    },
    act: (cubit) => cubit.fetchData(),
    expect: () => [
      NetworkCubitLoading(),
      const NetworkCubitLoaded('data'),
    ],
    verify: (_) {
      verify(() => mockNetworkService.fetchData()).called(1);
    },
  );

  blocTest<NetworkCubit, NetworkCubitState>(
    'Fetch data test with error case',
    build: () {
      when(() => mockNetworkService.fetchData()).thenThrow('error');
      return networkCubit;
    },
    act: (cubit) => cubit.fetchData(),
    expect: () => [
      NetworkCubitLoading(),
      const NetworkCubitError('error'),
    ],
    verify: (_) {
      verify(() => mockNetworkService.fetchData()).called(1);
    },
  );
}
