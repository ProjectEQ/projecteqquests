# Winds of Karana
# Broken Lute

sub EVENT_WAYPOINT_ARRIVE {
	if (($wp eq 1) || ($wp eq 3) || ($wp eq 8)) {
		quest::SetRunning(1);
	}
	if (($wp eq 2) || ($wp eq 6) || ($wp eq 10)) {
		quest::SetRunning(0);
	}
}

sub EVENT_SAY {

if($text=~/hail/i){

   quest::say("I can not find my flute, my favorite possesion. Is there anyone who cam [help] me?");
}

if($text=~/help/i){

   quest::say("My flute is missing, I think that old dirty hermit took off with it. He is always taking off with my things.");
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount,13310 => 1)) { # A cracked Flute

   quest::say("Ohh!! I see you got my flute back. For that I can not be thankful enough but while sitting here I spotted what looks to be a sheet of music but it looks incomplete. Maybe you can find out who it belongs to.");
   
   quest::summonitem(13119); # Winds of Karana sheet 2
   quest::faction(135,2); # Guards of Qeynos
   quest::faction(184,2); # Knights of Truth
   quest::faction(192,2); # League of Antonican Bards
   quest::faction(207,-5); # Mayong Mistmoore
   quest::faction(273,-5); # Ring of scale
   quest::exp(50);
   quest::ding();
   
}

}

#END of FILE zone:northkarana ID:13037 -- Cordelia_Minster.pl