enum ProductRentStatus {
  newRent,
  ejectRequestSend,
  started,
  paymentProcessing,
  completed,
  filed,
}

extension ProductRentStatusExtension on ProductRentStatus {
  static ProductRentStatus fromValue(int value) {
    switch (value) {
      case 0:
        return ProductRentStatus.newRent;
      case 1:
        return ProductRentStatus.ejectRequestSend;
      case 2:
        return ProductRentStatus.started;
      case 3:
        return ProductRentStatus.paymentProcessing;
      case 10:
        return ProductRentStatus.completed;
      case 20:
        return ProductRentStatus.filed;
      default:
        return ProductRentStatus.newRent;
    }
  }

  static int toValue(ProductRentStatus status) {
    switch (status) {
      case ProductRentStatus.newRent:
        return 0;
      case ProductRentStatus.ejectRequestSend:
        return 1;
      case ProductRentStatus.started:
        return 2;
      case ProductRentStatus.paymentProcessing:
        return 3;
      case ProductRentStatus.completed:
        return 10;
      case ProductRentStatus.filed:
        return 20;
      default:
        return 0;
    }
  }
}
