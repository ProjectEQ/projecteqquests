#Grandmaster_Vohar.pl
#Monk Tomes/Planar Armor Exchange

sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::emote("sneers coldly, his face contorting into a wretched, gruesome stare of hate. His eyes fill with an untamed, feral bloodlust as his low, hissing voice begins to seep from his throat. 'You stand within the district of Kartis -- the cradle of the seed of corruption in the universe. How strange it is that we find a child of the goodly mortal virtues willingly engaging in conversation with those they have sworn to destroy. I see that perhaps you feel yourself immune to the corruption, or that you will cast down your blade and use wit and the power of your 'pure' soul to overcome the shadow at its core. How amusing -- pathetically naive and vain, but amusing nonetheless. Learn from our adepts -- convince yourself it is a means to learn our secrets, if you will, but learn from us. You will serve us most efficiently without even a conscious awareness of your deeds.'");
  }
}

sub EVENT_ITEM {
  if((plugin::check_handin(\%itemcount, 1201 => 1)) ||
		(plugin::check_handin(\%itemcount, 1202 => 1)) ||
		(plugin::check_handin(\%itemcount, 1203 => 1)) ||
		(plugin::check_handin(\%itemcount, 1204 => 1)) ||
		(plugin::check_handin(\%itemcount, 1205 => 1)) ||
		(plugin::check_handin(\%itemcount, 1206 => 1))) { #Shiverback-hide Armor
    quest::say("Thank you, $name.");#Text made up
    quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981)); #Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    quest::exp(698775);
  }
    plugin::try_tome_handins(\%itemcount, $class, 'Monk');
    plugin::return_items(\%itemcount);
}
#END of FILE Zone:poknowledge  ID:202262 -- Grandmaster_Vohar