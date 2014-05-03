// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Hand = (function(_super) {
    __extends(Hand, _super);

    function Hand() {
      return Hand.__super__.constructor.apply(this, arguments);
    }

    Hand.prototype.model = Card;

    Hand.prototype.isDealer = false;

    Hand.prototype.initialize = function(array, deck) {
      this.deck = deck;
    };

    Hand.prototype.hit = function() {
      var newCard;
      newCard = this.add(this.deck.pop()).last();
      if (this.score() > 21) {
        this.lose();
      }
      return newCard;
    };

    Hand.prototype.stand = function() {
      return this.trigger('stand');
    };

    Hand.prototype.lose = function() {
      return this.trigger('lose');
    };

    Hand.prototype.scores = function() {
      var hasAce, score;
      hasAce = this.reduce(function(memo, card) {
        return memo || card.get('value') === 1;
      }, false);
      score = this.reduce(function(score, card) {
        return score + (card.get('revealed') ? card.get('value') : 0);
      }, 0);
      if (hasAce) {
        return [score, score + 10];
      } else {
        return [score];
      }
    };

    Hand.prototype.score = function() {
      if (this.scores().length > 1 && this.scores()[1] <= 21) {
        return this.scores()[1];
      } else {
        return this.scores()[0];
      }
    };

    return Hand;

  })(Backbone.Collection);

}).call(this);

//# sourceMappingURL=Hand.map
