enum PostpaidRefundStatus {
  refund,
  notRefund,
}

extension PostpaidRefundStatusExtension on PostpaidRefundStatus {
  static PostpaidRefundStatus? fromValue(int? value) {
    switch (value) {
      case 0:
        return PostpaidRefundStatus.refund;
      case 1:
        return PostpaidRefundStatus.notRefund;
      default:
        return PostpaidRefundStatus.refund;
    }
  }

  static int toValue(PostpaidRefundStatus? status) {
    switch (status) {
      case PostpaidRefundStatus.refund:
        return 0;
      case PostpaidRefundStatus.notRefund:
        return 1;
      default:
        return 0;
    }
  }
}
