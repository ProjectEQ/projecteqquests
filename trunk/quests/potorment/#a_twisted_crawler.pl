sub EVENT_DEATH {
	#spawn Tylis
	quest::spawn2(207014,0,0,-1,-7,468,128);
	#depop all the minions
	quest::depopall(207069);
	#set maareq's respawn, without this line he will repop on zone reset
	#quest::updatespawntimer(42165,43200000); #fixed respawn
	quest::updatespawntimer(42165,(int(rand(4320))+41040)*1000); #respawn with variance
}