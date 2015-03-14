sub EVENT_SAY {
   if($text=~/hail/i)   {
	quest::emote("raises his gaze from his tomes to greet you. 'Ahh!! Welcome, seeker of knowledge! Come to fill your brains, have you? Look closer, adventurer. I have scribed some very powerful spells.");
   }
   if($text=~/wand of pain/i)   {
	quest::emote("drops his tome and monocle and looks at you sharply. 'What?!! Have you seen Revenant Vytrix? I let him borrow my wand for a quest. That was half a season ago!! I fear he is dust and my precious wand is lost.");
   }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12869 => 1)) {
    quest::emote("begins jumping for joy. 'Yoohoo!! My wand!! Thank you. You must be some powerful adventurer. You can help me collect a few components. Fill this chest with a frost cystal, a cockatrice egg, a giant hornet egg and a plains pebble. Return the full chest to me and I shall offer you a spell I recently researched.");
    quest::exp(100);
    quest::givecash(0,0,4,0);
    quest::summonitem(17041);
    quest::faction(24,2); #Brood of Kotiz
    quest::faction(193,2); #Legion of Cabilis
  }
  if (plugin::check_handin(\%itemcount, 12885 => 1)) {
    quest::say("Yes this is exactly what i wanted. Here is your spell.");
    quest::summonitem(15444); #Spell Renew Bones
    quest::faction(24,2); #Brood of Kotiz
    quest::faction(193,2); #Legion of Cabilis
  }
  plugin::return_items(\%itemcount);
}

#End of File zone:cabwest ID: 82034 -- Keeper Pain
#By Kovou