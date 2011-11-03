#wood elf ranger dude 
#npc - Elmion Hendrys
#zone - Dagnors Cauldron
#by Angelox

# Elmion Hendrys says 'How are you?  Please rest.  Have you [been wounded by the beasts] of this region?'
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("How are you?  Please rest.  Have you [been wounded by the beasts] of this region.");
}
if($text=~/wounded/i){
$npc->CastSpell(200,$userid);
 }
}

sub EVENT_SIGNAL {
quest::say("Pipe down, Ghil!!  We have no quarrel with this adventurer.");
}

sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("You have met your match!!");
	}
}

sub EVENT_DEATH {
	quest::say("You have earned the vengeance of Faydark's Champions");
}