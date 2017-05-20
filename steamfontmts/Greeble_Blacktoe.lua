function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["berserk_epic"] == "9" ) then
		if (e.message:findi("hail")) then
			e.other:Message(0,"Your approach seems to catch the Gnome a little off guard as he's visibly shaken by your presence. 'What can Greeble do for a berserker who is so far from home? Greeble can't have anything that ye might need, can he? What's that ye say, yer lookin fer sumthing that ye can power yer fancy axe with? Greeble knows jest the thing!");
		elseif(e.message:findi("fancy axe")) then
			e.self:Say("What do ye think I am, some sort of fergetful gnome!? Give me a minute, would ya!?' he says, as he looks around scratching his head. 'Ah, yes, me thinks you need a Lightning Core. These lightning cores are only found where the discordant energy flows freely. Seek out these lands and ye shall surely find what you are looking for.");
		end
	end	
end