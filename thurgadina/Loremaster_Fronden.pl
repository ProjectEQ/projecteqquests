sub EVENT_SIGNAL {
	if($signal==1) {
		quest::emote("raises an eyebrow at Horasug.");
		quest::signalwith(115013,2,11000); # NPC: Horasug
	}
	if($signal==2) {
		quest::say("Saramor, please remind me to water down the spirits a bit.");
		quest::signalwith(115011,5,8000); # NPC: Rumagur
		quest::signalwith(115187,5,8000); # NPC: Rumagur
	}
	if($signal==3) {
		quest::say("So I was polishing up the bar the other day when in hops this piece of rope and says, 'I'll take a bottle of Frostreaver's Frozen Vodka.' I look at him and I says, 'We don't serve no ropes here, now beat it!' Hehe. . .");
		quest::signalwith(115011,6); # NPC: Rumagur
		quest::signalwith(115187,6); # NPC: Rumagur
	}
	if($signal==4) {
		quest::say("Not ten minutes later a piece of rope comes hoppin' in and says the same thing, only this one's tied up in the middle and one end is all messed up. So I says, 'Hey, ain't you the same piece o' rope I just kicked outta here?'");
		quest::signalwith(115011,7); # NPC: Rumagur
		quest::signalwith(115187,7); # NPC: Rumagur
	}
	if($signal==5) {
		quest::say("He looks me dead in the eyes and says, 'Nope, I'm afraid not.' <grin>");
		quest::signalwith(115011,8,8000); # NPC: Rumagur
		quest::signalwith(115187,8,8000); # NPC: Rumagur
	}
	if($signal==6) {
		quest::say("Hmm, let's see here, aah yes. This is a special bottle handed down to me by my father, and it's been in my family for ages. Not really sure what it's made of, but yer welcome to give it a try.");
		quest::signalwith(115011,9,8000); # NPC: Rumagur
		quest::signalwith(115187,9,8000); # NPC: Rumagur
	}
	if($signal==7) {
		quest::emote("watches as Rumagur pours the contents of the bottle into his mouth.");
		quest::signalwith(115011,10,8000); # NPC: Rumagur
		quest::signalwith(115187,10,8000); # NPC: Rumagur
	}		
}