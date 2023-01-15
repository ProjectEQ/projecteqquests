-- items: 13301, 13908
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Life, " .. e.other:GetName() .. ".  It is here that you may pay tribute to the Prime Healer. Does not your heart beat with the sound of life? It is He who makes it so. Do not let the hand of Bertoxxulous and his [new disease] lay upon your soul or, like so many, you shall meet your fate at the end of my sword!");
	elseif(e.message:findi("new disease")) then
		e.self:Say("The new disease I speak of is called the Bloodsabers. They are the loyal followers of Bertoxxulous and as such have been condemned by our temple. Do you wish to [join the fight]?");
	elseif(e.message:findi("join the fight")) then
		e.self:Say("Then seek out those who worship the Plaguebringer. End their threat!! Each member has upon them the mark of the Bloodsabers, a rat-shaped ring. I shall reward all those who return such rings to me.");
	elseif(e.message:findi("Brother Trintle attacked Brother Estle")) then
		e.self:Say("Impossible!! What madness do you speak of!!? If he did he must have had a reason. Maybe Trintle had been tainted by the words of Bertoxxulous..?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13301})) then
		e.self:Say("Ah, one less of the Plaguebringer's followers to poison these lands. Take this as a reward for your service."); -- Text improvised
		e.other:Ding();
		e.other:Faction(219,5,0); -- Antonius Bayle
		e.other:Faction(262,5,0); -- Guards of Qeynos
		e.other:Faction(341,5,0); -- Priests of Life
		e.other:Faction(280,5,0); -- Knights of Thunder
		e.other:Faction(221,-5,0); -- Bloodsabers
		e.other:AddEXP(1000);
		e.other:GiveCash(math.random(20),math.random(20),0,0); -- Random from 20cp20sp
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13908})) then
		e.self:Say("This is not good. Hmph. It appears they are shattered. For the first time one of our members has been swayed. I reward you for your deed. Also, if you have found anything upon Trintle, let me know.");
		e.other:Ding();
		e.other:Faction(219,5,0); -- Antonius Bayle
		e.other:Faction(262,5,0); -- Guards of Qeynos
		e.other:Faction(341,5,0); -- Priests of Life
		e.other:Faction(280,5,0); -- Knights of Thunder
		e.other:Faction(221,-5,0); -- Bloodsabers
		e.other:AddEXP(1000);
		e.other:GiveCash(math.random(20),math.random(20),0,0); -- Random from 20cp20sp
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos2  ID:2048 -- Suuspa_Clanim
