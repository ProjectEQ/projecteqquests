sub EVENT_ENTERZONE {
if(!defined $qglobals{destoff}) {
quest::settimer(1,60);
}
    if($hasitem{67739}) {
    $client->Message(15,"You feel protected from the Aura of Destruction");
    }
    if($hasitem{67738}) {
    $client->Message(15,"You feel protected from the Aura of Destruction");
    }
    if($hasitem{67737}) {
    $client->Message(15,"You feel protected from the Aura of Destruction");
    }
    if($hasitem{67736}) {
    $client->Message(15,"You feel protected from the Aura of Destruction");
    }
    else {
    quest::selfcast(5051);
    }
}
sub EVENT_TIMER {
    if($hasitem{67739}) {
    $client->Message(15,"You feel protected from the Aura of Destruction");
    }
    elsif($hasitem{67738}) {
    $client->Message(15,"You feel protected from the Aura of Destruction");
    }
    elsif($hasitem{67737}) {
    $client->Message(15,"You feel protected from the Aura of Destruction");
    }
    elsif($hasitem{67736}) {
    $client->Message(15,"You feel protected from the Aura of Destruction");
    }
    else {
    quest::selfcast(5051);
    }
}
sub EVENT_CLICKDOOR {
if($doorid == 9) {
    if(($oncursor{67707}) && ($qglobals{gaschmb1} == 1)) {
	quest::forcedooropen(9);
	quest::setglobal("gaschmb1complete",1,3,"H6"); 
        quest::depop(292051);
    }
    elsif(($oncursor{67708}) && ($qglobals{gaschmb1} == 2)) {
	quest::forcedooropen(9);
	quest::setglobal("gaschmb1complete",1,3,"H6"); 
        quest::depop(292051);
    }
    elsif(($oncursor{67709}) && ($qglobals{gaschmb1} == 3)) {
	quest::forcedooropen(9);
	quest::setglobal("gaschmb1complete",1,3,"H6"); 
        quest::depop(292051);
    }
    elsif(($oncursor{67710}) && ($qglobals{gaschmb1} == 4)) {
	quest::forcedooropen(9);
	quest::setglobal("gaschmb1complete",1,3,"H6"); 
        quest::depop(292051);
    }
    else {
    quest::selfcast(5054);
    }
}
if(($doorid == 8) && (defined $qglobals{gaschmb1})) {
    quest::selfcast(5054);
}
if($doorid == 12) {
    if(($oncursor{67707}) && ($qglobals{gaschmb2} == 1)) {
	quest::forcedooropen(12);
	quest::setglobal("gaschmb2complete",1,3,"H6");
        quest::depop(292052); 
    }
    elsif(($oncursor{67708}) && ($qglobals{gaschmb2} == 2)) {
	quest::forcedooropen(12);
	quest::setglobal("gaschmb2complete",1,3,"H6"); 
        quest::depop(292052); 
    }
    elsif(($oncursor{67709}) && ($qglobals{gaschmb2} == 3)) {
	quest::forcedooropen(12);
	quest::setglobal("gaschmb2complete",1,3,"H6"); 
        quest::depop(292052); 
    }
    elsif(($oncursor{67710}) && ($qglobals{gaschmb2} == 4)) {
	quest::forcedooropen(12);
	quest::setglobal("gaschmb2complete",1,3,"H6"); 
        quest::depop(292052); 
    }
    else {
    quest::selfcast(5054);
    }
}
if(($doorid == 11) && (defined $qglobals{gaschmb2})) {
    quest::selfcast(5054);
}
if($doorid == 4) {
    quest::setglobal("uqualockout", 1,3,"D3");
}
if($d_id == 3) {
    if((defined $qglobals{uquaragedoor}) && ($qglobals{uquaragedoor} >= 1)) {
       quest::forcedooropen(3);
	}
     }
if($d_id == 2) {
    if((defined $qglobals{uquafurydoor}) && ($qglobals{uquafurydoor} >= 1)) {
       quest::forcedooropen(2);
	}
    }
}
sub EVENT_SIGNAL {
    if($signal == 1) { 
	$counter += 1;
    }
    if($counter == 2) {
	if(!defined $qglobals{destper}) {
	quest::stoptimer(1);
	quest::setglobal("destoff",1,3,"H6");
	$client->Message(15,"The Altar of Fury and Altar of Rage hum in harmony. A bright flash of light illuminates the room momentarily, causing the tendrils of murky shadow to dissipate. The Aura of Destruction has faded away.");
	quest::ze("A strange voice shouts, You fools! While you may have stopped the rituals of fury and rage, you are still too late to prevent me from transferring the power of Trushar into our stone guardian. If you wish death, then continue into my chambers!");
	}
	else {
    	$client->Message(15,"The Altar of Fury and Altar of Rage hum in harmony. A bright flash of light illuminates the room momentarily, causing the tendrils of murky shadow to dissipate. The Aura of Destruction has faded away.");
	quest::ze("A strange voice shouts, You fools! While you may have stopped the rituals of fury and rage, you are still too late to prevent me from transferring the power of Trushar into our stone guardian. If you wish death, then continue into my chambers!");
	}
    }
}