sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Selia district of [New Tanaan].  Be sure to help us to keep it clean!"); }
}

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	quest::signal(202273,5); #Qadar
}

#END of FILE Zone:poknowledge  ID:202097 -- Guardian_Adew 

