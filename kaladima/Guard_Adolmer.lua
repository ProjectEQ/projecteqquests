function event_say(e)
	if(e.message:findi("armor")) then
		e.self:Say("If armor it is you're seeking, then go no further than Everhot Forge in North Kaladim.  The Everhots are the finest smiths to have walked Norrath.  Many have come from far and wide to be trained in their skills.");
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("The warriors of Kaladim are the Stormguard.  The fiercest warriors on all Norrath.  Stormguard Hall is in South Kaladim and includes the white marble arena.");
	elseif(e.message:findi("supplies")) then
		e.self:Say("If you are looking for supplies, I can suggest Gurtha's Wares near the bridge in South Kaladim.");
	elseif(e.message:findi("bank")) then
		e.self:Say("You can find Ratsbone Treasury next to the mine entrance in North Kaladim.");
	elseif(e.message:findi("stormguard")) then
		e.self:Say("In South Kaladim you will find the Stormguard, the warrior guild.  They train on the arena grounds.");
	elseif(e.message:findi("rogue guild")) then
		e.self:Say("I have heard rumors of a rogue guild in Kaladim, but have seen none.");
	elseif(e.message:findi("healer")) then
		e.self:Say("If you are injured, I suggest you rush to North Kaladim and visit the Underfoot Cathedral.  Just go through tunnel behind Ratsbone Treasury.");
	elseif(e.message:findi("mine")) then
		e.self:Say("The mines of Kaladim can be entered in North Kaladim.  The opening is adjacent to the Ratsbone Treasury.");
	elseif(e.message:findi("paladin guild")) then
		e.self:Say("Our Paladins of Underfoot can be found to the rear of the Cathedral of Underfoot in North Kaladim.");
	elseif(e.message:findi("cathedral")) then
		e.self:Say("The Cathedral of Underfoot is the home of the clerics and paladins of Kaladim.  It is found in North Kaladim through a tunnel behind Ratsbone Treasury.");
	elseif(e.message:findi("kiln") or e.message:findi("pottery")) then
		e.self:Say("I know of one public kiln and pottery wheel and they are near the bridge in South Kaladim.");
	elseif(e.message:findi("oven")) then
		e.self:Say("There is a public oven in North Kaladim at Greybloom Farm.");
	elseif(e.message:findi("leather")) then
		e.self:Say("If you seek leather goods, stop by Tanned Assets in South Kaladim.  It is near the arena.");
	elseif(e.message:findi("what.* bloodforge")) then
		e.self:Say("The Bloodforge Brigade was created to take the place of the now defunct Irontoe Brigade.  I hear they are a much stronger force to reckon with.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:DoAnim(36); --kneel
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
