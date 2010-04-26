sub EVENT_SAY {
  if ($text=~/hail/i) {
#  if (defined $qglobals{bic} && $qglobals{bic} == 8) {
     quest::say("It's you! The champion everyone has spoken of! Have you come to defy the Muramites?");
     quest::setglobal("riwwiarena",1,5,"H8");
#    }
     }
  if ($text=~/defy/i) {
  if (defined $qglobals{riwwiarena} && $qglobals{riwwiarena} == 1) {
     quest::shout("$name defies you! Do you hear me? $name defies you and will destroy your kind!");
     quest::depop(282096);
     quest::depop(282026);
     quest::unique_spawn(282098,0,0,-174,625,73,129);

 }
 }
 }
sub EVENT_SIGNAL {
  if($signal == 1) { 
    quest::say("Stand fast and prepare for a fight! They're sending a bloodthirsty beast into the arena to kill you as we speak. If you defeat it, place the head in this sack as proof and return it to Turlini. He is the leader of the resistance and may be able to assist you for helping us.");
    quest::summonitem(52223);
} 
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
