#Virtuoso_Ciadus.pl
#Added tome handins - Kilelen

sub EVENT_SAY {
	quest::emote("raises a brow sharply, his Teir'Dal heritage perfectly displayed in his sharp features twisted in a glare of flawless contempt. 'The district of Kartis -- the land of the shadow -- is not a place for you, light crawler. Your presence here has no justification and you only insult your people by being here. Yes, you have betrayed your philosophy, for you are fueling the shadow with your presence within it. You may see yourself as a creature of justice and think yourself doing good by being here -- perhaps to show us the light, or to learn our secrets. Aaah. . .  learn our secrets. Yes, why don't you do that? I would be more than willing to teach you, light crawler, for whatever it is you learn under the shadow's guidance, despite how you use that knowledge, you fuel it, for you are now a product of corruption.'");
}

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4861 => 1)) ||
		(plugin::check_handin(\%itemcount, 4862 => 1)) ||
		(plugin::check_handin(\%itemcount, 4863 => 1)) ||
		(plugin::check_handin(\%itemcount, 4864 => 1)) ||
		(plugin::check_handin(\%itemcount, 4865 => 1)) ||
		(plugin::check_handin(\%itemcount, 4866 => 1)) ||
		(plugin::check_handin(\%itemcount, 4867 => 1))) {#Imbrued Platemail Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
  plugin::try_tome_handins(\%itemcount, $class, 'Bard');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:poknowledge  ID:202007 -- Virtuoso_Ciadus