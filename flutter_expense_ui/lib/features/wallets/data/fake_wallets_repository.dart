import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/constants/test_wallets.dart.dart';
import 'package:flutter_ui/features/wallets/wallets.dart';

class FakeWalletsRepository {
  final List<Wallet> _wallets = kTestWallets;

  List<Wallet> getWalletsList() {
    return _wallets;
  }

  Wallet? getWallet(String id) {
    return _wallets.firstWhere((w) => w.id == id);
  }

  Future<List<Wallet>> fetchWalletList() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return Future.value(_wallets);
  }

  Stream<List<Wallet>> watchWalletList() async* {
    await Future.delayed(const Duration(milliseconds: 400));
    yield _wallets;
  }

  Stream<Wallet?> watchWallet(String id) {
    return watchWalletList()
        .map((wallets) => wallets.firstWhere((w) => w.id == id));
  }
}

/// setup riverpod providers

/// Provider for wallets repository class
final walletsRepositoryProvider = Provider<FakeWalletsRepository>((ref) {
  return FakeWalletsRepository();
});

/// stream provider for list of wallets
final walletsListStreamProvider =
    StreamProvider.autoDispose<List<Wallet>>((ref) {
  final walletsRepository = ref.watch(walletsRepositoryProvider);
  return walletsRepository.watchWalletList();
});

/// future provider for list of wallets
final walletsListFutureProvider =
    FutureProvider.autoDispose<List<Wallet>>((ref) {
  final walletsRepository = ref.watch(walletsRepositoryProvider);
  return walletsRepository.fetchWalletList();
});

/// stream provider to get Wallet by id
final walletProvider =
    StreamProvider.autoDispose.family<Wallet?, String>((ref, id) {
  final walletsRepository = ref.watch(walletsRepositoryProvider);
  return walletsRepository.watchWallet(id);
});
