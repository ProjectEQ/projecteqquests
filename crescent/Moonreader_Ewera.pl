sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("All of nature is precious and we should respect it as such! Embrace the earth, the grass, the trees, the beasts big and small! Guard those innocents as you would your own life.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Druid") && (plugin::check_handin(\%itemcount, 58654 => 1))) { #Crescent Reach Guild Summons
    quest::say("I must say karui for your interest in the Sylvan Moon. We do need more druids to learn our way and to use our magic and skill to help this city and the drakkin thrive in these mountains. There is so much to learn and do and there will always be threats against the children of Veeshan. Welcome into our guild. Take this tunic of the Sylvan Moon and wear it proudly.  Find Innkeeper Fathus and Initiate Dakkan in the city for work. Udra, young druid.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58758); #Sylvan Moon Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}