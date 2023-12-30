sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("And on the greatest day I awoke and to my dragon mother I spoke! Dear Veshma, Osh`vir said, you knew this would happen -- you asked to become one of the drakkin!  No other could learn a song faster, and so I became the guildmaster!");
  }
}

sub EVENT_ITEM {
  if (($class eq "Bard") && (plugin::check_handin(\%itemcount, 58650 => 1))) { #Crescent Reach Guild Summons
    quest::say("Vasha, $name! Another youngling bard to add to our growing ranks of the Weavers of Legend. This is a most exciting time as we will be the first to record the history of this new race of dragonkind. Could there be a greater honor? You must sing great songs of the virtues of Veeshan and The Six, our parents, so that the bloodline of the dragons will last for eternity. So, renn to the Weavers of Legend, my friend, and take this tunic for your travels. I highly recommend you see Innkeeper Fathus and Initiate Dakkan for work.  They are located in the city.  Udra, for now.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58754); #Weavers of Legend Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}