function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetName() .. ". Know that only within these few passageways and rooms whose borders are marked by the symbol of the Circle of Unseen Hands can we speak freely of our organization and its undertakings. Neither the streets of the city above nor the sewers and catacombs are free of ears that would harm the Circle of Unseen Hands should they hear of our [secrets].");
	elseif(e.message:findi("secret")) then
		e.self:Say("The Circle has many secrets some of which only Hans may know. Our agents are all about, mingling among the common law abiding folk and working in all manner of profession. At one time we had a significant number of the Qeynos Guard allied to our organization but the loyal soldiers of Antonius Bayle IV has discovered and punished many of them. The ones that remain are hesitant at best to continue their association with us. You will need to exercise much caution within this city as you learn the ropes. I will help get you outfitted in some [gear] that you will find useful in our line of work.");
	elseif(e.message:findi("gear")) then
		e.self:Say("Take this Curing Kit. With it you can assemble an outfit of light, flexible, and sturdy yet inconspicuous leather clothing to protect you from the perils of your job. The materials required will depend on the piece of clothing you desire to craft. Do you plan on crafting Sturdy Workmans [Gloves], Sturdy Workmans [Boots], a Sturdy Workmans [Bracer], a Sturdy Workmans [Cap], Sturdy Workmans [Leggings], Sturdy Workmans [Sleeves], or a Sturdy Workmans [Tunic]? Once you are suitably outfitted return to me and I will inform you of your [next job].");
		e.other:SummonItem(17125);  
	elseif(e.message:findi("boot")) then
		e.self:Say("To craft Sturdy Workmans Boots you require two [silk thread], two ruined wolf pelts, two giant field rat whiskers, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
		e.other:SummonItem(19561);      
	elseif(e.message:findi("bracer")) then
		e.self:Say("To craft an Sturdy Workmans Bracer you require a [silk thread], a ruined wolf pelt, and a giant field rat whiskers. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
		e.other:SummonItem(19558);
	elseif(e.message:findi("cap")) then
		e.self:Say("To craft a Sturdy Workmans Cap you require two [silk thread], a ruined wolf pelt, a large myotis bat fur, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Coif Pattern.");
		e.other:SummonItem(19555);
	elseif(e.message:findi("glove")) then
		e.self:Say("To craft Sturdy Workmans Gloves you require two [silk thread], a ruined wolf pelt, two giant field rat whiskers, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
		e.other:SummonItem(19559);
	elseif(e.message:findi("legging")) then
		e.self:Say("To craft Sturdy Workmans Leggings you require three [silk thread], a low quality wolf pelt, two large myotis bat furs, and a giant king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
		e.other:SummonItem(19560);
	elseif(e.message:findi("sleeve")) then
		e.self:Say("To craft Sturdy Workmans Sleeves you require two [silk thread], a low quality wolf pelt, two large myotis bat furs, and a giant king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
		e.other:SummonItem(19557);
	elseif(e.message:findi("tunic")) then
		e.self:Say("To craft a Sturdy Workmans Tunic you require four [silk thread], a medium quality wolf pelt, a giant myotis bat fur, and a giant king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
		e.other:SummonItem(19556);
	elseif(e.message:findi("next job")) then
		e.self:Say("A message between two of our agents was recently intercepted by a Qeynos Guardsman. The message is encoded in thieves cant but should the guards eventually decode it we would expect trouble. Guard Gregor, the guard who currently is in possession of the message is out patrolling somewhere in the West Karanas. Find this guard and recover the message. Bring it back to me when you have done so.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19942})) then
		e.self:Say("Excellent! It is fortunate you recovered this message in time. Take this Rusty Unseen Hands Dagger to a forge and sharpen it with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is accomplished bring me the sharpened dagger, a gnoll fang, and a large king snake skin and I will put the finishing touches on the weapon for you.");
		e.other:SummonItem(19943); -- rusty unseen hands dagger
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 19944,item2 = 13915,item3 = 19945})) then
		e.other:SummonItem(20266); -- Dagger of Unseen Hands
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
