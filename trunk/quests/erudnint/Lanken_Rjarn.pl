# Enchanter Guildmaster

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18729)) {
    $client->Message(15, "A commanding, yet kind looking Erudite turns towards you. 'Do not be startled. I am Lanken Rjarn, Guild Master for all aspiring Enchanters. Read the note in your inventory and hand it to me when you are ready to begin your training. I look forward to training you.'");
  }
}

sub EVENT_SAY {
	if($text=~/hail/i){
		quest::emote("looks up irritably. 'I do not have time to speak with thee. I have a problem on my hands. Feel free to speak with any of my trainers.'");
	}
	if($text=~/problem/i){
		quest::say("My problems are of no concern of yours. but if you must know it deals with Nolusia's brother. I can tell you no more. Leave me be.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18729 => 1)){
		quest::say("Welcome to the Craft Keepers! You have much to learn. and I'm sure you are anxious to get started. Here's your training robe. Go see Nolusia. she'll give you your first lesson.");
		quest::ding();
		quest::summonitem(13549);
		quest::faction(56,10);   #Craftkeepers
		quest::faction(145,10);  #High Council of Erudin
		quest::faction(143,-15); #Heretics
		quest::faction(147,10);  #High Guard of Erudin
		quest::exp(100);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:erudnint  ID:24032 -- Lanken_Rjarn