function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, noble soul! I'm Gimlik Cogboggle. You are correct, the Gimlik Cogboggle, renowned adventurer, scholar, and yes... creator of spells. Please don't goggle or touch. Your opportunity has arrived, my friend. I was sent here to complete a very important task and for that, I will need some slight assistance. If you will be kind enough to follow me, I'll show you to your doom... err... get this show on the road. Just let me know when you're ready");
elseif(e.message:findi("ready")) then
		eq.spawn2(48254,87,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #Gimlik_Cogboggle
		eq.depop_with_timer();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
