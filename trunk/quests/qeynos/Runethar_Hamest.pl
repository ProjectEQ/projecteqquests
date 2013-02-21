sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18710)) { 
		$client->Message(15,"As you glance about the large temple, Runethar Hamest greets you. 'Why hello there. Are you perhaps a new recruit? If you wish to follow the ways of Karana and become a paladin, read the note in your inventory and hand me your note to start your training.'");
  }
}

sub EVENT_SIGNAL {
	quest::say("Hire one soon, Wolten. We need to get in touch with Drosco!");
}

sub EVENT_SAY { 
	if ($text=~/hail/i){
		quest::say("Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you [need guidance] or are you [already a follower of Karana]?"); 
	}
	if ($text=~/need guidance/i){
		quest::say("Then go forth into the church and speak with Gehna Solbenya. She will assist you."); 
	}
	if ($text=~/follower of karana/i){
		quest::say("So you are one with our cause? This is good. Be aware that there are forces at work which not even the Qeynos Guard can keep at bay. We are here to spread the words of Karana and smite those who should try to end His children. We and Antonius Bayle shall work together in our destruction of evil. He requests our aid. Do you also [wish to assist Lord Bayle]?"); 
	}
	if ($text=~/wish to assist/i){
		quest::say("Then we command you to assist the Qeynos Guard with the destruction of Blackburrow. Report to Captain Tillin of Qeynos Guard and speak with him of the [gnolls of Blackburrow]. I believe he is at the arena. My loyal friend, if you have earned your Thunder Staff, I urge you to [retrieve the Bayle list]."); 
	}
	if ($text=~/will retrieve/i){
		quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause"); 
	}
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 18710 => 1)) { #Tattered Note
		quest::say("Greetings, fellow knight of Karana, and welcome to the Temple of Thunder! Here, wear this tunic and help our crusade. Wolten Grafe is my assistant, he will get you started and teach you the ways of the Rainkeeper. Once you are ready to begin your hunting training please see Vansted Rohenga, he will assist you in some tasks for your early adventures. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available for you.");
		quest::summonitem(13505); #Old Gray Tunic*
		quest::ding();
		quest::faction(183,10); #Knight of Thunder
		quest::faction(21,-15); #Bloodsabers
		quest::faction(257,10); #Priest of Life
		quest::faction(135,10); #Guards of Qeynos
		quest::exp(100);
	} else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	}
	plugin::return_items(\%itemcount);
}


#END of FILE Zone:qeynos  ID:1136 -- Runethar_Hamest 

