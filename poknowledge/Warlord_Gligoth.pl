#Warlord_Gligoth.pl
#Warrior Tomes/Planar Armor Exchange

sub EVENT_SAY {
	if($text=~/Hail/i){
		quest::emote("glares coldly, his mouth twisted in a gruesome sneer of disgust. 'Kartis is place of shadow, not gud for light crawlers. But yu here, yu want something from shadow? Yes, yu want shadow to teach yu - yu want shadow to feed yu secrets, but yu will only fuel shadow's power in learning from it. If yu still want to stay in Kartis, then yu will only give power to shadow that yu say yu hate. I will teach yu, light crawler, if yu still tink yu can outsmart shadow's soldiers. I'll make that puny stick-thing yu light crawlers call weapons into fierce tools of war and no matter who dey kill, yu will kill in the shadow's name.'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4911 => 1)) ||
		(plugin::check_handin(\%itemcount, 4912 => 1)) ||
		(plugin::check_handin(\%itemcount, 4913 => 1)) ||
		(plugin::check_handin(\%itemcount, 4914 => 1)) ||
		(plugin::check_handin(\%itemcount, 4915 => 1)) ||
		(plugin::check_handin(\%itemcount, 4916 => 1)) ||
		(plugin::check_handin(\%itemcount, 4917 => 1))) {#Indicolite Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
   plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
   plugin::return_items(\%itemcount);
}
#END of FILE Zone:poknowledge  ID:202261 -- Warlord_Gligoth