-- items: 13945, 18713, 13510, 18809, 15222, 18807
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18713) == true) then
		e.other:Message(15,"As you orient yourself amongst the peacefulness of the Surefall Glade, a melodic, peaceful voice seems to float on the wind. 'I am Te'Anara, Master of the Woods. Read the note in your inventory and when you wish to begin your training, hand it to me. We must preserve the heart of the Jaggedpine lest all of Norrath will perish!'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, friend! I hope your stay in Surefall Glade will ease your mind and soothe your soul. While you are here, we ask you to abide by the [laws of the Jaggedpine].");
	elseif(e.message:findi("laws of the jaggedpine")) then
		e.self:Say("We ask that you do not start campfires on our land. Do not litter our land with any items. Do not chop down our pines or tread upon any foliage. Please do not take more than a bellyful of fish. Do not harm any other wildlife and stay clear of [the great bear]!");
	elseif(e.message:findi("great bear")) then
		e.self:Say("The great bear I speak of is Mammoth. He has lived among us for over a century. Tunare has truly blessed us with his presence. As long as Mammoth lives, so too does Surefall Glade. We are currently worried. Corun has reported that there is something [wrong with Mammoth].");
	elseif(e.message:findi("wrong with mammoth")) then
		e.self:Say("Mammoth is not eating. We believe something is lodged in his throat. We require a young druid to [fetch a special potion].");
	elseif(e.message:findi("special potion")) then
		e.self:Say("Go to the gnome city of Ak'Anon on the continent of Faydwer. With their great zoo, you will find a gnome named Kimble Nogflop. Give him this flask of nitrates and he shall hand you a special potion which will force Mammoth to cough up whatever may be stuck inside his throat. Be sure to show me what you find inside his throat upon your return.");
		e.other:SummonItem(13945); -- Item: Flask of Nitrates
	end
end

function event_trade(e)
	local item_lib =require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18713})) then -- Tattered Note
		e.self:Say("Well met, friend of the forest. You will find power and enlightenment amidst these woods. Here, wear this tunic and represent the Jaggedpine with pride. Gerael Woodone will help train you and teach you the duties of Jaggedpine Treefolk. The forests, being the soul and heart of Norrath, depend on you and your actions from this day forth.");
		e.other:SummonItem(13510); -- Item: Dried Grass Tunic*
		e.other:Ding();
		e.other:Faction(272, 100,0); --Jaggedpine Treefolk
		e.other:Faction(302, 25,0); --Protectors of Pine
		e.other:Faction(343, 15,0); --QRG Protected Animals
		e.other:Faction(324, -25,0); --Unkempt Druids
		e.other:Faction(262, 15,0);   --Guards of Qeynos
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18809})) then
		e.self:Say("Oh my, this must belong to Antonius Bayle! I shall see that he receives it. You have done a great service to Qeynos and Surefall Glade. I rewards you with this. May it be of good use in your future deeds.");
		e.other:SummonItem(15222); -- Item: Spell: Invigor
		e.other:Ding();
		e.other:Faction(272, 10,0); --Jaggedpine Treefolk
		e.other:Faction(302, 10,0); --Protectors of Pine
		e.other:Faction(343, 10,0); --QRG Protected Animals
		e.other:Faction(324, -15,0); --Unkempt Druids
		e.other:Faction(262, 10,0);   --Guards of Qeynos
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18807})) then -- Sealed Letter [Note To Jaggedpine - real]
		e.self:Say("Aye! This is good news. We shall try to supply Qeynos with a limited number of acres to begin their lumberyard. Here, my good messenger. A token to share in the good news.");
		e.other:Ding();
		e.other:Faction(272, 10,0); --Jaggedpine Treefolk
		e.other:Faction(302, 10,0); --Protectors of Pine
		e.other:Faction(343, 10,0); --QRG Protected Animals
		e.other:Faction(324, -15,0); --Unkempt Druids
		e.other:Faction(262, 10,0);   --Guards of Qeynos
		e.other:AddEXP(16000);
		e.other:GiveCash(0,8,2,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
