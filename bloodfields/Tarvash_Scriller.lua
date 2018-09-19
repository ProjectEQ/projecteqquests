function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["berserk_epic"] == "9") then
		if (e.message:findi("hail")) then
			e.other:Emote("nearly jumps out of his shoes. Clearly shaken by your presence he feebly says, 'Ach! Dinnah sneak up on me like that! Ye be lucky I had enough control to not smite ye where ye stand else I surely woulda cut ye in twain! But that be not good fer business', he says as you notice a twinkle forming in his eyes upon that last spoken word. 'Now what can I dew fer ya lad? Ye be lookin' fer some rubies perhaps? Or perhaps a pretty diamond as a gift for ye mum?");
		elseif(e.message:findi("information")) then
			e.self:Say("Information? Ye came all this way to bug me about information on the local gems? Are ye daft? Ach, it's been so long since I've seen anyone from my world, that as ugly as ye be, I am happy to lay me eyes upon ye. Very well, for a mere 50 gold I will help ye.");
		end
	else
		e.self:Say("You do not seem to follow the arts of the berserker, I'm afraid you cannot help me.");
	end	
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(qglobals["berserk_epic"] == "9" and item_lib.check_turn_in(e.trade, {platinum = 50})) then
		e.self:Say("Ah, thank ye lad! Nothing like a bit o' coin to keep me company! Seek ye out the beasts that reside deep within the causeway, some of the ancient beasts there often hoard gems. As surely as Gnomes have sumpth' wrong in their heads ye shall find what ye seek there.");
	elseif(qglobals["berserk_epic"] == "9" and item_lib.check_turn_in(e.trade, {gold = 50})) then
		e.self:Say("I can see that axe ye carry already has some enchantments woven into the haft. By my eye tis not a half bad job but I bet there is room a'plenty in that axe for more wild magics yet. Ye won't find any gems right around here though, that will help ye in your search. I think that if ye managed to weave a Facetted Moonstone into the haft of yer axe, one could imbue it with another essence at a later time. Fer another 50 platinum pieces, I could be persuaded to tell ye where ye could find one.");
	end

	item_lib.return_items(e.self, e.other, e.trade);
end