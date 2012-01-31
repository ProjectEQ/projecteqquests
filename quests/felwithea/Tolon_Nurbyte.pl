sub EVENT_SPAWN {
	quest::settimer("visit",150);
}

sub EVENT_TIMER {
	if($timer=="visit") {
		quest::depop();
	}
}

sub EVENT_AGGRO {
	quest::say("Let no evil beings stand in the way of the righteousness of the Paladins of Tunare!");
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Didn't your mother teach you not to walk in other people's rooms without knocking?! You didn't even have the courtesy to close the door behind you!!");
	}
	if($text=~/princess lenya thex/i) {
		quest::say("What?!!  You have word of the Princess?  She has been missing for quite a while.  I sent Tearon to Tunaria to search for her, but he has not reported back.  If you wish to help, you'd better prove yourself worthy first. I believe you should talk to Tynkale.");
	}	
	if((($text=~/the glory of the mother shines bright/i) || ($text=~/wish to leave/i)) && ($faction > 4)) {
		quest::say("When you have furthered your service to the Paladins of Tunare. we shall make conversation.");
	}
	if(($text=~/the glory of the mother shines bright/i) && ($faction < 5)) {
		quest::say("So you're the slayer of Jojongua. Funny, I thought you would be taller. I guess you will have to do. I am Tolon Nurbyte of the Silent Watch. We do all the dirty work of King Tearis Thex. No one knows of us. So I hope you accept this mission or I will have to kill you. Do you [accept the mission] or do you [wish to leave]?");
	}
	if(($text=~/wish to leave/i) && ($faction < 5)) {
		quest::say("There is only insufferable labor and merciless torment here, stranger. Kaya Rishareth has condemned her eternal self to servitude in the War Forge -- her selfless act malignantly repaid by the gods with this existence. Her spirit died here long ago and her life's [effort and struggles] were ultimately for naught.");
		quest::attack($name);
	}
	if(($text=~/accept the mission/i) && ($faction < 4)) {
		quest::say("In her mortal life, Kaya Rishareth was a keeper of tranquility and served her beloved child-like goddess with every fiber of her being. A native to the free city of Freeport, Kaya found herself traveling on her own as soon as her master would allow. Erudin was the destination she chose and it was the temples dedicated to The Tranquil where she sought to learn more about her goddess and perhaps share philosophies and knowledge with the High Men. Erudin received her graciously and for nearly a year, she studied the High Men's way of worship and reverence to their shared deity. However, tranquility is easily disrupted and those who seek it, must also [defend it].");
	}
	if(($text=~/silent watcher/i) && ($faction < 4)) {
		quest::say("The Silent Watch was established in the early years of Felwithe. King Tearis Thex had many cruel deeds to do. The regular Koad'Vie were too righteous to carry out any of the necessary missions and we dare not bring in the Fier'Dal. After all, some of the operations were against Kelethin.  King Tearis formed our group from Koada'Dal not of such prim and proper breeding. Now we act as his secret guard and report only to him.");
	}	
	if((($text=~/accept the mission/i) || ($text=~/silent watcher/i)) && ($faction > 3)) {
		quest::say("When you have furthered your service to the Paladins of Tunare. we shall make conversation.");
	}
} #further dialogue is unknown at this time.

