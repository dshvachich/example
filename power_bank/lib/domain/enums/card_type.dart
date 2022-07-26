import 'package:power_bank/gen/assets.gen.dart';

enum CardType { visa, masterCard, mir }

extension CardTypeExtension on CardType {
  static CardType fromValue(int value) {
    switch (value) {
      case 5:
        return CardType.masterCard;
      case 4:
        return CardType.visa;
      case 2:
        return CardType.mir;
      default:
        return CardType.mir;
    }
  }

  static int toValue(CardType cardType) {
    switch (cardType) {
      case CardType.masterCard:
        return 5;
      case CardType.visa:
        return 4;
      case CardType.mir:
        return 2;
      default:
        return 2;
    }
  }

  static String getCardName(CardType cardType) {
    switch (cardType) {
      case CardType.masterCard:
        return 'MasterCard';
      case CardType.visa:
        return 'Visa';
      case CardType.mir:
        return 'Мир';
      default:
        return '';
    }
  }

  static String getCardIconAsset(CardType cardType) {
    switch (cardType) {
      case CardType.masterCard:
        return Assets.images.masterCardIcon;
      case CardType.visa:
        return Assets.images.visaIcon;
      case CardType.mir:
        return Assets.images.mirIcon;
      default:
        return Assets.images.masterCardIcon;
    }
  }
}
