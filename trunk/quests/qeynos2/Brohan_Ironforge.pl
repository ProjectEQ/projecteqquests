sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Please, leave me be alone. I have such sorrow in my heart.. I wish to be alone with my thoughts.");
  }
  if($text=~/sorrow/i) {
    quest::say("My daughter Tayla has left and I fear she will not return. If only I could find someone.. Hey, would you like to do a favor for an old man or are you too busy?");
  }
  if($text=~/tayla/i) {
    quest::say("Tayla is my oldest and youngest daughter. Unlike the rest she is of a different mother. She is part elven. She appears to be physicaly younger than the rest, but she has spent more years as my daughter than all the others. Tayla is from my first marriage to Weleana.");
  }
  if($text=~/where/i) {
    quest::say("My daughters have informed me that Tayla has runaway to live with the elves of Kelethin. Apparently life among the human citizens of Qeynos was not very kind to her. I wish her well, but I wish I knew she was safe.");
  }
  if($text=~/hurrieta/i) {
    quest::say("Hurrieta is a good woman. She has a bit repulsed that I once was married to a wood elf. She got over that I believe. We had four children together. The children seem quite accepting of Tayla, even though she is a half elf.");
  }
  if($text=~/favor/i) {
    quest::say("Good. Please find my daughter, Tayla Ironforge. Bring me proof that she is safe. She was last seen near Nektulos. I am a fine blacksmith and I shall give you a worthy gift if you do this for me.");
  }
}

sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 18863 => 1)) { #Sealed Letter
    quest::say("Oh! thank you! Now I know she is safe. My sweet Tayla. Here is your reward, as promised. A hero such as yourself deserves a weapon with which to uphold your noble values.");
    my @items = (5303,5304,5305,5313,6303,6311,6312,7300,7301,7311,7499);
    quest::summonitem($items[int(rand($#items+1))]);
    quest::faction(9, 10);   #Antonius Bayle
    quest::faction(47, 10);  #Coalition of Tradefolk
    quest::faction(135, 10); #Guards of Qeynos
    quest::faction(217, 10); #Merchants of Qeynos
    quest::faction(33, -10); #Circle of Unseen Hands
    quest::exp(1000);
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:qeynos2  ID:2057 -- Brohan_Ironforge