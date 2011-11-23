sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 17) {
    quest::emote("stops skipping and looks around, 'Uh oh'");
	}
	if($wp == 43) {
    quest::emote("glances about, looking a bit lost. 'Well this doesn't look like a place I belong in at all'");
	}
	if($wp == 49) {
    quest::say("Uh oh? this looks dangerous, I don't think I am allowed to be here.");
	}
	if($wp == 51) {
    quest::emote("notices the pile of bones next to her and shudders, 'Eeep! I wonder what happened to him.");
	}
	if($wp == 57) {
    quest::say("Hi, how do I get outside, huh?");
	}
	if($wp == 58) {
    quest::emote("smiles at the sight of daylight, 'Ahhh yes, this is the way!'");
	}
	if($wp == 66) {
    quest::emote("squints around, thinking hard, 'Hrmmm, this does look familiar. I think i came from this-a-way.'");
	}
	if($wp == 68) {
    quest::say("Oh look, there it is!");
	}
	if($wp == 80) {
    quest::emote("Yawns tiredly and says, 'That was fun. Time for me to go to sleep though.' She crawls under the blanket and falls sound asleep.");
	}
}

sub EVENT_SPAWN {
	quest::signalwith(155041,2,10);
}

sub EVENT_SAY {
	my $a = 155339;
	if(($wp < 17) && ($text=~/Hail/i)){
		quest::say("Hello, my name is Shainai and I am on a very important mission for my Daddy. He ran out of buttons for the officers' clothes so I have to get him more. I am an excellent helper.");
	}
	if(($wp > 60) && ($text=~/Hail/i)){
		quest::say("Hi there, I am headed home before I get in trouble.  I got a little lost, but I am ok now.  I hope Daddy isn't too mad.  Bye bye!");
	}	
	if((($wp > 16) && ($wp < 61)) && ($text=~/Hail/i)){
		quest::say("Hi. I was getting some buttons for Daddy and I got a little lost. I know the way, I mean it...but if you wanted to [follow] me home to make sure I got there safe and all, you could.");
	}
	if((($wp > 16) && ($wp < 61)) && ($text=~/follow/i)){
		quest::say("You will?!? Oh good, now I won't be so lonesome. Here hold my bag of buttons if you please, my arms are tired. Ready? Follow me now, I know the way.  'Shainai pauses and looks around, ' Hmmmm...");
                quest::ding();
		quest::summonitem(4460);
	}
	if((($wp > 16) && ($wp < 27)) && ($text=~/follow/i)) {
		quest::spawn2($a,29,0,401,135,-188,0);
		$npc->Depop(1);
	}
	if((($wp > 26) && ($wp < 32)) && ($text=~/follow/i)) {
		quest::spawn2($a,27,0,129,169,-248,0);
		$npc->Depop(1);
	}
	if((($wp > 31) && ($wp < 38)) && ($text=~/follow/i)) {
		quest::spawn2($a,28,0,95,188,-248,0);
		$npc->Depop(1);
	}
	if((($wp > 37) && ($wp < 61)) && ($text=~/follow/i)) {
		quest::spawn2($a,30,0,-373,190,-236,0);
		$npc->Depop(1);
	}
}