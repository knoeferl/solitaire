import 'package:flutter/material.dart';
import 'card_column.dart';
import 'playing_card.dart';

// TransformedCard makes the card draggable and translates it according to
// position in the stack.
class TransformedCard extends StatefulWidget {
  final PlayingCard playingCard;
  final double transformDistance;
  final int transformIndex;
  final int columnIndex;
  final List<PlayingCard> attachedCards;

  const TransformedCard({
    Key? key,
    required this.playingCard,
    this.transformDistance = 15.0,
    this.transformIndex = 0,
    this.columnIndex = 0,
    this.attachedCards = const [],
  }) : super(key: key);

  @override
  _TransformedCardState createState() => _TransformedCardState();
}

class _TransformedCardState extends State<TransformedCard> {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          0.0,
          widget.transformIndex * widget.transformDistance,
          0.0,
        ),
      child: _buildCard(),
    );
  }

  Widget _buildCard() {
    return !widget.playingCard.faceUp
        ? Container(
      height: 60.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
    )
        : Draggable<Map>(
      feedback: CardColumn(
        cards: widget.attachedCards,
        columnIndex: 1,
        onCardsAdded: (card, position) {},
      ),
      childWhenDragging: _buildFaceUpCard(),
      data: {
        "cards": widget.attachedCards,
        "fromIndex": widget.columnIndex,
      },
      child: _buildFaceUpCard(),
    );
  }

  Widget _buildFaceUpCard() {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
        height: 60.0,
        width: 40,
        child: Stack(
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Text(
                      _cardTypeToString(),
                      style: const TextStyle(
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    child: suitToImage(widget.playingCard.cardSuit),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _cardTypeToString(),
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                      child: suitToImage(widget.playingCard.cardSuit),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _cardTypeToString() {
    switch (widget.playingCard.cardType) {
      case CardType.one:
        return "A";
      case CardType.two:
        return "2";
      case CardType.three:
        return "3";
      case CardType.four:
        return "4";
      case CardType.five:
        return "5";
      case CardType.six:
        return "6";
      case CardType.seven:
        return "7";
      case CardType.eight:
        return "8";
      case CardType.nine:
        return "9";
      case CardType.ten:
        return "10";
      case CardType.jack:
        return "J";
      case CardType.queen:
        return "Q";
      case CardType.king:
        return "K";
    }
  }
}