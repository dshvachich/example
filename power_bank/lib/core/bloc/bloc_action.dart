import '../enums/message_type.dart';

abstract class BlocAction {}

class ShowLoader extends BlocAction {}

class HideLoader extends BlocAction {}

class ShowAlertMessage extends BlocAction {
  ShowAlertMessage({
    this.messageType = MessageType.customMessage,
    this.title,
    this.message,
    this.dismissible = true,
    this.mainButtonText,
    this.additionalButtonText,
  });

  MessageType messageType;
  String? title;
  String? message;
  String? additionalButtonText;
  String? mainButtonText;
  bool dismissible;
}

class ShowSnackBarMessage extends BlocAction {
  ShowSnackBarMessage({
    required this.message,
  });

  String message;
}

class ShowNewItems<I> extends BlocAction {
  ShowNewItems({
    required this.items,
    required this.totalItemsCount,
  });

  List<I> items;
  int totalItemsCount;
}

class ShowLastItems<I> extends BlocAction {
  ShowLastItems({
    required this.items,
  });

  List<I> items;
}

class ClearItems extends BlocAction {}

class UpdateItems<I> extends BlocAction {
  UpdateItems({
    required this.items,
  });

  List<I> items;
}
