--Gorilla Scholar 
--Plane of Mischief 1.0

--NPC Dialogue from http://web.archive.org/web/20021214190527/http://www.swtoys.net:80/pom/gorillascholar.html

function event_say(e)
	local chance = math.random(0,100)
	if e.message:findi("Hail") and chance <= 5 then  -- 5% attack NPC will attack upon being hailed
		e.self:Emote("throws the book he was chewing on to the ground and attacks.")
		e.self:AddToHateList(e.other);
	elseif e.message:findi("Hail") and chance <= 50 then  -- 45% chance for this response
		e.self:Emote("appears enthralled as he tears page after page out of a book titled 'Secrets of the Universe, Volume 8.'");
	else  -- 50% chance of this response
		e.self:Emote("looks at you out of the corner of his eye as he chews in contentment upon an ancient scroll lined with silver and covered with mystical runes of power.");
	end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
