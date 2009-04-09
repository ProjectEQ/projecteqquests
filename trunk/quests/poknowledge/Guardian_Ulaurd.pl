sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Kartis district of [New Tanaan]. comrade.  May you gain power through knowledge."); }
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
	quest::signal(202274,5); #Nomaad
}
#END of FILE Zone:poknowledge  ID:202116 -- Guardian_Ulaurd 

