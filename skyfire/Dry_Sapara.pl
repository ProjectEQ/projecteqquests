#ID91092
# items: 69313, 69309, 69935, 69936
sub EVENT_SAY {
  if($text=~/hail/i) {
	if($client->GetGlobal("paladin_epic") ==4 && plugin::check_hasitem($client, 69933)) {
      quest::say("Welcome $name. I see you have the Seal of Enic, I imagine you have done a very good deed for Enic to acquire that. If Enic gave you that, he must trust you. And if he trusts you, then so shall I. I ask a favor of you, paladin. I wish for you to help me with a servant of mine. Rithnok, a very loyal servant of the Peak, disappeared a few days ago. He has returned, but he is not the same. . .he appears beaten and torn. I feel he has been tormented by some unknown being. For what reason? I do not know. However, he must be relieved of his suffering. I ask you to release him from the confines of this world and bring me back anything you find. Go now.");
	  quest::depopall(91193);
	  quest::spawn2(91193,0,0,2696,2377,-95,128); # NPC: #Rithnok_the_Tormented
    }
	else {
	  quest::say("What brings you here mortal? I am the new guardian of Veeshan's Peak and I will not allow you to pass. And even if I did, the ward on the door will not allow you to pass. Though, you do seem like the resourceful type and I do have something that I need researched. Would you be [" . quest::saylink("willing to do a task") . "] for me?");
	}
  }
  if($text=~/willing to do a task/i) {
    quest::say("Very well. Veeshan's Peak is a very old sanctuary of the Ring of Scale. This monument has been here longer than you and I have lived and will remain here past you and your lifetime. There is very little known about the monument itself though. I've been told that Veeshan's Peak was created by a powerful dragon, one who followed Jaled Dar. His name was Suled Dar and he created this place by forging the magma and stone with his will. It was said that Suled Dar fought alongside Jaled Dar against the iksars and fell to their ruler. It was also said that through his strength of mind and skill with magic, he destroyed one of the greatest iksar outposts by shaking the ground and creating a pit that swallowed the outpost whole. That type of magic is unimaginable these days, yet I yearn for that knowledge -- the power to shape a structure with my own mind out of the earth. [" . quest::saylink("continue") . "]");
  }
  if($text=~/continue/i) {
    quest::say("It was said that when Suled Dar was slain, he wasn't laid to rest in the Necropolis like other dragons. He chose to be buried here, in the Skyfire Mountains where he built his masterpiece. He created four globes here in the mountains, which I do not know the function for, though I have studied them intensely. They have a mystical power that I'm not certain of, but I have my own beliefs about them. Here is what I would like you to do . . . I would like you to gather a small force and activate the four globes. I will try to cast a spell that fills the globes with energy and we will try to figure out this mystery. Come back to me when you are [" . quest::saylink("ready") . "] and we will begin this experiment.");
  }
  if(($text=~/ready/i) && !defined($qglobals{dragon_not_ready})) {
    quest::say("Very well. You and your companions need to activate the globes while I attempt to channel energy into them. Go and do this now.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 69313 => 1)) {
    quest::emote("intensely stares at the book and says 'This tome will teach me much of this ancient place. Now, I am in your debt. What is it that you want from me?' Dry Sapara then invades your mind and says, 'Ah yes, you want a portion of my blood. Fine Outlander, take it and leave me to read this ancient book.");
    quest::summonitem(69309); # Item: Brood Dragon Blood
  }
  if (plugin::check_handin(\%itemcount, 69935 => 1)) {
    quest::say("This appears to be a vessel that housed Rithnok's soul. However, it appears to be missing a few shards. Take this soulstone and piece it back together. I have a feeling once this item becomes whole it will lead you to whoever did this to our poor Rithnok. Thank you for releasing him, $name.");
	quest::summonitem(69936); # Item: Rithnok's Soulstone
  }
  plugin::return_items(\%itemcount);
}
