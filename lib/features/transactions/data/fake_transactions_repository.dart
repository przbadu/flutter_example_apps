import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/constants/test_transactions.dart';
import 'package:flutter_ui/features/transactions/transactions.dart';

class FakeTransactionsRepository {
  final _transactions = kTestTransactions;

  List<Transaction> getTransactionsList() {
    return _transactions;
  }

  Transaction? getTransaction(String id) {
    return _transactions.firstWhere((t) => t.id == id);
  }

  Future<List<Transaction>> fetchTransactionsList() async {
    Future.delayed(const Duration(milliseconds: 400));
    return Future.value(_transactions);
  }

  Stream<List<Transaction>> watchTransactionsList() async* {
    Future.delayed(const Duration(milliseconds: 400));
    yield _transactions;
  }

  Stream<Transaction?> watchTransaction(String id) {
    return watchTransactionsList()
        .map((transactions) => transactions.firstWhere((t) => t.id == id));
  }
}

/// setup riverpod providers

/// Provider for transactions repository class
final transactionsRepositoryProvider =
    Provider<FakeTransactionsRepository>((ref) {
  return FakeTransactionsRepository();
});

final transactionsListsStreamProvider =
    StreamProvider.autoDispose<List<Transaction>>((ref) {
  final transactionsRepository = ref.watch(transactionsRepositoryProvider);
  return transactionsRepository.watchTransactionsList();
});

final transactionsListsFutureProvider =
    FutureProvider.autoDispose<List<Transaction>>((ref) {
  final transactionsRepository = ref.watch(transactionsRepositoryProvider);
  return transactionsRepository.fetchTransactionsList();
});

final transactionsStreamProvider =
    StreamProvider.autoDispose.family<Transaction?, String>((ref, id) {
  final transactionsRepository = ref.watch(transactionsRepositoryProvider);
  return transactionsRepository.watchTransaction(id);
});
