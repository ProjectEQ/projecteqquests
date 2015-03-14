sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Ho there.  Whatcha want?  Yer interruptin' Arboast's story- he was just in the middle of laying some truth on me."); 
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::say("Yeah, you tell 'em Arbogast!  I bet this one doesn't even know what's going on right under his nose in this here city.  Like for example, you probably don't even know the truth about about his importantness Phenic Dionicas do you?");
	}
	if($signal == 2) {
		quest::say("Yeah, splash it right in his unliving face!");
	}
	if($signal == 3) {
		quest::say("Ooh! I know, I know!  Nathyn Illuminious!!!");
		quest::signalwith(160112,1,2500);
	}
	if($signal == 4) {
		quest::emote("beams a smile your way.");
	}
	if($signal == 5) {
		quest::say("A bloody, boldfaced lie!");
		quest::signalwith(160112,2,2500);
	}
	if($signal == 6) {
		plugin::DoAnim("cheer");
		quest::signalwith(160112,4,500);
	}
	if($signal == 7) {
		quest::start(24);
	}
	if($signal == 8) {
		quest::emote("and Arbogast do their business with the bank, Miller retrieving a heavy brown cloak and Arbogast a beautiful golden clasp. They look up at each other, unable to bear the thought of actually parting with their treasures when Arbogast says, 'You know what? I think we'll keep them. Thanks for your help, don't be a stranger. Come now Miller, let's not be a bother.' With that, they both tear off out the door");
		quest::signalwith(160112,5,2500);
	}
	if($signal == 9) {
		quest::say("Wait for me!");
		quest::spawn2(160376,26,0,$x,$y,$z,$h);
		quest::depop_withtimer();
	}
}