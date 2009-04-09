sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. traveler! If you have come searching to restock on reagents. then I am most glad to see you. Please. browse my wares and purchase whatever you need from my stock."); }
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
#END of FILE Zone:poknowledge  ID:202136 -- Peras_Glickon 

