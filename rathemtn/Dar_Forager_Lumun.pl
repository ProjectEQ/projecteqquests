#############
#Quest Name: Upgraded Pelts
#Author: RealityIncarnate
#NPCs Involved: Dar Forager Lumun
#Items Involved: Low/medium/high quality wolf/bear/cat pelts
#################
# items: 12084, 12085, 12086, 13753, 13754, 13755, 13750, 13751, 13752

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
   quest::summonitem(12085); # Item: Medium Quality Cat Pelt
  }

  elsif(plugin::check_handin(\%itemcount, 12085 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(12086); # Item: High Quality Cat Pelt
  }

  elsif(plugin::check_handin(\%itemcount, 13753 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(13754); # Item: Medium Quality Wolf Skin
  }

  elsif(plugin::check_handin(\%itemcount, 13754 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(13755); # Item: High Quality Wolf Skin
  }

  elsif(plugin::check_handin(\%itemcount, 13750 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(13751); # Item: Medium Quality Bear Skin
  }

  elsif(plugin::check_handin(\%itemcount, 13751 => 3)) {
   quest::say("Hmm. . . That seems like a fair trade. Let me see what I've got in my satchel. No. Wait, yes! I do have a fine specimen here that I think you'll agree is of superior quality.");
   quest::exp(150);
   quest::summonitem(13752); # Item: High Quality Bear Skin
  }

  }
 
  plugin::return_items(\%itemcount);
}

#END OF FILE zone:rathemtn