#Yetarr.pl
#Tiny Savages

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("$name, your name has reached my ears more than a few times. Rumors fly that your kind will be the downfall of both the dragons and the Coldain.");
	}
	if($text=~/dragons/i){
		quest::say("The dragons are not my primary concern, Kyenka has a greater hatred for them. I leave matters regarding to them in his capable hands. My worries are of the Coldain.");
	}
	if($text=~/Coldain/i){
		quest::say("I do not fully trust the Kromrif to keep Kael Drakkel protected from the menace of the tiny savages. The Kromrif do not actively seek to kill them. If the Coldain are left to breed they will one day swarm over Kael and no number of Kromzek warriors will be able to save us.");
	}
	if($text=~/Kromrif/i){
		quest::say("The Frost giants who call Kael their home have grown far too lax. So few of them train daily and actively seek out the Coldain to slay. I have advised King Tormax to send Kromzek raiding parties to raze Thurgadin, however, each time he reminds me that our strongest warriors must stay to guard against the dragon menace. What I need is a band of mercenaries to seek out and assassinate key Coldain leaders. We must destroy their ability to make war.");
	}
	if($text=~/assassinate/i){
		quest::say("Perhaps assassinate is not the best word. I simply wish the death of some of the more compitent (sic) advisors of that foolish Dain. Within the halls of Icewell keep dwells a huntsman that has stood by the Dains side since he was a mere child. The court scribe is also more then he appears to be. Bring me their heads, I will reward you for each one. That is the only proof I will take of their deaths.");
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 25122 => 1)) {#Head of the Huntsman
  	quest::say("The death of this one must be causing great strife amoung the Coldain. Your work is greatly appreciated. I wish I could reward you with more, but these boots are among the few things I have to give.");
  	quest::faction(188, 20);#Kromrif
  	quest::faction(189, 20);#Kromzek
  	quest::faction(179, 10);#King Tormax
  	quest::faction(42, -30);#Claws of Veeshan
  	quest::exp(1750000);#1% of level 51 exp
  	quest::summonitem(25027);#Coldain Skin Boots
  }
  elsif(plugin::check_handin(\%itemcount, 25123 => 1)) {#Head of the Royal Scribe
  	quest::say("The death of this one must be causing great strife amoung the Coldain. Your work is greatly appreciated. I wish I could reward you with more, but these gloves are among the few things I have to give.");#Text borrowed and modified
  	quest::faction(188, 20);#Kromrif
  	quest::faction(189, 20);#Kromzek
  	quest::faction(179, 10);#King Tormax
  	quest::faction(42, -30);#Claws of Veeshan
  	quest::exp(1750000);#1% of level 51 exp
  	quest::summonitem(25026);#Coldain Skin Gloves
  }
  plugin::return_items(\%itemcount);
}#Done