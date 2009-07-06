#zone: gunthak NPC:2_an_erudite_spirit (224239)
#Angelox
#note; I did this quest as per the original, "Titanium" version
#Male erudite spirit for Quest: Ethereal Cleansing

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,59027 => 1)){ #Black Skull Necklace
    quest::summonitem(59003); #Spell: Ethereal Cleansing
    quest::summonitem(59028); #Glowing Black Skull Necklace
    quest::depop();
  }
  else {
    quest::emote("seems to ignore you."); #Text made up
    plugin::return_items(\%itemcount);
  }
}