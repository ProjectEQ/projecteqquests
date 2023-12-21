sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("There is enlightenment through death. Let no one convince you otherwise.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Necromancer") && (plugin::check_handin(\%itemcount, 58649 => 1))) { #Crescent Reach Guild Summons
    quest::say("Vasha, $name. Pay no heed to the fretful glances you might receive while traveling. Many are not fond of the arts we practice, but I would say it's the only true art! Life, nature and even the elements are so obvious. There is no mystery greater than death and to control and command it is a reward greater than most will know... but you will learn! Renn to the Bloodreavers, youngling. I can teach you many skills, so I expect i will see you soon. And take this robe of our guild to protect you as you learn to command death itself. I highly recommend you see Innkeeper Fathus and Initiate Dakkan for work inside the city. Udra, bloodreaver.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58753); #Bloodreaver's Apprentice Robe*
  }
  plugin::return_items(\%itemcount);
}