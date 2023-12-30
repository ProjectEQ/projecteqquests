sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("From earth to sky, we learn these lands. The Serpent's Eyes will not rest until we've learned every brook and every tree!");
  }
}

sub EVENT_ITEM {
  if (($class eq "Ranger") && (plugin::check_handin(\%itemcount, 58653 => 1))) { #Crescent Reach Guild Summons
    quest::say("Vasha, $name. And renn to the Serpent's Eyes, the ranger guild of this great city. It is our duty to survey and learn the lands and to protect it and its creatures. While our first duty is protect each other, the balance of nature is our second. Take this tunic of our guild and use it to protect you as you grow. I can also aid in your training. See Innkeeper Fathus and Initiate Dakkan for work.  Udra!");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58757); #Serpent's Eyes Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}