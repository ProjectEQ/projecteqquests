#############
#Quest Name: Upgraded Pelts
#Author: RealityIncarnate
#NPCs Involved: Dar Forager Lumun
#Items Involved: Low/medium/high quality wolf/bear/cat pelts
#################

sub EVENT_SAY {
 if($race=~/froglok/i) {
  if($text=~/hail/i) {
   quest::say("Nice to meet you, $name! Please have a look at my wares, I have taken great pains to brings only the best that the mountains have to offer. Or perhaps you are here to make an [exchange]?");
  }
  
  if($text=~/exchange/i) {
   quest::say("I am always in need of more skins, so I will swap three identical unruined pelts for one of my higher quality versions.");
  }
 }
}

sub EVENT_ITEM {
 if($race eq "Froglok") {
  if(plugin::check_handin(\%itemcount, 12084 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(12085);
  }

  elsif(plugin::check_handin(\%itemcount, 12085 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(12086);
  }

  elsif(plugin::check_handin(\%itemcount, 13753 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(13754);
  }

  elsif(plugin::check_handin(\%itemcount, 13754 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(13755);
  }

  elsif(plugin::check_handin(\%itemcount, 13750 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(13751);
  }

  elsif(plugin::check_handin(\%itemcount, 13751 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(13752);
  }

  }
 
  plugin::return_items(\%itemcount);
}

#END OF FILE zone:rathemtn