#High_Priest_Elikor.pl
#Planar Armor Exchange
# items: 4881, 4882, 4883, 4884, 4885, 4886, 4887, 10028, 10037, 22503, 15981

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("raises a brow sharply, his beautiful features contorting into a flawless mask of regal superiority and a meager amusement in disdain toward $name. 'I see that the ranting of Selia's zealous crusaders of 'passion and honor' have become even too much for those who once believed themselves of the same cause. Indeed, how marvelously intriguing. Perhaps now you reside in Kartis to bathe in the cold embrace of the shadow -- a promise of power has beckoned you, and your spirit heeds the call hungrily. Perhaps consciously, you do not see it -- or you are ashamed to admit the tantalizing, unbearable lure of guaranteed power, but you do feel it in your dreams, in the deepest recesses of your 'pure' soul. The hate. . . the glorious hate thrives in your eyes like blooming nightshade in the cold winter sun as they gaze upon me now. Aaaah. . . how beautiful it is. . . how truly beautiful you could be. Yes, I believe that you do indeed have a home here, in Kartis, among the shadows and the true power of this universe. Ha!");
	}
}

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 4881 => 1)) ||
		(plugin::check_handin(\%itemcount, 4882 => 1)) ||
		(plugin::check_handin(\%itemcount, 4883 => 1)) ||
		(plugin::check_handin(\%itemcount, 4884 => 1)) ||
		(plugin::check_handin(\%itemcount, 4885 => 1)) ||
		(plugin::check_handin(\%itemcount, 4886 => 1)) ||
		(plugin::check_handin(\%itemcount, 4887 => 1))) {#Ethereal Mist Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
  plugin::return_items(\%itemcount);
}

#Imported from original file
sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	quest::signal(202273,5); #Qadar
}#END of FILE Zone:poknowledge  ID:202254 -- High_Priest_Elikor 