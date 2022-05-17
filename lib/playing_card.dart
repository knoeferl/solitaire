import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum CardSuit {
  spades,
  hearts,
  diamonds,
  clubs,
}

enum CardType {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king
}

enum CardColor {
  red,
  black,
}

Widget suitToImage(CardSuit cardSuit) {

  switch (cardSuit) {
    case CardSuit.hearts:
      return const FittedBox(child: Text("♥", style: TextStyle(color: Colors.red),));
    case CardSuit.diamonds:
      return const FittedBox(child: Text("♦", style: TextStyle(color: Colors.red),));
    case CardSuit.clubs:
      return const FittedBox(child: Text("♣", style: TextStyle(color: Colors.black),));
    case CardSuit.spades:
      return const FittedBox(child: Text("♠", style: TextStyle(color: Colors.black),));
  }


  switch (cardSuit) {
    case CardSuit.hearts:
      return FittedBox(child: SvgPicture.asset('images/Bay_herz.svg'));
    case CardSuit.diamonds:
      return FittedBox(child:SvgPicture.asset('images/Bay_schellen.svg'));
    case CardSuit.clubs:
      return FittedBox(child:SvgPicture.asset('images/Bay_eichel.svg'));
    case CardSuit.spades:
      return FittedBox(child:SvgPicture.asset('images/Bay_gras.svg'));
  }
}

// Simple playing card model
class PlayingCard {
  CardSuit cardSuit;
  CardType cardType;
  bool faceUp;
  bool opened;

  PlayingCard({
    required this.cardSuit,
    required this.cardType,
    this.faceUp = false,
    this.opened = false,
  });

  CardColor get cardColor {
    if(cardSuit == CardSuit.hearts || cardSuit == CardSuit.diamonds) {
      return CardColor.red;
    } else {
      return CardColor.black;
    }
  }

}