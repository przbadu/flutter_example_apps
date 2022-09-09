enum TransactionType { income, expense }

class Transaction {
  final String id;
  final TransactionType transactionType;
  final double amount;
  final DateTime transactionAt;
  final String note;
  final String categoryId;
  final String walletId;

  Transaction({
    required this.id,
    this.transactionType = TransactionType.expense,
    required this.amount,
    required this.transactionAt,
    required this.note,
    required this.categoryId,
    required this.walletId,
  });
}
