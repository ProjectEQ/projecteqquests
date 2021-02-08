function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". You have fought long and hard to make it into this secret chamber. What is it you [seek]?");
	elseif(e.message:findi("seek")) then
		e.self:Say("Come, come now. Don't tell me that you fought your way here for no reason? This is the domain of Vtiink Vzaan the Muramite weaponmaster and he does not take kindly to strangers entering his domain. I cannot leave for I am trapped here, but you are not, so unless you [wish to meet] with Vtiink then I would suggest you leave now.");
	elseif(e.message:findi("wish to meet")) then
		e.self:Say("Then you wish death, no matter I cannot force your hand I can only grant your request but the only time he spends in this place is when his soldiers need their weapons repaired or replaced. He is very proud of his work and if a weapon is slightly tarnished he considers it destroyed. Now if you could bring me a broken sword blade, a jagged spear tip, a chipped hammer head and some tarnished knuckles from his elite guards, I will arrange a meeting. What happens after that is up to you, while I do not see a happy ending for you the will of fate is quite fickle.");
  end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 67519})) then	-- Tuned Farstone
		e.self:Say("While I applaud your effort, I must decline. You see, since I was captured I have been altered by the beings known as ikaav. As a result, my aura has changed, making this farstone useless. I do not know what it is I am becoming, but I will not place the lives of the brotherhood in danger. I have decided to give in to the inevitable and serve these beings. Please tell Taminoa I am sorry, but this is for the best. And please give him this. As I slip deeper and deeper into insanity, I have lost my ability to articulate my thoughts on paper. This is one of my last written reports and I think Taminoa will find it quite interesting.");
		e.other:SummonItem(67520); --Item: Sealed Report
	elseif (item_lib.check_turn_in(e.trade, {item1 = 67521,item2 = 67522,item3 = 67523,item4 = 67524})) then 
		e.self:Emote("takes each weapon piece from you one by one and places them on the ground. He looks to the ceiling and says, 'Vtiink, there are some weapons here that need to be replaced and some intruders who need to be destroyed.' Suddenly the dank air in the room becomes ominous as a twisted monstrosity appears before you. Smith turns to you all and says, 'There is no more time. Your gods cannot save you now.' Vtiink sends out a wave of energy that forces Smith to crumple.");
	  eq.unique_spawn(284092,0,0,1413.38,-491.76,106.13,384); -- NPC: Weapon_Master_Vtiink_Vzaan
  	eq.unique_spawn(284093,0,0,1328.82,-608.43,106.23,5.2); -- NPC: Master`s_Apprentice
  	eq.unique_spawn(284094,0,0,1327.06,-375.38,106.13,256); -- NPC: Master`s_Apprentice
  	eq.unique_spawn(284095,0,0,1440.70,-421.54,106.13,386.4); -- NPC: Master`s_Apprentice
  	eq.unique_spawn(284096,0,0,1439.92,-562.61,106.13,386.4); -- NPC: Master`s_Apprentice
	  e.self:SetAppearance(3);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
