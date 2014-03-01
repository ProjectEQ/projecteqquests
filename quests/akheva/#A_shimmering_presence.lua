function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("'s voice invades your mind, drawing images of past present and future together into a perverse harmony. Some images you recognize as your own, but the others seem to be coming from the spirit's own [memories].");
	end
	if(e.message:findi("memories")) then
		e.self:Emote(" begins to glow a bit brighter. Your mind is filled with visions of a great swirl of clouds and lightning. You can almost feel the wind of the storm creeping into the chinks in your armor. It looks as if the storm is creeping across the surface of Luclin. You see several figures standing at the entrance of a [great temple]. The storm seems to be bearing down on them.");
	end
	if(e.message:findi("great temple")) then
		e.self:Emote(" continues to flood your mind with images of the storm bearing down on the temple. Your view suddenly shifts. You're still looking at the storm, but it appears to be moving toward you this time. There is a creature beside you wearing a robe, holding a scepter in one of his...four arms! He is obviously the leader of the group, As he is wearing beautiful [ornate robes] compared to the rest of the four armed figures around you.");
	end
	if(e.message:findi("ornate robes")) then
		e.self:Emote(" glows brighter still as your vision turns to follow the robed figure up the stairs of the entrance to the temple. The figure raises his scepter toward the storm and begins to recite some unfamiliar words. A crackle of magical energy blazes across the sky seemingly in defiance of the raging storm. The energy quickly dissipates however, and the storm continues to bear down on the temple. The figure cries out in pain as the scepter in his hand shatters into many shards. The sofly glowing gem from the scepter head rolls silently down the steps and disappears.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10294})) then
		e.self:Emote(" begins to quiver and shake. The formless entity appears to grow and shrink in complete disregard to natural laws. The light in the temple around you appears to slowly dim until you are surrounded by an impenetrable cloak of shadows. Fear grips your heart as your vision slowly adapts to accommodate the low light. When you can finally make out the figure before you, you find yourself silently praying for the darkness to return.");
		eq.spawn2(179144,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		e.other:AddEXP(10000);
		e.other:Ding();
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--End of File, Zone:akheva  NPC:179165 -- --A_shimmering_presence
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
