sub EVENT_SPAWN {
  quest::settimer(1,1800);
}

sub EVENT_TIMER {
  quest::emote("chuckles to himself as he notices blades of grass disintegrate beneath his feet. He stares out over the water as if watching for some sign.");
}

sub EVENT_SAY {
  if(($text=~/corruption/i) {
    quest::emote("grins wide at you. 'Corruption? I know nothing of corruption.' He goes back to staring out over the water.");
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 20696 => 1, 20686 => 1, 20685 => 1, 20687 => 1)){
quest::emote("stares at the swirling bottle of essence. His eyes open wide as he realizes what it is. As its warm bright waves wash over him his skin dissolves into a green goo that coats the ground. From his remains a floating white ball is retrieved.");
quest::summonitem("20699");
$npc->Depop(1);
}
 }