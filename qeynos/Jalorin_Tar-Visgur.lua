-- items: 21699, 21971, 21969
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes? What do you want I am very busy with my studies. I have laready paid my taxes this month so do not even tell me that Sneed sent you. That will not work anymore.");
	elseif(e.message:findi("sent from erudin")) then
		e.self:Say("Well what is it you have been sent for? Go ahead I don't have all day I must get these [incantations] to the council and I am not finished with them yet.");
	elseif(e.message:findi("incantations")) then
		e.self:Say("You certainly do not look like you could read the scrolls I have been working on so I am wondering why you are questioning what they are. I am waiting for some scrolls from my friend Elisi. The last time I saw her she gave me this [parchment] but I am waiting for her to complete it, would you be able to [return] it to Brianna for me? It is quite clear that she trusts you so I suppose I should as well.");
	elseif(e.message:findi("return")) then
		e.self:Say("Very well here you are. If we are done here please excuse me for I have much work to do.");
		e.other:SummonItem(21699); -- Item: Scribbled Parchment
	elseif(e.message:findi("Elisi")) then
		e.self:Say("You know, Elisi was a bit like you she didn't know when to quit. You and her will soon share the same [fate] I should think.");
	elseif(e.message:findi("fate")) then
		e.self:Say("DIE!");
		eq.attack(e.other:GetName());
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 21971})) then
		e.self:Say("Ah erm. Yes of course. You have been sent by Erudin am I right?");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 21969})) then
		e.self:Say("Brianna must think I am stupid to trust a complete stranger with the most powerful spells I have ever collaborated on with Elisi. I will not give you the parchments that she asks for, but I will give you a fair warning to stay out of my business. If you do not leave me be and [forget about Elisi], I will grow quite angry.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
