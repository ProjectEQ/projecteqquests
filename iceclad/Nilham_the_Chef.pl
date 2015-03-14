#Zone: Iceclad Ocean
#Short Name: iceclad
#Zone ID: 110
#
#NPC Name: Nilham the Chef
#NPC ID: 110065
#Quest Status: finished
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Ahoy, $name. Welcome ta the brig. I didn't get ta the 'B' section of my piratisms manual so I'm not sure what a brig is but I'm guessin' it means 'really small place without enough food or water.' So, ya here ta stay or just visitin'?");
  }
  if(quest::istaskactive(220)){
 	 if ($text=~/trick or treat/i) {
  		quest::say("Can ya believe the Cap'n thought these were real when I first started handing them out? Hah! At least he did until they melted in his pocket!");
  		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84089,84089,84089,84089,84089,84089));
		quest::updatetaskactivity(220,4);
	}
  }

}


sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18962 => 1)) {
    quest::emote("looks at you with a gleam in his eye.");
    quest::say("Wow. Ya actually got one. Thanks, mate! Here, you can have my cuffs. I'm tired of 'em and they're startin' ta chafe.");
    quest::say("B - Bilgewater. Barnacle brained blunderhead. Blast yer ballast...");
    quest::emote("happily reads through the book.");
    quest::summonitem(30041);
    quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone: iceclad ID:110065 -- Nilham_the_Chef

