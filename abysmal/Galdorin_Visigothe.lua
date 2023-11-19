-- TODO: Verify

local ThreadManager = require("thread_manager");
local evt;

local songs = {
	[1] = {
		"Tra-la-la and a-diddly-dee.",
		"The gnome bit the ogre on the knee.",
		"Tra-la-la and a-diddly-dum.",
		"The ogre bit off the gnome's thumb.",
		"Then the ogre said as he turned to me,",
		"Dat fer singin' 'Tra-la-la and a-diddly-dee.'"
	},
	[2] = {
		"In the dark of the fearless night,",
		"Fantastic stories retold by torchlight.",
		"A tale of a rogue of great prowess.",
		"An enchanter as his revered mistress.",
		"Then there's a shadow knight who found the two,",
		"He swore to them he would always be true.",
		"Some say they were brought together by chance,",
		"Others think that it was circumstance.",
		"No matter how they came to be the closest three,",
		"They are the greatest adventurers that will ever be."
	},
	[3] = {
		"On one sunny afternoon, I sawr a dwarf a'wanderin'",
		"He was staggerin' and mumblin' and fallin'.",
		"I caught up and asked him if he needed help,",
		"And he turned and yelled as loud as he's stout:",
		"Git yer flowery songs from my ear,",
		"The light notes will soil me beer!",
		"And if ye don't turn and run fast,",
		"I'll drown yer feet in what I ate last!"
	},
	[4] = {
		"Norrath is so great and so dear",
		"With all the folk that live here:",
		"Dwarves make lots of ale",
		"High elves are too pale",
		"Trolls are slimy and green",
		"Ogres are very unclean",
		"Gnomes can make things tick",
		"Halflings, masters of the trick",
		"Iksar get by with scales",
		"Vah Shir oft' use their tails",
		"Humans are very plain",
		"Dark elves deal out pain",
		"Frogloks are smarter now",
		"Erudites, the highest brow",
		"Half elves have no city"
	},
	[5] = {
		"Wood elves are so pretty",
		"The last Norrathians I'm told",
		"Are barbarians who love the cold.",
		"All these folk share these lands,",
		"Putting it in very good hands."
	}
}

function event_spawn(e)
	eq.set_timer("heartbeat", 500); -- 0.5s heartbeat
	ThreadManager:Clear();
	ThreadManager:Create("Sing", sing);
end

function event_timer(e)
	evt = e;
	ThreadManager:Resume("Sing");
end

function event_signal(e)
	if e.signal == 1 then
		e.self:Say("Ack, I need somethin' light to clear the taste of salt from my mouth.");
		eq.signal(279042,12,10 * 1000); -- Galadra Pershan
	elseif e.signal == 2 then
		e.self:Emote("breaks into a wide grin 'Hello, lass!  Why, I've never seen a lovelier woman in all my days!  I'd be grateful if you could bring me your best dark beer.  Hurry back!'");
		eq.signal(279042,12,10 * 1000); -- Galadra Pershan
	end
end

function sing()
	while true do
		local song_number = math.random(1,5); -- Pick random song
		for verse = 1,table.getn(songs[song_number]) do -- iterate through verses
			evt.self:SpellFinished(4724, evt.self);
			evt.self:Say(songs[song_number][verse]);  -- sing verse
			ThreadManager:Wait(2.5);
		end
		ThreadManager:Wait(5 * 60); -- 5 Minutes
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 9590}) then -- Item: Notice to Cease and Desist
		e.self:Say("Hello. Please pardon me, but. . . Hmm, what do we have here? It says that you wish me to cease and desist spreading slander about the swashbuckler known as Stanos, or else . . .? I'd hardly place him in the 'swashbuckling' category, friend. Let's not sugercoat it. He's more of a scoundrel or smuggler or sniveling scumsucking slimeball. I can't believe you would have the nerve to come in here and threaten my right to say what I wish. My very livelihood depends upon my being able to speak freely to entertain the visitors of this tavern. I'll not be threatened by you, brute. Fight me if you dare!'");
		make_attackable(e.self, true);
		e.self:AddToHateList(e.other, 1);
	end

	item_lib.return_items(e.self, e.other, e.trade)
end

function make_attackable(mob, attackable)
    mob:SetSpecialAbility(SpecialAbility.immune_melee, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_magic, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
    mob:SetSpecialAbility(SpecialAbility.no_harm_from_client, attackable and 0 or 1)
end