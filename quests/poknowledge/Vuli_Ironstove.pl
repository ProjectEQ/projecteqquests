sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome. traveler! The Ironstoves pride ourselves upon our goods. for no other baker in the whole of the cosmos can hold a candle to our quality. Please. search my inventory and if you do not find that which you are searching for. then search my brethren's stock. I guarantee that among the five of us. you will find the exact ingredient you seek."); }
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
#END of FILE Zone:poknowledge  ID:202089 -- Vuli_Ironstove 

