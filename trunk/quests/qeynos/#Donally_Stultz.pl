# #Donally Stultz in qeynos
#############
#Quest Name: Qeynos Investigator's Badge (Badge #1)
#Alla URL:  http://everquest.allakhazam.com/db/quest.html?quest=1271
#Author: loglos (just made minor changes)
#NPCs Involved: an investigator, donally stultz, willie garrote, Riley shplotz
#Items Involved: Head of Donally Stultz, Investigator's Badge
#################

sub EVENT_SAY {
 if($text =~ /Bloodsaber/i) {
	quest::say("Of course I'm a Bloodsaber, you fool! I've just returned from the Plains of Karana where I was reveling in the glory of the Plaguebringer. Now then, since I see that this foolish investigator is with you, I suppose you want me to sign a confession document or something like that? Well, let's have it then!");
	#should drop head
 }
}


sub EVENT_ITEM {
	if ($itemcount{2344} == 1) {
		quest::emote("crumples the document into a ball, throws it to the ground and spits in your face, yelling, 'You are a fool if you really believe I would sign such a thing. Prepare to die!'"); 
		quest::attack($name);
	}
}
