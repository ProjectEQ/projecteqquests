-- items: 13718, 18970, 13722
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. ".  I am Niclaus Ressinn. loyal Paladin of Life. I am scouting the Qeynos Hills on orders from High Priestess Jahnda.  We have received reports of undead prowling these hills of late.");
	elseif(e.message:findi("undead prowling")) then
		e.self:Say("'I believe the undead prowl these hills at night. I have found the remains of several adventurers who obviously had the misfortune of running into some of Bertoxxulous' dark minions. One young human was still cluching this parchment in his cold, dead fist.");
	elseif(e.message:findi("parchment")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("I believe it is from a spell book of some kind and I do not have a working knowledge of things arcane. Perhaps you could help? Take it. I am sure someone in Qeynos could decipher it. I must remian here to gather more evidence but please return to me with anything you discover.");
			e.other:SummonItem(13718);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self, e.other);

	if(item_lib.check_turn_in(e.trade, {item1 = 18970}, 0)) then
		e.self:Say("Oh, things are becoming dire here in Norrath. May Rodcet protect us! I have gathered most of the evidence I will need to present to Jahnda, but I could still use your assistance with one final piece. I need to recover a rib bone from of the undead beasts that wander these hills. Be sure the rib bone comes from one of the putrid skeletons. They are the spawn of Bertoxxulous.");
		eq.set_global("niclaus","1",1,"H12");
	elseif(qglobals["niclaus"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 13722}, 0)) then
		e.self:Say("Excellent! Rodcet smiles upon us this day! Here, please take this pouch of evidence to Jahnda in the Temple of Life. She will know what we must do. I will remain here to keep an eye out for the minions of Bertoxxlous. Also, accept this small reward as a token of my appreciation of your efforts to rid Norrath of the influence of the Plaguebringer.");
		eq.delete_global("niclaus");
		-- Confirmed Live Factions and Experience
		e.other:Faction(341,50); -- Priest of Life
		e.other:Faction(280,15); -- Knight of Thunder
		e.other:Faction(262,25); -- Guards of Qeynos
		e.other:Faction(221,-12); -- Bloodsabers
		e.other:Faction(219,7); -- Antonius Bayle
		e.other:QuestReward(e.self,{copper = math.random(0,10),itemid = 13724,exp = 4000});
	end
	if(item_lib.return_items(e.self, e.other, e.trade, false) == true) then
		e.self:Say("I'm... erm, not quite sure what to do with this, but... thanks, I guess.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 4 or e.wp == 8) then
		e.self:DoAnim(62);
	elseif(e.wp == 5) then
		e.self:SetRunning(true);
	elseif(e.wp == 6) then
		e.self:DoAnim(29);
	elseif(e.wp == 7) then
		e.self:Say("Guard! Come quick! The undead gather near the ruins of Geupal!");
		e.self:SetRunning(false);
	elseif(e.wp == 9) then
		e.self:DoAnim(7);
	elseif(e.wp == 10) then
		e.self:Say("Shh.. The fiends seems to dwell amongst the ruins. They wander off but eventually congregate back here. Shh.. OK NOW! RODCET PROTECT US!");
		e.self:SetRunning(true);
	elseif(e.wp == 11) then
		e.self:SetRunning(false);
	end
end
