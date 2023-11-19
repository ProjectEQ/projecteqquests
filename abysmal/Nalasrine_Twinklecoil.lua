function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Salutations! It is great to see so many eager travelers out and about. How are you enjoying our little city here? I have been quite busy myself. There are so many [interesting] things to learn about these strange beings that inhabit Taelosia. Their armor in particular is most interesting. I have developed some intriguing compounds. Let me know if you are interested in such things before I just prattle on!");
	elseif e.message:findi("interesting") then
		e.self:Say("Oh, good. Well let me see. Basically, I have been studying the armor that our explorers have been bringing back from their adventures. While it is a bit strangely shaped, as these creatures that seem to reside here are, I have found that by strengthening some native materials it can be reworked into rather fine armor for the likes of you and me.");
	elseif e.message:findi("armor") then
		e.self:Say("If you are looking into having some armor made, you definitely will need to use my infusions. They are a bit pricey, however they are difficult to make and well frankly, I am the only one who can! Use the plate solvent on plate armor, chain solvent on chain, tanning solution on leather, and silk strengthener on silk. All rather intuitive isn't it? Simply take a look at the different types I have for sale.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
