sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Vasha, young warrior.  I found myself in Crescent Reach but a few months ago, but as it turns out, I'm extremely handy with weapons and battle strategy.  That's how I came to be named the guildmaster of the Scaleguard -- our city's warriors.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Warrior") && (plugin::check_handin(\%itemcount, 58647 => 1))) { #Crescent Reach Guild Summons
    quest::say("Karui, for bringing me the guild summons.  I was hoping you would pass by this way. There is much to learn and I can teach you many skills.  Renn to the Scaleguard as our newest member! Take this tunic, it will guard you while you train and travel the path of a warrior. Go see Innkeeper Fathus and Initiate Dakkan for work.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58751); #Scaleguard Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}