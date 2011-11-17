############################################
# ZONE: West Freeport (freportw)
# LAST EDIT DATE: 11-17-11
# DEVELOPER: MWMDRAGON
# REVISED BY: robregen
############################################

sub EVENT_SAY { 
	if($text=~/hail/i) {
		quest::say("Hello. It is always good to meet someone new. I am Lady Shae of the House of Dumas. And what [house] are you from?");
	}
	if($text=~/no house/i) {
		quest::say("Good. I care not to hang around any snobs this evening. Would you be so kind as to buy me some wine?");
	}
	if($text=~/steel warriors sent me/i) {
		quest::say("Thank you for checking into this matter. I told the Militia, but they just ignored me. It appears the dark elves keep coming in leaving mail for [Shintl] Lowbrew. Before I tell you more could you please buy me A white wine please.");
	}
	if($text=~/shintl/i) {
		quest::say("Oh, please!!  Do not mention that horrid little person!  My stay here has turned into a nightmare because of her.  She gets mail delivered to her room every so often by dark elves, of all things.  I cannot stand the Teir'Dal!  I wonder what is in that mail.  If I just had her room key I could walk right up to the innkeeper and say, 'Mail for room tow please.' That is all it would take.  But enough about her.  Let's talk about you buying me some drinks.");
	}
	if($text=~/house of pancakes/i) {
		quest::say("I can tell. You look like you ATE a house of pancakes.");
	}
	if($text=~/house of style/i) {
		quest::say("I would of never guessed by the way you look.");
	}
	if($text=~/dyllin/i) {
		quest::say("Dyllin was the name of a Qeynos guard who was sent to pick up the list I was holding for dear, sweet Antonius. He left just yesterday. If you wish to meet up with him, I heard him say he was going to stop at Highpass Hold.");
	}
}

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 13031 => 1)) { #White Wine
		quest::say("Thank you. Pandos has been telling me to try white wine forever. I mostly only drink red wine. Pardon me for getting off track. Anyway, it is a good thing you showed up. The lady in room 2 has been receiving mail from a Dark Elf. You [need the mail for room two]. The Innkeeper usually holds it for the guests.");
		quest::faction(100,2);  #Felguard - Only NPC in the game with it.
		quest::exp(2500);
	}
	if (plugin::check_handin(\%itemcount, 13030 => 1)) { #red wine
		quest::say("Thank you... Oh my! A few more of these and I will be spilling my secrets");
	}
	if (plugin::check_handin(\%itemcount, 13030 => 2)) {
		quest::say("Oh my.. You are so kind. I can not tell you the last time I had so much fine wine. Well, there was the time Antonius Bayle told me he no longer had the time for a committed relationship. Mister big ruler of the world. Make it to the top and find someone younger. I know his plan. I hate him. I will never trust another human again. After all that, he goes and asks me to hold on to this list for him. Well I am glad it was taken from me by that [Dyllin]. Antonius Bayle has no ties to me any more!! Good riddance! Oooooh! I love him.");
	}
	else {
		quest::say("I do not want this.");
		plugin::return_items(\%itemcount);
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp eq 12) {
		quest::say("I will be back soon, Pandos. Please keep an eye on my room for me.");
		quest::signalwith(9057, 3, 3);
	}
}
