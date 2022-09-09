import 'package:flutter_ui/constants/test_wallets.dart.dart';
import 'package:flutter_ui/features/wallets/domain/wallet.dart';

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

  Stream<Wallet?> watchProduct(String id) {
    return watchWalletList()
        .map((wallets) => wallets.firstWhere((w) => w.id == id));
  }
}
