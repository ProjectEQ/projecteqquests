#BeginFile: sro\Magus_Jerira.pl
#
#

sub EVENT_SAY {
	if(plugin::check_hasitem($client, 41000) || $client->KeyRingCheck(41000)) { #Adventurer's Stone
		if($text=~/hail/i) {
			quest::say("Nice to see you, $name. Am I safe in assuming you wish to travel today? I do admire the adventurers that so willingly take the risk involved with this spell. I enjoy knowing all of my hard work is not in vain. There's only been a few unfortunate folk that haven't, uhm, been so lucky. Frightful mess. I'll be sure to be extra careful where you are concerned. Honestly. A dark elf's word is . . . Well, forget that. He he. Tell me where you would like to go and I will send you there. I can send you to any of the other camps in [Butcherblock], [Commonlands], [Everfrost], [Nedaria's Landing], or [North Ro].");
		} elsif($text=~/everfrost/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4180); #Teleport Everfrost
		} elsif($text=~/commonlands/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4176); #Teleport East Commons
		} elsif($text=~/nedaria/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4580); #Teleport Nedaria
		} elsif($text=~/north ro/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4177); #Teleport North Ro
		} elsif($text=~/butcherblock/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4179); #Teleport Butcherblock
		}
    }
    else { #PC does not have Adventurer's Stone
		if($text=~/hail/i) {
			quest::say("You will have to excuse me, I am quite busy studying this Farstone and the possibility of using the magic stored inside of it.  Perhaps you should talk to another at this camp to see if they have any use for you.  I have enough time to send you to [Nedaria's Landing], if you'd like.");
		} elsif ($text=~/nedaria/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4580); #Teleport Nedaria
		}	
	} 
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#EndFile: sro\Magus_Jerira.pl