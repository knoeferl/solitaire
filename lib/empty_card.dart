import 'package:flutter/material.dart';
import 'card_column.dart';
import 'playing_card.dart';
import 'transformed_card.dart';

// The deck of cards which accept the final cards (Ace to King)
class EmptyCardDeck extends StatefulWidget {
  final CardSuit cardSuit;
  final List<PlayingCard> cardsAdded;
  final CardAcceptCallback onCardAdded;
  final int columnIndex;

   const EmptyCardDeck({
     Key? key,
    required this.cardSuit,
    required this.cardsAdded,
    required this.onCardAdded,
    required this.columnIndex,
  }): super(key: key);

  @override
  _EmptyCardDeckState createState() => _EmptyCardDeckState();
}

class _EmptyCardDeckState extends State<EmptyCardDeck> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<Map>(
      builder: (context, listOne, listTwo) {
        return widget.cardsAdded.isEmpty
            ? Opacity(
          opacity: 0.7,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            height: 60.0,
            width: 40,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: 20.0,
                      child:  suitToImage(widget.cardSuit),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
            : TransformedCard(
          playingCard: widget.cardsAdded.last,
          columnIndex: widget.columnIndex,
          attachedCards: [
            widget.cardsAdded.last,
          ],
        );
      },
      onWillAccept: (value) {
        PlayingCard cardAdded = value?["cards"].last;

        if (cardAdded.cardSuit == widget.cardSuit) {
          if (CardType.values.indexOf(cardAdded.cardType) ==
              widget.cardsAdded.length) {
            return true;
          }
        }

        return false;
      },
      onAccept: (value) {
        widget.onCardAdded(
          value["cards"],
          value["fromIndex"],
        );
      },
    );
  }


}