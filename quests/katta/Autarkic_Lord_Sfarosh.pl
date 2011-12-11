sub EVENT_SPAWN {
	quest::settimer(1,800);
}

sub EVENT_TIMER {
	quest::depop();
}


sub EVENT_SIGNAL{
	if($signal == 1){
		quest::say("Meddling fleshlings! Why have you pulled back to this forsaken castellum? Do you fear that I will seek vengeance on Nathyn Illuminious and the city that shelters him for my years of captivity here? Or do you seek something more dangerous, knowledge of the dark path of shadows?");
		quest::signalwith(160472,1,5000); #Incantator_Jak_Masric
		quest::modifynpcstat("npcspecialattks","ABfHG");
	}
	if($signal == 2){
		quest::say("A simple question indeed. I simply supplied him with Akhevan blood for his experimentation, that is all. The Order of Autarkic Umbrage is no friend of the Akheva and it was possible that his research could uncover some useful information for my order. Valdanovs own motivation for his experimentation was none of my concern, but the outcome is quite fascinating I must admit.");
		quest::signalwith(160473,1,5000); #Praecantor_Sels_Dawneyes
	}
	if($signal == 3){
		quest::say("I am amazed at how little you fleshlings know of what occurs within the very walls of your own castellum. It is known by my Order that Akhevan blood has strange mutagenic effects on the bodies of non-akheves if introduced to their circulatory systems. The process by which the Shadow Tegi are infused with the blood is quite complicated and painful but I would deduce that a vampyre like Valdanov merely had to ingest the blood for the mutagenic agents to effect his physiology, causing the permenent change into what I believe you call a Vampyre Volatilis. I have no dealings with Valdanov since his mutation as I was imprisoned in Nathyns mansion until freed by these foolish fleshings.");
		quest::signalwith(160471,1,5000); #Theurgus_Ajeea_Polaja
	 }
	if($signal == 4){
		quest::say("I was paying a visit to Valdanov with more Akhevan blood, not knowing he had already been banished by Nathyn from Katta Castellum for becoming the monster that he became. I must admit, Nathyn is a powerful and cunning creature. He was prepared for my arrival, captured me with his sorceries, and imprisoned me in that enchanted chest. I was not offered an explanation, nor do I know how he discovered my dealings with Valdanov, I assume he obtained that knowledge from questioning Valdanov about his mutation.");
		quest::say("It seems some allies are arriving! Foolish fleshlings, run while you have the chance!");
		quest::signalwith(160471,2,5000); #Theurgus_Ajeea_Polaja
	}
	if($signal == 5){
		quest::say("Your feeble fleshling magic has failed you! Your souls shall be slaves of the Order of Autarkic Umbrage!");
		quest::signalwith(160473,3,5000); #Praecantor_Sels_Dawneyes
	}
	if($signal == 6){
		quest::say("Attempt to slay me if you so desire, and if you succeed it matters not. I will return as I am a creature of shadows and shadows never die, merely slumber!");
		quest::spawn2(160437,0,0,-31,-764,4,160); #an autarkic umbrage shade
		quest::spawn2(160437,0,0,-160,-762,4,101); #an autarkic umbrage shade
		quest::spawn2(160437,0,0,-162,-892,4,35); #an autarkic umbrage shade
		quest::modifynpcstat("npcspecialattks","f");
	}
}

