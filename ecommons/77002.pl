
#zone: tutorialb
#Oof

sub EVENT_SPAWN {
    #:: Create a proximity, 40 x 40 units, without proximity say
    quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 50, $z + 50, 0);
}

sub EVENT_SAY {
    if ($text=~/hail/i)  {
        my $random = int(rand(5));
	    if($random == 0) {
		    quest::say("What you want, $race?");
	    }
	    if($random == 1) {
		    quest::say("Blah, blah, blah!");
	    }
	    if($random == 2) {
		    quest::say("Too much talking! Want to do more fighting!");
	    }
	    if($random == 3) {
		    quest::say("Why $race always talk?!");
	    }
        if($random == 4) {
		    quest::say("Me bet you hit like radroach! Whatever dat is....");
	    }
    }

}

sub EVENT_COMBAT {
    #:: combat state 0 = False, 1 = True
    #if ($combat_state == 1) {

    #}
}

sub EVENT_ENTER {
    if($client->GetEXP() == 0) {
        quest::modifynpcstat("special_attacks",ABfHG);#immune melee, magic, fleeing, aggro
        quest::doanim(59,5);
        quest::emote("shakes his head in disgust. 'You too green, $race. Go kill sumfin, den me show you how fight!'");
        #quest::settimer(1,60);
        $npc->WipeHateList();
    } 
    else {
        quest::modifynpcstat("special_attacks",null);
        quest::doanim(60,5);
        quest::emote("glares. 'You want fight, $name?! Take best shot!'");
    }
}

sub EVENT_EXIT {
    quest::modifynpcstat("special_attacks",ABfHG);#immune melee, magic, fleeing, aggro
    quest::doanim(29,5);
    quest::emote("grins and waves, 'Ok, luv ya! Buh bye!'");
    #quest::settimer(1,60);
    $npc->WipeHateList();
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
