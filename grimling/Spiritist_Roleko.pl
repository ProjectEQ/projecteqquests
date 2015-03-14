#  Rakshasa Skulls

sub EVENT_SAY {

   if($text=~/hail/i){

   quest::say("Greetings Traveler. If it is rest you seek then I'm sure you may rest safely within the walls of this outpost. As the sentries keep watch for physical danger I commune with the spirits of this territory to watch for less noticeable threats.");

}



}

sub EVENT_ITEM {

   if (plugin::check_handin(\%itemcount, 31839 => 1, 31841 =>1)) {  # Resealed Runed Iron Bound Chest, Roshawna's Report of Occurrences

   quest::say("It was wise of Roshawna to send you to me instead of risk bringing something so tainted by the dark spirits within the walls of Shar Vahl.");
   quest::exp(500);
   quest::ding();
   quest::say("I shall begin the ritual immediately.");
   quest::say("What is that?! Look! There is a grimling heading this way followed by what appear to be grimling undead. Defend me while I perform the ritual.");

   quest::spawn2(167573,0,0,-975.17,-825.20,6.74,260); # A possesed griming
   quest::spawn2(167615,0,0,-958.44,-834.88,6.74,260); # A Reanmiated Grimling
   quest::spawn2(167615,0,0,-979.17,-839.41,1.14,260); # A Reanmiated Grimling
   quest::spawn2(167615,0,0,-967.86,-838.92,4.63,260); # A Reanmiated Grimling
   
}

   elsif (plugin::check_handin(\%itemcount, 31847 =>1,31848 =>3)) { # Possessed Grimlings Head, Reanmiated Grimling Skull
   
   quest::say("I am grateful for your assistance. I will be able to complete the rest of the ritual without danger now that the spirits in the skulls have been calmed. Please take this report of occurrences to Scribe Cholsa in Shar Vahl.");
   
   quest::summonitem(31849);  # Rolekos Report of Occurrences
   quest::faction(68,10); # Dar Khura
   quest::exp(2000);
   quest::ding();
   
}

   elsif (plugin::check_handin(\%itemcount, 10777 =>1,10778 =>1,10779 =>1,10915 =>1)) { # Amulet of Golden Rays, Black Flame Charcoal, Thought Leech Brain, Rakshasa Materialization Ritual
   quest::emote("Scribe Cholsa prepares the ritual components according to the ritual instructions.");
   quest::say("I will need to maintain my concentration to keep the Rakshasa from escaping back into the spirit realm. If you kill him while he is materialized he will be slain and his body will remain material. Bring me the head of the Rakshasa when he is slain.");
   quest::delglobal(Rakshasa);
   quest::spawn2(167546,0,0,-975.17,-825.20,6.74,20); # Rakshasa Karwoaro
   quest::faction(68,10); # Dar Khura
   quest::exp(2000);
   quest::ding();

}

   elsif (plugin::check_handin(\%itemcount, 10916 =>1)) { # Head of the Rakshasa

   quest::say("The threat of the Rakshasa appears to be eliminated. You have the gratitude of the Dar Khura for your bravery and assistance. Let us be wary however, the Rakshasa gained his power by allying with dark spirits that may not be indifferent to the Rakshasas death.");
   quest::faction(68,30); # Dar Khura
   quest::exp(5000);
   quest::ding();
   quest::summonitem(31837); # Shield of Bane Warding
   
}


}


#END of FILE Zone:grimling  ID:167121 -- Spiritist_Roleko.pl
