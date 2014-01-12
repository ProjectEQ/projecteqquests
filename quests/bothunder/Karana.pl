sub EVENT_SPAWN {
  quest::settimer(1,1800);
}

sub EVENT_SAY {
	if ($pop_bot_agnarr == 1) {
		if ($text=~/Hail/i) {
			quest::emote("looks down at $name's face. He seems so insignificant next to the massive stature of the Rainkeeper. 'Don't worry mortal, Askr is unharmed, I have set him on a journey that will take him to all corners of this reality. He will either find the balance of the Fallen or he will die trying. And what of you champions? Do you wish to [" . quest::saylink("follow the path of the Fallen") . "]? A more dangerous path has never existed. Defy the will of the Pantheon at your peril.");
		}

		if ($text=~/follow the path of the fallen/i) {
			quest::emote("begins to laugh quietly. You seem to notice a great storm cloud brewing once more above him. A sudden arching bolt hits you, but you are unharmed. Instead a tome written in the language of the gods appears in your hands. 'Then let what I know be yours to know as well. Your path leads you onward $name. The path to power or ruin, the choice is up to you. Speak the words and I will send you on your way.");
			quest::setglobal("pop_bot_karana",1,5,"F");
			$client->Message(4,"You receive a character flag!");
		}
	}

{
$pop_bot_agnarr=undef;
$pop_bot_karana=undef;
}
}

sub EVENT_TIMER {
  if ($timer == 1) {
     quest::stoptimer(1);
     quest::depop();
  }
}

# End of File  Zone: BoThunder  ID: 209108 --Karana
# Romai