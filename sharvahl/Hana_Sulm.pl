#Hana_Sulm  Shar Vhal  ID 155051
# items: 6144, 6139, 6137



sub EVENT_SAY {
  
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6144 =>1 )) {
  quest::say("Well, you're going to need to practice for a while to make these things. Take these sketches and read up on the lore concerning sonic wolves. You'll learn how to use the sketches. Practice all you can. I'm sure that you're going to have a lot of people coming to you with requests.");
  quest::summonitem(6144); # Item: Jharin Hilt Piece
  quest::summonitem(6139); # Item: Claw Lining Sketches
  quest::summonitem(6137); # Item: Blade Lining Sketches
  quest::faction( 1513,10 ); # Faction: Guardians of Shar Vahl
    
  }
  plugin::return_items(\%itemcount);
}
#Endoffile  Hana_Sulm  Shar Vhal  ID 155051
