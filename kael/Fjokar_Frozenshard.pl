#Fjokar_Frozenshard.pl
#Wenglawks The Traitor
# items: 1717, 25030

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Today is a good day in Kael Drakkel. Don't you think?");
	}
	if($text=~/Wenglawks/i){
		quest::say("Wenglawks masquerades as a noble. As family lines go, his is even more diluted than those two Iceshard brothers. He is a petty merchant and traitor. One day I will find my proof of this.");
	}
	if($text=~/Iceshard Brothers/i){
		quest::say("Klaggan and Vorken, those two ruffians who somehow have managed to become the lords of the Kromrif manor. They were nothing but a pair of thugs no less than twenty years ago. I remember watching them kill and maim the innocent among the Kromrif tribes. If it were not for King Tormax's protection, I would slay them.");
	}
	if($text=~/Kromrif/i){
		quest::say("The Frost giants are a proud race, but they are not nearly as powerful and blessed as we Kromzek. Our cousins may be strong, but the might of an enraged storm giant is something to behold.");
	}
	if($text=~/courier/i){
		quest::say("Those Kromzek deserve to die. They know very well what he is up to. I will hunt them for sport, moving silently through the streets of Kael Drakkel, and invisibly through the outside world. Wenglawks has some sort of underhanded deals going on with the dragons. I have yet to find anything which will persuade King Tormax to allow me to slay him, unfortunately.");
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1717 => 1)) {#Sealed Letter (Sealed Letter to Wenglawks)
  	quest::say("You have found what I was unable to. King Tormax's protection of Wenglawks will end soon. His death will be so very delightful to invoke.");
  	quest::emote("rushes out of the room, dropping his spear as he does.");
  	quest::faction(448, 20);#Kromzek
  	quest::faction(429, 20);#King Tormax
  	quest::faction(405, -30);#Dain Frostreaver IV
  	quest::faction(436, -30);#Yelinak
  	quest::exp(1107392);#1% of level 45 exp
  	quest::summonitem(25030);#Frozen Shard
  }
  plugin::return_items(\%itemcount);
}#Done
