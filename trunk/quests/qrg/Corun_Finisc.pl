######################################################
#  NPC: Corun_Finisc.pl
#  Zone:  qrg
#  Author:  Andrew80k
#

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello. My name is Corun Finisc and I am one of the Jaggedpine Treefolk. It is our divine responsibility to watch over and protect Surefall Glade and its [inhabitants] from those who seek to [destroy] them.");
  }
  if($text=~/inhabitants/i) {
    quest::say("The bears of Surefall Glade are our brothers. We are all children of [Tunare]. We would gladly die in their defense.");
  }
  if($text=~/tunare/i) {
    quest::say("Tunare is the Mother of All. It is though Her will that we protect this land and its many creatures.");
  }
  if($text=~/destroy/i) {
    quest::say("Poachers in seach of bear skins and [gnolls] who attack us unprovoked. We are doing all we can to stop them. May [Tunare] give me the strength needed to smite them dead with my [crook].");
  }
  if($text=~/gnolls/i) {
    quest::say("The Sabertooths are a vicious band of gnolls who live in Blackburrow, to the east of Surefall Glade. They constantly attack us when we only seek to share this land with them. They also send many patrols out into the Qeynos Hills to the south. We have even seen a Sabertooth skulking about in the caves behind Grizzly Falls. There is a [reward] for his hide.");
  }
  if($text=~/reward/) {
    quest::say("Yes. We are offering a small reward for slaying the skulking gnoll in the bear caves. Bring me his paw to claim your bounty. The Jaggedpine Treefolk remember well those who aid their cause.");
  }
  if($text=~/crook/i) {
    quest::say("My crook? The Jaggedpine crook is an enchanted weapon of the Jaggedpine Treefolk. The [Sabertooths] take great pleasure in destroying the crooks of any Treefolk they manage to slay. If you were to recover the pieces of a broken crook, I would gladly mend it for you.");
  }
  if($text=~/sabertooths/i) {
    quest::say("The gnolls of Blackburrow are called Sabertooths. They have been seen in force on a regular basis. They are surely up to something.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13700 => 1)) {
    quest::say("Thank you for tracking down the filthy little poacher. Take this as your reward."); #This is not from live as I have not seen the little bugger on live yet. Will update when I do.
    quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
    quest::faction(265,10);
    quest::faction(159,10);
    quest::faction(279,-30);
    quest::faction(135,10);
    quest::exp(1500);
  }
  if (plugin::check_handin(\%itemcount, 13231 => 1, 13232 => 1)) {
    quest::say("Excellent! Here is a Jaggedpine Crook of your own. Please use it only to defend yourself and never to attack one of Tunare's creatures. You will find that while wielding the crook, Tunare grants you a boon of strength and the power to smite enemies who would otherwise be impervious to physical attacks.");
    quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
    quest::summonitem(13230);
    quest::faction(265,10);
    quest::faction(159,10);
    quest::faction(279,-30);
    quest::faction(135,10);
    quest::exp(1500);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_WAYPOINT_ARRIVE {
if($wp eq 3) {
	quest::shout("Heed the wishes of Tunare and leave the bears of Surefall Glade undisturbed!");
	}

if($wp eq 11) {
	quest::say("By the will of Tunare, I serve this glade until I become one with it.");
	}

if($wp eq 18) {
	quest::shout("Heed the wishes of Tunare and leave the bears of Surefall Glade undisturbed!");
	}
if($wp eq 29) {
	quest::shout("Heed the wishes of Tunare and leave the bears of Surefall Glade undisturbed!");
	}
}


#END of FILE Zone:qrg  ID:739 -- Corun_Finisc