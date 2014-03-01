sub EVENT_SAY {
	if($text=~/Hail/i){
		quest::say("Greetings $name.  Do you feel that you are ready to be tested in song?");
	} elsif(($text=~/tested in song/i) && ($class eq "Bard")){
		quest::say("The test of songs holds both joy and sorrow. Choose who you wish to begin with, Denise or Clarisa");
	} elsif(($text=~/Clarisa/i) && ($class eq "Bard")){
		quest::say("I shall summon them for you");
		quest::spawn2(71081,0,0,660.7,1388.9,-766.9,192.6);
		quest::depop_withtimer();
	} elsif(($text=~/Denise/i) && ($class eq "Bard")){
		quest::say("I shall summon them for you");
		quest::spawn2(71082,0,0,660.7,1368.4,-766.9,192.6);
		quest::depop_withtimer();
	}
}
#END of FILE Zone:airplane  ID:610 -- Cilin_Spellsinger 