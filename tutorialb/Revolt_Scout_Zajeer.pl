#zone: tutorialb
#npc: Revolt Scout Zajeer
# quests:
# - Scouting Gloomingdeep - taskid:5095 - starts/completes
# - Sabotage - taskid:5097 - Starts
# items: 86011

sub EVENT_SAY {
   if($text=~/hail/i) {
      if (quest::istaskactivityactive(5095,4)) {
         quest::emote("smiles as you return. \'Heya, welcome back, frien'. You proving ta be a worthy scout fer our revoltin'. Arias even t'inks you be da one to lead da attack 'ginst da kobold stronghold. We see 'bout dat, tho'. We see...'");
         quest::updatetaskactivity(5095,4);
      }
      else {
         quest::say("Shhhh.  We just swum up thro' da secret tunnel.  Not even koboldies know it.  Lead 'em back 'ere and we'll bash 'em good.");
        quest::taskselector(5097,5095);
      }
   }
} 

sub EVENT_TASKACCEPTED {
        if($task_id == 5097) {
      quest::summonitem(86011); # Item: Makeshift Lantern Bomb
      # Makeshift Lantern Bomb
   }
} 