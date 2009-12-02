#Quests covered in this file:
#Shaman Skull Quest 4
#Shaman Skull Quest 5
#Cures - Apparently on live this guy does some neat emotes when curing or healing you.  When I can find a log, I'll add them.  In the meantime, might be nice for the newbies
#to be able to use his healing/curing quest even without the proper responses. -Kilelen

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::emote("shows the signs of a great mystic. You can feel the power resonating from his aura. 'Greetings and may the cursed blessings of Cazic-Thule be yours. What may I do for you this fine evening? Perhaps I can [cure disease] or [heal] you, perhaps even [purge toxins] from your system?");
	}
	
	if ($text=~/cure disease/i) {
		quest::say("Your malady shall dissipate once you deliver to me one giant blood sac.");
	}
	
	if ($text=~/heal/i) {
		quest::say("I can call upon the power of the ancients to mend your wounds if you can deliver to me two brittle Iksar skulls.");
	}
	
	if ($text=~/purge toxins/i) {
		quest::say("The toxins shall surely be purged from your system when I have proof of your allegiance to the empire. Let that proof be one goblin watcher signal torch.");
	}
	
	#Shaman Skull Quest No.4 Event_Say
	if($text=~/I come to inquire about the Crusaders of Rok Nikol/i && $faction <= 5 && $shmskullquest >= 6) {
		quest::say("Mystic Dovan lowers his head in sorrow let us have a moment of peace. I cannot find the words to speak of the unspeakable act of the gods which took the lives of the legendary Crusaders of Rok Nolok. You must find the answers for yourself. All I can do is wait for their return. ");
	}
	
	if($text=~/Who is Galdon Vok Nir?/i && $faction <= 7 && $shmskullquest >= 6) {
		quest::say("He is a merchant hiding in The Overthere. He is greedy and will not give the skull up easily. Seek him out and ask him what he would [trade] for the skull.");
	}
}

sub EVENT_ITEM
{
	#Full C.O.R.N. Chest turn in and Cudgel of the Mystic
	if(plugin::check_handin(\%itemcount, 12736 => 1, 5143 => 1) && $faction <= 5 && $shmskullquest >= 6) {
		quest::say("I see that you have found your answers. Now I must ask you to to retrieve for the council the skulls of the Di Nozok.  The sarnak in Lake of Ill Omen hold one of the skulls, while [Galdon Vok Nir] holds the other. Once you have retrieved them, give them to Hierphant Zand.");
		quest::faction(282, 10); #Scaled Mystics
		quest::faction(193, 10); #Legion of Cabilis
		quest::summonitem(5144); #Give the player the Iron Cudgel of the Prophet
		quest::exp(100000); #give decent xp...
		quest::setglobal("shmskullquest", 7,5,"F"); #set a global flag so that user can do shm skull quest part 5
	}
	
	#Cure disease.
	elsif(plugin::check_handin(\%itemcount, 12671 => 1)) {#giant blood sac
		quest::say("Day destroys the night, night divides the day. Tried to run, tried to hide, break on through to the other side.");#Obviously borrowed.
		quest::castspell($userid, 213);
		quest::faction(282, 10); #Scaled Mystics
		quest::faction(193, 10); #Legion of Cabilis
	}
	
	#Heal (Light Healing)
	elsif(plugin::check_handin(\%itemcount, 12739 => 2)) {#2x Brittle Iksar Skull
		quest::emote("Destruction leads to a very rough road, but it also breeds creation.");#Obviouslyborrowed.
		quest::castspell($userid, 17);
		quest::faction(282, 10); #Scaled Mystics
		quest::faction(193, 10); #Legion of Cabilis
	}
	#Cure Poison
	elsif(plugin::check_handin(\%itemcount, 12441 => 1)) {#Watcher Signal Torch
		quest::emote("All the money you make will never buy back your soul.");#Obviously borrowed.
		quest::castspell($userid, 203);
		quest::faction(282, 10); #Scaled Mystics
		quest::faction(193, 10); #Legion of Cabilis
	}
   
	else {
		plugin::return_items(\%itemcount); #return items if not the ones required
	}
} 