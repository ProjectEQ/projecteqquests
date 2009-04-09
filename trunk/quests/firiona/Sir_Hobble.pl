#Zone: Firiona  NPC: Sir_Hobble (84297)
#Qadar

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::emote("holds a cracked monocle up to his squinty eye.  'I say!!  A talking bear!!  Squire Fuzzmin, come and take a gander at this rare find.  The wonders never cease in the land of Kunark!!' ");
    quest::unique_spawn(84312,0,0,1985,-2243,-75);      # Spawn Squire_Fuzzmin for Wurmslayer quest
    quest::delglobal("hobble");                       
    quest::setglobal("hobble",$npc->GetID(),"3","F");   # Set global $hobble with Sir_Hobble's NPC ID so Squire_Fuzzmin can follow
    $hobble=undef;
  }
}


# For Wurmslayer quest
# Quest depends on Squire_Fuzzmin.pl in Firiona for complete functionality