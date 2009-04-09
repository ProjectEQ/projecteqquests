#zone: gunthak NPC:a_pale_corpse (224196)
#Angelox
#Aria of Asceticism (bard quest)
#quest is Titanium version

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	$npc->SetAppearance(3);
}