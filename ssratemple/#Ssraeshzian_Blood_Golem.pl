# quests/ssratemple/#Ssraeshzian_Blood_Golem.pl
sub EVENT_DEATH_COMPLETE {
  quest::ze(15, "[Golem] Death -> signaling EmpCycle once.");
  quest::signalwith(162260, 1, 0);   # start EmpPrep
}
