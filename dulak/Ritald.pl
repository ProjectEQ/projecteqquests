#############
#NPC: Ritald
#Author: Spre
#Version: 0.0.1
#EQEMUV: 6.2+
#############

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, dark one. Do you feel it? I am sure you do. Innoruuk's voice is so distant now. His voice is merely a whisper. This disturbs me greatly. How will the evil ones do their master's bidding without his dark guidance? I fear the end is almost near for true champions of darkness such as yourself. We cannot let that happen! I believe I know of a way to slow down the diminishing of our master's voice. There is a sword of great evil. It is however not of this world. I believe I can summon it to this plane of existence, but I will need several items first. Will you [take on this task]? Your future and the future of all our dark brethren depends on obtaining this sword!");
  }
  if ($text=~/take on this task/i) {
    quest::say("Excellent. There is no time to waste. The first item I need is an ancient flamberge of hatred. I believe a trollish pirate named, Captain Varns, here in Dulak's Harbor is in possession of one. Destroy him and return this item to me. The second item is an essence of hate. You should be able to find such an essence in the Plane of Hate. The last item I need is a stormborn phylactery. You should be able to find one in the Plane of Storms. When you have all these items, hand them to me so that I may begin the summoning of the sword.");
  }
  if ($text=~/have done it/i && plugin::check_hasitem($client, 22944)) {
    quest::say("This sword known as Innoruuk's Voice emanates great evil. It should help to generate enough evil to sustain the mysterious powers that make one a shadowknight. It is not at full power yet however. I am now trusting you to take this sword and help to recover its full power. You will be its new champion. Take it to Sienn Kastane in the Plane of Knowledge. I believe she should be able to help you with returning the sword to its full power.");
  }
}

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 55902 => 1, 21870 => 1, 21782 => 1 )) { 
    quest::say("You have done well. The flamberge you have brought to me will act as a vessel for the summoning of the sword. The essence of hate will help generate hatred needed to fuel the summoning, and the phylactery should hopefully help contain that hate to be used in the summoning. Ritald holds the flamberge above his head with both hands and begins to chant. Dark storm clouds gather overhead as a flash of lightning momentarily blinds you. When you regain your sight, Ritald holds the summoned sword of Innoruuk's Voice. I [have done it]!"); 
    quest::summonitem(22944); 
    quest::ding(); 
  }
  plugin::return_items(\%itemcount);
}
#ShadowKnight Pre-Quest requires 3? Boss fights 2 being raid caliber. 
#I am not sure if I need to set a variable for the 1.5 quest read this was a pre quest.