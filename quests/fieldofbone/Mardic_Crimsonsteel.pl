sub EVENT_SAY

{
	if($text=~/Hail/i && $ulevel > 45 && $class eq "Berserker" && $handin == undef)
		{
		quest::say("Hail to you, feared one. I see the glint of rage in them eyes of yours there. One day you'll be able to recognize the same in others. I suppose now is the time to talk to you about the mirage around here. Tell you the truth, I wasn't able to beat it myself... that's why I'm out here and not establishing myself as a berserker.");
		quest::say("I wasn't meant for that path. I'm here to guide folk like yourself and help you gain control of the insane beast that lurks inside you. You must be prepared to fight one like yourself. All ye need are your wits, brawn, and skill, nought else. When you are ready give me the note McArik gave you and I'll send you to the training grounds.");
		}


       if($text=~/Hail/i && $ulevel > 45 && $class eq "Berserker" && $handin == 1)
                {
                quest::say("Hail, $name. Run along and give McArik the items he requested.");
                $handin=undef;
                quest::summonitem(60196);
                }

}

sub EVENT_ITEM

{
	if(plugin::check_handin(\%itemcount, 60195 => 1))
		{
		quest::movepc(78,1065,525,176);
		quest::settimer(1,15);
		}

else {
    plugin::return_items(\%itemcount);
  }  
}

sub EVENT_TIMER

{

	if($timer == 1)
		{
		quest::spawn2(78212,0,0,920,518,175,65);  #Berserker’s Image
		quest::stoptimer(1);
		}
}

sub EVENT_SIGNAL

{

	if($signal == 15)
		{
		quest::spawn2(78213,0,0,985,520,175,65);
            $handin=1;
		}
}