sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome to Crescent Reach, young one. The Crystalwing Order, my guild of devout clerics, serves to ensure the health and welfare of all of our city's drakkin and allies. These are uncertain times for all as we drakkin find footing in this world.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Cleric") && (plugin::check_handin(\%itemcount, 58652 => 1))) { #Crescent Reach Guild Summons
    quest::say("Karui for your interest in the Crystalwing Order. As one of our newest members, you must venture out into the world and protect those around you while training and improving your skills. I can help train you, but you will learn more by being out in the world. Keep your heart and mind close to Veeshan and she shall guide your way. We are gifted with the magic of dragons of these lands!  Take this tunic of our Order. It will help shield you while you grow.  I highly recommend you see Innkeeper Fathus and Initiate Dakkan for work.  They are located in the city.  Udra, for now.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58756); #Crystalwing Order Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}