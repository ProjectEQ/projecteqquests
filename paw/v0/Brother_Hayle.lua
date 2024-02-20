function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("This is no place for you. These Splitpaws are very fierce. Only the power of Rodcet Nife will guide them to the light. By the way, I might warn you that the cells here lock behind you.");
	elseif(e.message:findi("free") or e.message:findi("help")) then
		e.self:Say("I am in no need of rescue.  I shall become a beacon of light to lead these beasts to the goodness of Rodcet Nife.");
	elseif(e.message:findi("rodcet")) then
		e.self:Say("Rodcet Nife is the Prime Healer. The god unto whom all creatures pray at some time in their lives. He will show these gnolls the true inner light. I have converted a few of these creatures, but I fear they have all been executed. My turn will come soon, but I believe that in my martyrdom they shall see the true glory of Rodcet Nife and a new life will heal their evil souls.");
	elseif(e.message:findi("here") or e.message:findi("cell")) then
		e.self:Say("I was in the process of converting some of these beasts into disciples of Rodcet Nife when their shamans found out and captured me. That was weeks ago, I believe. Now, here, we shall all die.");
	elseif(e.message:findi("proof of nobility")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 750) then
			e.self:Say("I require the returned note I gave you, a Testimony of Truth, a Sword of Faith and finally the hilt of Soulfire. The Testimony and Sword of Faith are earned in the Hall of Truth, but for the hilt of Soulfire you shall have to battle [Xicotl].");
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("The Temple of Life smiles upon you, friend...  but such a delicate matter can only be entrusted to our most loyal members.");	
		else
			e.self:Say("Your mere presence disgusts me.  Please remove yourself from my sight.  Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end		
	elseif(e.message:findi("xicotl")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("Xicotl is the evil troll who attempted to steal Soulfire from the vaults of the Temple of Life. The hilt of Soulfire broke off during the battle and now rests in the hands of this troll shadowknight. From what I have heard, he is frequently an invited guest at the castle called Mistmoore. Woe to any paladin who dares set foot upon the land of Mistmoore, but should you attempt it you might search the guest rooms for the troll. May Rodcet Nife walk with you.");
		else
			e.self:Say("Your mere presence disgusts me.  Please remove yourself from my sight.  Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	-- need MQ implementation
	-- local text = "I will not hand Soulfire to you until you hand me the Soulfire hilt, Testimony of Truth, Sword of Faith and the returned note. I require them as [proof of nobility].";

	if(item_lib.check_turn_in(e.trade, {item1 = 18927})) then -- Temple Summons
		e.self:Say("I am needed!! What am I doing here? I must return to the Temple of Life to commune with the Prime Healer. Rodcet Nife will give me more strength to finish this job. Thank you, young one! Take this key as a reward. Turn it into Tyokan in the temple shop. Safe journey to you!");
		-- confirmed live faction and Experience
		e.other:Faction(341,20); 		-- Priest of Life
		e.other:Faction(280,6); 		-- Knights of Thunder
		e.other:Faction(262,10); 		-- Guards of Qeynos
		e.other:Faction(221,-5); 		-- BloodSabers
		e.other:Faction(219,3); 		-- Antonious Bayle
		e.other:QuestReward(e.self,{itemid = 13306,exp = 1000}); -- T.O.L. 2020
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18936})) then -- A Sealed Note
		e.self:Say("Finally!! I see that Ariska has found a noble knight to retrieve Soulfire. Per Ariska's orders I am not to give Soulfire to you until you can show me [proof of nobility]. You must honor both the Temple of Life as well as the Hall of Truth and to a high degree. Only then shall you hold Soulfire.");
		e.other:Faction(341,10); 		-- Priest of Life
		e.other:Faction(280,3); 		-- Knights of Thunder
		e.other:Faction(262,5); 		-- Guards of Qeynos
		e.other:Faction(221,-2); 		-- BloodSabers
		e.other:Faction(219,1); 		-- Antonious Bayle
		e.other:QuestReward(e.self,0,0,0,0,18937,200);
	-- need MQ implementation.
	-- elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18937,item2 = 13947,item3 = 18828,item4 = 12197},1,text)) then -- A Note, Brilliant Sword of Faith, Testimony, Glowing Sword Hilt
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18937,item2 = 13947,item3 = 18828,item4 = 12197})) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 750) then -- items will get eaten if faction not high enough.
			e.self:Say("You have proven yourself worthy to hold Soulfire. Do not let her slip into the hands of evil. There are many who wish to free the many trapped souls of shadowknights and necromancers trapped inside the blade. The power of the blade can be called upon to heal you if need be. May Rodcet Nife and the twins of Marr hold you in their glory.");
			e.other:Faction(341,100); 		-- Priest of Life
			e.other:Faction(280,30); 		-- Knights of Thunder
			e.other:Faction(262,50); 		-- Guards of Qeynos
			e.other:Faction(221,-25); 		-- BloodSabers
			e.other:Faction(219,15); 		-- Antonious Bayle
			e.other:QuestReward(e.self,{itemid = 5504,exp = 10000});	--  soulfire
		else
			e.self:Say("Your mere presence disgusts me.  Please remove yourself from my sight.  Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
			-- faction not high enough, items get eaten.  comment out until MultiQuest is implemented.
			-- e.self:DeleteQuestLoot();
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of File Zone:paw -- Brother_Hayle
