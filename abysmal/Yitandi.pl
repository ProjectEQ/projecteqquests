# Orgmar's Haunt
# Created by Gonner

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote("moans in a sad, wispy voice, 'Death. coming for all.'");
  }
}

sub EVENT_SPAWN {
  quest::settimer("moan",150);
}

sub EVENT_TIMER {
  quest::emote("moans pitifully, 'Satchel. . . Sewers. . .'");
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
# END of FILE Zone:abysmal  ID:279220 -- Yitandi.pl