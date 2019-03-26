sub EVENT_DEATH_COMPLETE {
  quest::signalwith(294085,1,0); # NPC: Malevolent_Priest
  quest::ze(0,"The constrained servitor is allowed to rest at last. The priests he was serving have been weakened by his death.");
}