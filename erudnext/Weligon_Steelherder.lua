-- items: 17938, 17939, 13876, 12194, 13879, 2104, 2106, 2108, 2111, 2112, 18835, 13838, 13839, 13840, 5377, 18725, 13544
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18725)) then
		e.other:Message(15,"Weligon Steelherder tells you, 'Greetings, A young recruit perhaps? I am Weligon Steelherder, Guild Master of the Deepwater Knights. Read the note in your inventory and then hand it to me when you are ready to begin your training. Truth awaits!'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! This is the Deepwater Temple. Here you shall find the wisdom and courage of Prexus, the Ocean Lord. I am glad to see you have an interest. Forgive me if I cut our conversation short, but I have many [Deepwater tasks] to complete.");  
	elseif(e.message:findi("deepwater task")) then   
		if(e.other:GetFaction(e.self) > 5) then
			e.self:Say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can.");
		elseif(e.other:GetFaction(e.self) < 4) then
			e.self:Say("We here at the Deepwater Temple must tend to the [Peacekeeper battlestaff] and the [Deepwater harpoon] as well as other duties such as [ocean protection]. There is always something we must do.");  
		else
			e.self:Say("There is no reason to dislike you, but we of the Deepwater Knights must see more done for our cause before we truly accept you.");
		end
	elseif(e.message:findi("deepwater harpoon")) then 
		e.self:Say("We do not award the Deepwater harpoon to just any paladin.  Nobility is all well and good, but you must still prove yourself.  We have heard rumors of a very distressing matter.  Perhaps it is your calling.  Are you ready to [prove allegiance to Erudin] and earn the Deepwater harpoon?");  
	elseif(e.message:findi("prove allegiance to Erudin")) then
		e.self:Say("Yes, you are ready. We have heard rumors of a great bridge which will connect Antonica with Odus!! This must not happen! We must shield ourselves from the savage and evil ways of the other races. They say that a list exists. A list of three grand architects who wish to see this bridge erected. You will venture to Qeynos and find the list, then exterminate these three men. Return the list along with their heads and the Deepwater Harpoon is yours. Go!!");  
	elseif(e.message:findi("peacekeeper battlestaff")) then
		e.self:Say("Every sentinel in Erudin carries a High Guard battlestaff.  The creation of these weapons is the duty of the Deepwater Temple and the Temple of Divine Light.  Our portion of the task is to send young members to [collect the Pearls of Odus].  These are imbedded into the staff and used to store mystical power.");
	elseif(e.message:findi("ocean protectio")) then
		e.self:Say("In the name of Prexus, we are sworn to protect all ocean creatures.  We have heard reports of a shark carrying a deadly malady.  We believe she is pregnant.  If she delivers her young to the ocean, it will endanger all other creatures.  We need to find a young paladin to [hunt the diseased shark].");  
	elseif(e.message:findi("hunt the diseased shark")) then
		e.self:Say("Ah, yes!  Take this bag with you.  When you have collected the remains of the diseased shark and no fewer than three of her young in it, combine them in it and return it to me.  Then, you shall get your reward.");
		e.other:SummonItem(17938); -- Item: Empty Shark Bag
	elseif(e.message:findi("collect the pearls of odus")) then
		e.self:Say("Then venture to the harbor of Erudin. There, you shall dive into the shark-infested water and search for the Pearls of Odus. They lie upon the grounds of our waters.  Fill the bag I have given you, combine it, and return it to me.  Good luck.");
		e.other:SummonItem(17939); -- Item: Empty Bag
	elseif(e.message:findi("harpoon no more")) then
		e.self:Say("The Deepwater harpoon's distribution has been restricted by order of the High Council. The last one awarded was to an outsider, the brave and noble paladin, Sentry Xyrin. She hailed from the Temple of Marr.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13876})) then
		e.self:Say("Very good, my dear young follower of Prexus. You will learn that swimming is a strong skill among the Deepwater Knights. Keep this up and you may wield a Deepwater harpoon soon enough. For now, you shall wear this barnacle breastplate. It is strong enough to aid a young knight in his quest for perfection.");
		e.other:SummonItem(12194); -- Item: Barnacle Breastplate
		e.other:Ding();
		e.other:Faction(242,10,0); --  Deepwater Knights
		e.other:Faction(266,10,0); 	--  High Council of Erudin
		e.other:Faction(265,-15,0); --  Heretics
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13879})) then -- Pearls of Odus Handin: full bag of pearls
		e.self:Say("Fine work, Deepwater Knight. You have proven yourself an excellent addition to our ranks. These shall be used to create more Peacekeeper staffs. Oh yes, I almost forgot your reward. Here you are. Now, go, and serve Prexus.");
		e.other:SummonItem(eq.ChooseRandom(2104, 2106, 2108, 2111, 2112)); -- Item(s): Patchwork Tunic (2104)
		e.other:Ding();
		e.other:Faction(242,10,0); --  Deepwater Knights
		e.other:Faction(266,10,0); 	--  High Council of Erudin
		e.other:Faction(265,-15,0); --  Heretics
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18835,item2 = 13838,item3 = 13839,item4 = 13840})) then -- Bridge Quest Handin: 3 heads + sealed list
		e.self:Say("It is done!! I pray to Prexus that the knowledge of the bridge's design has departed from this world with the passing of these intelligent men. A pity they had to die. As for you, the other states may not tolerate your presence any longer, but you have proven that allegiance to Erudin is paramount among all Erudites. I am afraid the [harpoon is no more]!! I bestow upon you Deep Six, my personal cutlass!! May you wield it in the name of Erudin.");
		e.other:SummonItem(5377); -- Item: Deep Six Cutlass
		e.other:Ding();
		e.other:Faction(242,10,0); --  Deepwater Knights
		e.other:Faction(266,10,0); 	--  High Council of Erudin
		e.other:Faction(265,-15,0); --  Heretics
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18725})) then -- Tattered Note
		e.self:Say("Greetings and welcome to the Deepwater Knights. Here is your guild tunic. Wear it with pride, and Prexus will keep a watchful eye on you. Go find sister Laoni, she will help you get started with your studies.");
		e.other:Ding();
		e.other:SummonItem(13544); --  Old Blue Tunic*
		e.other:Faction(242,100,0); --  Deepwater Knights
		e.other:Faction(266,15,0); 	--  High Council of Erudin
		e.other:Faction(265,-15,0); --  Heretics
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:24065 -- Weligon_Steelherder
