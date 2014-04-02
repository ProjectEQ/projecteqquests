function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
	eq.set_timer("repeat", 90000); -- Repeated shoot every 90 seconds
end

function event_enter(e)
	if(e.other:HasItem(18709) == true) then
		e.other:Message(15,"As you orient yourself amongst the peacefulness of the Surefall Glade, Hager Sureshot addresses you stemly, 'You're not here to poach are you? Of course you're not. Excuse my manners. I can see that you are a young ranger in training. Read the note in your inventory and hand it to me to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, "..e.other:GetName()..".  Feel free to rest here in Surefall Glade.  Just be sure you do no hunting whilst here.  If so, then you shall pay the punishment of death.  I trust you [will abide by the laws]?");
	elseif(e.message:findi("abide by the laws")) then
		e.self:Say("That is wise.  Your health, for now, is assured.  A plague of hunters has infested our land heavily in recent weeks.  The word is out that [Mammoth] still lives.  Hunters have flocked here in search of a trophy or profit and glory.  Instead, they find the deadly accuracy of my arrows.");
	elseif(e.message:findi("mammoth")) then
		e.self:Say("Mammoth is the great bear of the caves.  [Tunare] has blessed our home with Mammoth's presence.  It is said that when the great bear dies, so too shall the Jaggedpine.  He would be quite a trophy to some hunter.  And quite profitable to a poacher. Even the infamous [Talym Shoontar] has tried his hand at the hunt.");
	elseif(e.message:findi("tunare")) then
		e.self:Say("Tunare is the Mother of All.  It is through Her will that we protect this land and its many creatures.");
	elseif(e.message:findi("talym shoontar")) then
		e.self:Say("Talym Shoontar is a poacher.  He has eluded us for quite some time.  He has organized parties of poachers to plague our forest as well as others.  He hails from Halas, but I have heard he now calls the Plains of Karana home.  I have placed a bounty upon his head.  Do you [wish to collect the bounty]?");
	elseif(e.message:findi("wish to collect the bounty")) then
		e.self:Say("That's the spirit!!  Spoken like a true Protector of the Pine!  Last I heard, Talym Shoontar was hunting in the Plains of Karana.  He has also been spotted running to and from Qeynos.  No doubt he is selling hides to some merchant.  End his life of hunting.  Bring me his head to collect the bounty.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18709})) then
		e.self:Say("Welcome, we are the Protectors of the Pine. Wear this tunic of our guild, and help us defend our great and beautiful woods. Go to Larsk Juton, he will help train you and teach you the power of the woods.");
		e.other:SummonItem(13509);
		e.other:Ding();
		e.other:Faction(265,10,0); -- Protectors of Pine
		e.other:Faction(159,10,0); -- Jaggedpine Treefolk
		e.other:Faction(279,-15,0); -- Sabertooths of Blackburrow
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13913})) then
		e.self:Say("His days of hunting are over. In the name of the Protectors of the Pine, I offer you this reward. If you are unable to make use of it, you may sell it. I suggest you hold onto it. If you are a ranger it will come in handy.");
		e.other:SummonItem(17804);
		e.other:Ding();
		e.other:Faction(265,10,0); -- Protectors of Pine
		e.other:Faction(159,10,0); -- Jaggedpine Treefolk
		e.other:Faction(279,-30,0); -- Sabertooths of Blackburrow
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:AddEXP(1000);
		e.other:GiveCash(0,11,8,4);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_timer(e)
	e.self:DoAnim(9); -- bow
end

-- EOF zone: qrg ID: 3032 NPC: Hagar_Sureshot