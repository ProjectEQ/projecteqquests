sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("My aptitudes have led me to become the guildmaster of the Dreamseekers, our enchanter guild. I wish I could recall who I was before I experienced my awakening as a drakkin. You would think as an enchanter, I would be able to tap into my memories, but the magic of The Six and their blood is so strong!");
  }
}

sub EVENT_ITEM {
  if (($class eq "Enchanter") && (plugin::check_handin(\%itemcount, 58658 => 1))) { #Crescent Reach Guild Summons
    quest::say("It would seem fate has led you to us, $name. We welcome you into the Dreamseekers. Your gifts with enhancing minds and bodies, and harming them, will make you a very powerful foe. Take this robe to protect you as you advance.  Also, Innkeeper Fathus and Initiate Dakkan in the city will have work for you. Udra, $name, and return for training at any time.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58762); #The Dreamseekers Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}