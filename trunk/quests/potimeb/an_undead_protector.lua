function event_death_complete(e)
	-- send a signal to the #undead_trigger that I died
	eq.signal(223171,2);
end

--[[
sub EVENT_DEATH_COMPLETE {
    quest::signalwith(223188,14040,0);
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }
--]]