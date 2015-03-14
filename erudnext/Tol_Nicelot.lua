function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I have no time to waste with strangers!"); 
	elseif(e.message:findi("moodoro")) then
		e.self:Say("Yes, I knew Moodoro Finharn. He used to be a good friend until he started visiting Qeynos and indulging in human vices. He was executed for crimes against the state. Not even his sister Nolusia could get the charge dropped. There have been some who say he escaped execution and lives in Qeynos. That is insane babbling."); 
	elseif(e.message:findi("nolusia")) then
		e.self:Say("Nolusia is a member of the Craftkeepers. She lives as a guildmaster in Erudin Palace.");
	end
end

-- END of FILE Zone:erudnext  ID:98035 -- Tol_Nicelot