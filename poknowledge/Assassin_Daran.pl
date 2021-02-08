#Assassin_Rysarieul.pl
#Rogue Tomes/Planar Armor Exchange
# items: 4901, 4902, 4903, 4904, 4905, 4906, 4907, 10028, 10037, 22503, 15981

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote("grins wildly at $name. An uncomfortable presence washes over you in a split moment as you catch the halfling's narrowed eyes searching every inch of your person. 'Hail, greetings, and well met, friend! I am Daran, rogue extraordinaire! Rather, I am -the- rogue, I should say. A'course I dinnae boast, my friend! Aww. . . dinnae be offended or feel inferior, but be honored that ye stand in my presence. Well, enough of the introductions then, yes? Hrm. . . what have we here? Perhaps ye be a rogue, hrm? Ye seek my infinite and unsurpassed cunning and prowess perhaps to teach ye? Well then, if it is a master of the shadows that you wish to be, then I be the man who will most assuredly make a proper rogue out of you yet.'");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 4901 => 1) || plugin::check_handin(\%itemcount, 4902 => 1) || plugin::check_handin(\%itemcount, 4903 => 1) || plugin::check_handin(\%itemcount, 4904 => 1) || plugin::check_handin(\%itemcount, 4905 => 1) || plugin::check_handin(\%itemcount, 4906 => 1) || plugin::check_handin(\%itemcount, 4907 => 1)) { #Woven Shadow Armor
    quest::say("Thank you, $name."); #Text made up
    quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981)); #Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    quest::exp(698775);
  }
  else {
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:poknowledge  ID:202248 -- Assassin_Daran