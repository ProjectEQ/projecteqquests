#generic soulbinder quest
sub EVENT_SAY { 
	plugin::soulbinder_say($text);
}

sub EVENT_SIGNAL {
	quest::emote("smiles brightly 'Ah, you are so kind to ask.  I'll have a light beer, if it's convenient.  Hey, when do you get off work?'");
}