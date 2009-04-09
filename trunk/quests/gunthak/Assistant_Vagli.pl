#zone: gunthak NPC: Assistant_Vagli (224210)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("Greetings, friend. If you have come to study under the great Alvarik you have come to the right place! I help by carrying his research tomes for him. If there is one you would like to buy, feel free to browse through what we have. If you're looking for something to do, I may have a [task] available for you to get started on. Alvarik has much he needs done and I can't do it all myself!");
 }
}

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	$npc->SetAppearance(1);
}