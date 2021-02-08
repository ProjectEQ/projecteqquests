-- items: 18927, 13306, 2020, 18936, 18937, 13947, 18828, 12197, 5504
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("This is no place for you. These Splitpaws are very fierce. Only the power of Rodcet Nife will guide them to the light. By the way, I might warn you that the cells here lock behind you.");
	elseif(e.message:findi("proof of nobility")) then
		e.self:Say("I require the returned note I gave you, a Testimony of Truth, a Sword of Faith and finally the hilt of Soulfire. The Testimony and Sword of Faith are earned in the Hall of Truth, but for the hilt of Soulfire you shall have to battle [Xicotl].");
	elseif(e.message:findi("xicotl")) then
		e.self:Say("Xicotl is the evil troll who attempted to steal Soulfire from the vaults of the Temple of Life. The hilt of Soulfire broke off during the battle and now rests in the hands of this troll shadowknight. From what I have heard, he is frequently an invited guest at the castle called Mistmoore. Woe to any paladin who dares set foot upon the land of Mistmoore, but should you attempt it you might search the guest rooms for the troll. May Rodcet Nife walk with you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);

	if(item_lib.check_turn_in(e.trade, {item1 = 18927})) then -- Temple Summons
		e.self:Say("I am needed!! What am I doing here? I must return to the Temple of Life to commune with the Prime Healer. Rodcet Nife will give me more strength to finish this job. Thank you, young one! Take this key as a reward. Turn it into Tyokan in the temple shop. Safe journey to you!");
		e.other:SummonItem(13306); --  T.O.L. 2020 (Strongbox Key)
		e.other:Ding();
		e.other:Faction(341,5,0); -- Priest of Life
		e.other:Faction(280,5,0); -- Knights of Thunder
		e.other:Faction(262,5,0); -- Guards of Qeynos
		e.other:Faction(221,-5,0); -- BloodSabers
		e.other:Faction(219,5,0); -- Antonious Bayle
		e.other:AddEXP(200);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18936})) then -- A Sealed Note
		e.self:Say("Finally!! I see that Ariska has found a noble knight to retrieve Soulfire. Per Ariska's orders I am not to give Soulfire to you until you can show me [proof of nobility]. You must honor both the Temple of Life as well as the Hall of Truth and to a high degree. Only then shall you hold Soulfire.");
		e.other:SummonItem(18937); --  a note
		e.other:Ding();
		e.other:Faction(341,5,0); -- Priest of Life
		e.other:Faction(280,5,0); -- Knights of Thunder
		e.other:Faction(262,5,0); -- Guards of Qeynos
		e.other:Faction(221,-5,0); -- BloodSabers
		e.other:Faction(219,5,0); -- Antonious Bayle
		e.other:AddEXP(200);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18937,item2 = 13947,item3 = 18828,item4 = 12197})) then
		if(fac < 3) then
			e.self:Say("You have proven yourself worthy to hold Soulfire. Do not let her slip into the hands of evil. There are many who wish to free the many trapped souls of shadowknights and necromancers trapped inside the blade. The power of the blade can be called upon to heal you if need be. May Rodcet Nife and the twins of Marr hold you in their glory.");
			e.other:SummonItem(5504); --  soulfire
			e.other:Ding();
		else
			e.self:Say("You have not proven yourself worthy to hold Soulfire."); -- Text made up
			e.other:SummonItem(18937); -- Item: Note
			e.other:SummonItem(13947); -- Item: Brilliant Sword of Faith
			e.other:SummonItem(18828); -- Item: Testimony
			e.other:SummonItem(12197); -- Item: Glowing Sword Hilt
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of File Zone:paw -- Brother_Hayle
