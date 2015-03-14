function event_spawn(e)
	e.self:SetRunning(true);
end

function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
		e.self:MerchantCloseShop();
	elseif(e.signal == 2) then
		eq.start(60);
		e.self:MerchantOpenShop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!!  Moran here.  I just love this city.  I traveled from Freeport to Qeynos to stay far from the [Freeport Militia].");
	elseif(e.message:findi("freeport militia")) then
		e.self:Say("The Freeport Militia are nothing more than thugs.  I have seen them lay waste to more than a dozen adventurers at once.  For no reason other than to flex their muscles!");
	end
end
