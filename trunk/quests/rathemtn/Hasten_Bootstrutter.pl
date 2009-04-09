# Journeyman Boots

sub EVENT_SAY {
  if ($text=~ /Hail/i) {
    quest::say("Stopped I have done. Greet you I will. What business do we have? Hmm? Speak up!!");
  }
  if ($text=~ /Journeyman Boots/i) {
    quest::say("Journeyman Boots are what you seek? Ha!! I have those upon my feet and disinigrate will they if my life is taken. Extra pair have I and [rare trade] can we make.");
  }
  if ($text=~ /Rare Trade/i) {
    quest::say("I call for three things and Journeyman Boots are yours. I call for a [Shadowed Rapier], call for the [Ring of the Ancients] and call for Gold.. 3250 Gold Coins!! This the trade that I call.");
  }
  if ($text=~ /Shadowed Rapier/i) {
    quest::say("Shadowed Men, foes to all, have appeared. Many lands do they walk. Invisible are they, but items they wield can be seen. Seek them out and return to me a Shadowed Rapier. Return it with haste before 'poof' goes the rapier!! No time to camp have you.");
  }
  if ($text=~ /Ring of the Ancients/i) {
    quest::say("Ancient cyclopes do march the land.  Long have they lived and crafted the rings of the ancients.  I must have one and you shall go and fetch one for me.  Seek the lands of the oldest cyclops clans.  Seek the plains. seek the island in tears and search the dunes for there is one who is last.  His clan was blown from the sands.");
  }
}

sub EVENT_ITEM {
  if (($itemcount{12268} == 1) && ($itemcount{7100} == 1) && ($gold + (10*$platinum) >= 3250)) {
    quest::say("The time to trade has come!! I am now rich and you are now fast. Take the Journeyman Boots and run like the wind.");
    quest::exp(1250);
    quest::summonitem(2300);
  }  
} 

# EOF zone: rathemtn ID: 50188 NPC: Hasten_Bootstrutter

