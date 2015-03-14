sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("The mystics of New Tanaan greet $name openly. Do not be afraid of Pikor. for my appearance betrays my nature in this place. All are Pikor's equals. and none below me. I am a mystic of Innoruuk. but my faith in the dark father is not of blood and death any longer. Pikor is of knowledge and power beyond Norrath. and I must cast down my guidance of the eye and turn to the spirit. as shall you when your time comes. If you are a shaman. Pikor may guide you as I have scribed my memory of spells no longer useful here for shaman who seek and need the power."); }
}

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	quest::signal(202274,5); #Nomaad
}

#END of FILE Zone:poknowledge  ID:202180 -- Mystic_Pikor 

