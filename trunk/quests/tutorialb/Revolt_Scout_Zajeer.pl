#zone: tutorialb
#npc: Revolt Scout Zajeer
# quests:
# - Scouting Gloomingdeep - taskid:32 - starts/completes
# - Sabotage - taskid:31 - Starts

sub EVENT_SAY {
   if($text=~/Hail/i) {
      if (quest::istaskactivityactive(32,4)) {
         quest::emote("smiles as you return. \'Heya, welcome back, frien'. You proving ta be a worthy scout fer our revoltin'. Arias even t'inks you be da one to lead da attack 'ginst da kobold stronghold. We see 'bout dat, tho'. We see...'");
         quest::updatetaskactivity(32,4);
      }
      else {
         quest::say("Shhhh.  We just swum up thro' da secret tunnel.  Not even koboldies know it.  Lead 'em back 'ere and we'll bash 'em good.");
         quest::taskselector(31,32);
      }
   }
} 