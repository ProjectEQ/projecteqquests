sub EVENT_SAY {
  if ($text=~/hail/i) {
    if(defined $qglobals{god_qvic_access}) {
    quest::emote("gestures to the end of the cavernous hallway.");
    quest::say("Beyond that corner lies the entrance to the forgotten chapel of Inktu'ta. The force of the blast from the portal's implosion tore a hole in the mountain, revealing the way to this place. Some things should remain unknown. Inktu'ta should have stayed buried forever. Believe me $name only a fool would disturb the halls of this cursed chapel. Will you [heed my warning] or do you wish to [continue]...?");
    }
  }
  if ($text=~/wish to continue/i) {
    if(defined $qglobals{god_qvic_access}) {
      quest::say("Very well! If you will not heed my warning, then you have chosen to suffer the consequences. I grant you entrance to Inktu'ta.");
#add instance 
     }
  }
}