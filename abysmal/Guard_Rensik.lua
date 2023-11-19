function event_say(e)
    if e.message:findi("Hail") then
        e.self:Say("Hail, hero!  It is an [honor] to have you aboard the Queen of Thorns!");
    elseif e.message:findi("honor") then
        e.self:Say("It most certainly is!  The Wayfarers built this ship for your use!  We need you...  no, Norrath needs you here, and we are honored to have you aboard.  I hope that my presence will allow you to relax while aboard the Queen.  I know I am not as capable as you, but I will do my best to defend this ship and those aboard while I am on duty.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end