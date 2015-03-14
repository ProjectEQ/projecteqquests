# Grype, Cabilis East, Necro Skull Cap 6
# missing text, receives 30146 (The Broken Glacier Souvenir Mug, from halfling sawshbucliker, FV)
# gives Foot of Candlestick
# Cabilis Pale Ale by Kovou

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("gulps down the rest of his ale. 'Looks like I'll need another.'");
  }
  if ($text=~/blue talon/i) {
    quest::emote("takes a swipe at you. 'We used to be the bruisers of the west side. We didn't take nothin' from no one!! Fist and mind was our motto. Now get lost before I introduce my fist to your face. Hmpf. Too late, I see.'");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30146 => 1)) {
    quest::say("Well, as promised, here's your Foot of the candlestick.");
    quest::summonitem(12852);
  }
  if (plugin::check_handin(\%itemcount, 12609 => 4)) {
    quest::emote("swallows the whole bottle in one gulp. 'Here, go buy yourself a brain. What?!! You expecting something? How about this.. <BUUURRRPPPP!!> Thanks for helping me get through my dry spell, croak!! Never mess with a Blue Talon!!");
    quest::givecash(1,0,0,0);
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}

#End of File zone:cabeast ID:106004 -- Grype