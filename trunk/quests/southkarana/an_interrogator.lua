#an_interrogator in south karana
local brief;
local name;

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18292 })) then -- Interrogator's Briefing
		e.self:Say("I see you wish to become an interrogator. This is not a duty for the weak of heart you know. This job sometimes requires...");
		e.other:AddEXP(1000);
		eq.set_timer("brief",10000);
		e.other:SummonItem(2344); -- confession document
		name = e.other:GetName();
		brief = 0;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 2390,item2 = 2391,item3 = 2395})) then -- Head of Markus Cachexia, Head of Morley Murrain, Theodore's Confession
		e.self:Say("Excellent work, you did just fine today. You'll make a fine interrogator. Talk to Vegalys about advancing further.");
		e.other:SummonItem(2387); -- Interrogator's Badge
		e.other:Ding();
		e.other:AddEXP(5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "brief") then
		brief = brief + 1;
	end
	if(brief == 1) then
		e.self:Emote("coughs, 'a little muscle I guess you would say.'");
	elseif(brief == 2) then
		e.self:Say("Nevertheless, we have an important job to do. There is a man by the name of Theodore Exanthem who is a known member of the Bloodsaber cult. He fled from Qeynos some time ago and we have been hot on his tail ever since.");
	elseif(brief == 3) then
		e.self:Say("We have tracked this man down and we now know his whereabouts. However, we have bigger fish to fry today then just this low life. Theodore knows the location of two other individuals also suspected of hiding out here in the plains.");
	elseif(brief == 4) then
		e.self:Say("Sadly, these fiends were the two that slipped into Surefall Glade and poisoned the waters there. Though the druids were able to quickly combine their efforts and neutralize the toxins with their magicks, grievous damage was done none the less. Two of the great protectors of the hills and the glade, Holly Windstalker and Cros Treewind, became seriously ill as did one of the glade's sacred bears.");
	elseif(brief == 5) then
		e.self:Say("Holly and Cros, sickened as they were, removed themselves from the Hills to weather out their illness and to keep the disease from spreading further. During their absence, the Bloodsabers were easily able to traffic in the materials needed to complete their terrible work.");
	elseif(brief == 6) then
		e.self:Emote("shakes his head sadly and says, 'Tragically, Cros Treewind was attacked by one of the sacred bears which was maddened by its illness. In his weakened state Cros was unable to defend himself and was killed by this defiled grizzly, one of the very creatures he was sworn to protect.'");
	elseif(brief == 7) then
		e.self:Say("So our goal is to pry the information we need from Theodore Exanthem so that we may bring these two fugitives to justice. After getting him to comply, you are to collect a confession from Theodore and have him lead us to the two fugitives. Give me Theodore's confession and the heads of these two fugitives and you shall have your badge");
	elseif(brief == 8) then
		e.self:Say(string.format("follow me, %s",name));
		eq.start(110); -- start the grid (one way repop)
		eq.stop_timer("brief");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		--e.self:PauseWandering(60000);  This does not seems to work properly on existing grid.
		e.self:Say("Theodore Exanthem by order of the Council of Qeynos and his lordship Antonius Bayle, I order you to come out of there immediately!");
		eq.unique_spawn(14146,0,0,-2680,-5465,0,192);
	elseif(e.wp == 2) then  -- a workaround for waypoint
		eq.signal(14146,6,5000);
	elseif(e.wp == 3) then
		eq.unique_spawn(14147,0,0,-3287,-6040,0,28);
		eq.unique_spawn(14127,0,0,-3280,-6050,0,31);
		eq.spawn2(14140,0,0,-3285,-6075,0,78);
		eq.spawn2(14140,0,0,-3333,-6055,0,0);
		eq.spawn2(14148,0,0,-3306,-6056,0,66);
		eq.signal(14146,7,2000);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Theodore Exanthem, you will [take us to the location] of Marcus Cachexia and Morley Murrain immediately.");
		eq.signal(14146,1,5000);
	elseif(e.signal == 2) then
		e.self:Say("Vile beast! You are withholding information on two men guilty of terrible atrocities, not the least of which was causing the death of one of Qeynos' most respected and well known citizens, Cros Treewind! As an Interrogator I am authorized to use physical force if necessary.");
		eq.signal(14146,2,5000);
	elseif(e.signal == 3) then
		e.self:Say("[Take us to the location] of Markus Cachexia and Morley Murrain!");
		eq.signal(14146,3,5000);
	elseif(e.signal == 4) then
		e.self:Say("Take us to Markus Chachexia and Morley Murrain this instant or I'll turn you over to my friend here who appears to be much stronger than I am!");
		eq.signal(14146,4,5000);
	elseif(e.signal == 5) then
		e.self:Emote("smiles and says, 'Well, I'm getting tired. Why don't you hit him for a while. Maybe you will be more convincing then I have been.");
		eq.signal(14146,5,5000);
	elseif(e.signal == 6) then
		e.self:Say("[Take us to the location] of Markus Cachexia and Morley Murrain!");
		--eq.signal(14146,6,5000); using this for wp 2.
	--elseif(e.signal == 7) then
		--e.self:ResumeWandering();  This is not working as intended.  this cause the mob to depop.
	elseif(e.signal == 8) then
		e.self:Say("Not so fast. If you want your freedom back, sign this confession immediately.");
	elseif(e.signal == 9) then
		e.self:Say(string.format("You are on your own for now, %s. You know what to do -- return to me when the deed is done.",name));
		eq.depop_with_timer();
	end
end
