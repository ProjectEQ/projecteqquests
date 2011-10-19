sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Die, like a motherless gnoll!");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
}

if($text=~/i am interested/i){
quest::say("I have messages that need to go to Highpass and to Freeport.  Will you [deliver] mail to [Highpass] or [Freeport] for me?");
}

if($text=~/deliver to qeynos/i){
quest::say("Take this letter to Tralyn Marsinger. You can find him at the bard guild hall. I'm sure she will compensate you for your trouble.");
quest::summonitem("18154");
}

if($text=~/deliver to Freeport/i){
quest::say("Take this letter to Felisity Starbright in Freeport.  You can find her at the bard guild hall.  I am sure she will compensate you for your troubles.");
quest::summonitem("18155");
}

if($text=~/what mail/i){
quest::say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more distant offices.  Are you [interested]?"); 
 }

}
