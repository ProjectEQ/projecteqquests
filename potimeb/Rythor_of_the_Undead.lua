function event_death_complete(e)
	-- send a signal to the #undead_trigger that I died
	eq.signal(223171,2); -- NPC: phase_one_undead
end

--[[
sub EVENT_DEATH_COMPLETE {
    quest::signalwith(223188,14040,0); -- NPC: An_Air_Phoenix_Noble_
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }
--]]