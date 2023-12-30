sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I was surprised to learn of this new people, the drakkin, and promptly came to visit to offer my services to any berserkers here -- and I found none!  Nonetheless, I will stay here to guide and offer training to any berserkers who may pass by.  We don't want any of my kind out there with uncontrolled rage, believe me!");
  }
}

sub EVENT_ITEM {
  if (($class eq "Berserker") && (plugin::check_handin(\%itemcount, 58662 => 1))) { #Crescent Reach Guild Summons
    quest::say("Welcome to the Ragefury Berserkers. Through practice and battle you will learn to control your rage properly so that you're a formidable force on any field and against any foe. Take this tunic. It will help protect you.  When you need further training, see me.  Oh, and I hear two characters named Innkeeper Fathus and Initiate Dakkan may have work for you.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58766); #Ragefury Berserkers Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}