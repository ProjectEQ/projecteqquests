-- Converted to .lua by Speedz
-- edited and added saylink by robregen
-- factions values, required faction and rejection text by noudess
-- items: 18792, 13530, 13073, 5023, 12201, 12202, 3316

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18792) == true) then
		e.other:Message(15,"As your eyes adjust to the darkness, a large troll decked out in grimy metal armor turns towards you. 'I be Hukulk. You read note in inventory and hand to me to start training!'");
	end
end

function event_say(e)
	local pfaction = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("What you want!! You make fun of [" .. eq.say_link("helm of Hukulk",false,"helm of Hukulk") .. "]?!! Me smash you!! Maybe you come learn ways of Hate and Fear! You be dark power. You be Pain. You [" .. eq.say_link("want join Nightkeep",false,"want join Nightkeep") .. "]?");
	elseif(e.message:findi("helm of Hukulk")) then
		e.self:Say("Oh!!  Yooz tink you great enough to wear helm of Hukulk?  Me have another just like it. Me make deal with yooz.  If yooz want helm den yooz help Hukulk get revenge.  Youz better be strong or yooz useless!!  So.. Yooz [" .. eq.say_link("make deal with Hukulk",false,"make deal with Hukulk") .. "]?");
	elseif (pfaction > 4) then
		reject(e, pfaction);
	elseif(e.message:findi("want join Nightkeep")) then
			e.self:Say("Good. Hate and Pain. Innoruuk teach power, I teach power. Me make you power. You do what me say. You no mess up, I no kill you. We no like dead creature we no own. Go, kill dem. Bring four bone chips. I make you power.");
	elseif(e.message:findi("make deal with Hukulk")) then
		e.self:Say("Yooz smart!!  Yooz go and walks to dark elf city.  Yooz finds one whos make Lynuga breaks up with Hukulk!  Maybe first yooz find Lynuga.  Find who she visits in dark elf city!!  Den yooz go and top off him head!!  Bash Lynuga too, if she no give me back [" .. eq.say_link("happy love bracer",false,"happy love bracer") .. "]!!  Me want head of dat home wrecker an' me happy love bracers, den me give yooz helm of Hukulk.");
	elseif(e.message:findi("happy love bracer")) then
		e.self:Say("Happy love bracers are mines!!  Me make dem for Lynuga.  Dey all shiny and green like da forests me see in adventures when me young.  Dey make Hukulk all warm and happy.  Den me give to Lynuga and.. and <sob>.. and.. AND LYNUGA RIP OUT HUKULK HEART!!  Yooz makes Lynuga give back [happy love bracers]!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local pfaction = e.other:GetFaction(e.self);

	if (item_lib.check_turn_in(e.trade, {item1 = 18792})) then -- Tattered Note
		e.self:Say("Haaah!! Bow to Hukulk!! Hukulk make you feared.. make you powered! Dark power flow through you! Hate and Fear in your blood!");
		e.other:SummonItem(13530);	-- Black and Green Tunic*
		e.other:Ding();
		e.other:Faction(308,100,0);	-- Shadowknights of Night Keep
		e.other:Faction(261,-15,0);	-- Green Blood Knights
		e.other:Faction(222,-25,0);	-- Broken Skull Clan
		e.other:Faction(235,5,0);	-- Da Bashers
		e.other:AddEXP(30);
	elseif (pfaction > 4) then
		e.self:Say("You no friend to Hukulk");	
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13073, item2 = 13073, item3 = 13073, item4 = 13073})) then -- Bone Chips
		e.self:Say("You good. Take dis. Make much pain and hurt. Make tings bleeds. Kill, hurt all. Innoruuk and me say do, now go. You do much, come bak. Teach you how more hurt and pain make. Go.");
		e.other:SummonItem(5023);	-- Rusty Two Handed Sword
		e.other:Ding();
		e.other:Faction(308,5,0);	-- Shadowknights of Night Keep
		e.other:Faction(261,-1,0);	-- Green Blood Knights
		e.other:Faction(222,-1,0);	-- Broken Skull Clan
		e.other:Faction(235,-1,0);	-- Da Bashers
		e.other:AddEXP(250);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 12201, item2 = 12202})) then -- Happy Love Bracers and Troll Head(Lumpin)
		e.self:Say("Ha!! Ha!! Who have last laugh now!! You do good werk.  Now me give you extra helm of Hukulk. Now go away!!");
		e.other:SummonItem(3316);	-- Helm of Hukulk
		e.other:Ding();
		e.other:Faction(308,40,0);	-- Shadowknights of Night Keep
		e.other:Faction(261,-6,0);	-- Green Blood Knights
		e.other:Faction(222,-10,0);	-- Broken Skull Clan
		e.other:Faction(235,2,0);	-- Da Bashers
		e.other:AddEXP(250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function reject(e, pfaction)
	if (pfaction < 6) then
		e.self:Say("Me talk to you 'bout dat when you do more to help Nightkeep!  Kill all Greenbloods!  Kill all froggies!");
	else
		e.self:Say("'<..Sniff, sniff, sniff..>  Me smell the blood of enemy in you.  You fool to talk to Nightkeep shadowknight!  Me bleed you if you no run!");
	end
end
