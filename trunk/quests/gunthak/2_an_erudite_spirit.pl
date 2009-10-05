#zone: gunthak NPC:2_an_erudite_spirit (224239)
#Angelox
#note; I did this quest as per the original, "Titanium" version
#Male erudite spirit for Quest: Ethereal Cleansing

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,59027 => 1)) { #Black Skull Necklace
    quest::emote("looks at you with piercing eyes that tear through your heart. His ethereal fingers close around the necklace. A blinding light surrounds both the necklace and the transparent figure as you shield your eyes away. When the light dies down you look to see the necklace, now softly glowing, sitting on the sand. As you pick it up you notice a wet scroll half buried in the sand beneath it. A voice echoes in your mind. 'Find him.'");
    quest::summonitem(59003); #Spell: Ethereal Cleansing
    quest::summonitem(59028); #Glowing Black Skull Necklace
    quest::depop();
  }
  else {
    quest::emote("seems to ignore you."); #Text made up
    plugin::return_items(\%itemcount);
  }
}