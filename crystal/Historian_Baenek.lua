-- items: 18237
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("As I am the remaining priest of Brell in Froststone, it is my humble duty to preserve the history of the Coldain.  Do you wish to listen to our history?");
	elseif(e.message:findi("history")) then
		e.self:Say("Very well.  You are wise to seek knowledge for it is power.  Shall I start from the beginning?");
	elseif(e.message:findi("beginning")) then
		e.self:Say("In the early days, when Brell created his children, our ancestors were chosen to seek out materials for our first city on the mainland.  It was during one such voyage that a fleet of dwarven explorers became lost when Prexus set upon them such a storm of ferocity that when it was done, days later, the dwarves had no idea where they were.  Colin Dain, with his great leadership and a vision from Brell, led the remaining ships that survived the storms, toward land.  In those early times, many a dwarf was found frozen to death on the decks of the ships on this arduous journey but with [Colin]'s determination and encouragement, our people pressed on.");
	elseif(e.message:findi("colin")) then
		e.self:Say("The fleet eventually landed but the landing did not fare better than the voyage.  Prexus was always jealous of Brell, and sent both large and small icebergs to deter us from our mission.  The ships were battered and torn apart and many of our brethren sank to the ocean floor.  What remained of our people, followed Colin from the shore to find shelter from the bone chilling wind in nearby caves in a great mountain of ice and snow in what is now called the [Eastern Wastes]");
	elseif(e.message:findi("eastern waste")) then
		e.self:Say("The Eastern Wastes is where the Coldain established their first settlement.  It was then that we discovered the hard packed ice was as strong as any stone or wood.   With this ice, we were able to carve out structures, right out of the ice.  Through time, the settlement grew into a town, and then into a keep.  The keep was then named Froststone for the stone-like ice it had been built of and with this, we realized our stay was permanent.  Up until that point, we had only encountered animals, wolves and walrus' for their skins and meat and all was good.   Then we encountered the [frost giants].");
	elseif(e.message:findi("frost giant")) then
		e.self:Say("The frost giants were the first intelligent life, if you could call them that, the Coldain encountered.  Those behemoths did not take kindly to our settlement upon their lands and so, as with all that are jealous of Brell's finest creation, they waged war.  They thought they had caught us by surprise but we knew they were coming.  We were just fooling them into thinking we were unaware!  The battle lasted for many [days].");
	elseif(e.message:findi("days")) then
		e.self:Say("It lasted for many days.  Didn't you hear me the first time?  Where was I?  Oh, yes, the battle.  Colin Dain, Brell rest his soul, decided that the giants were not worth our time so he gathered our people and lead us deeper into the mountains to seek another [place].  And the stubborn beasts followed us!  It was then that Colin, Brell rest his soul, stayed behind with a small band of volunteers and led a suicide ambush to buy the others time to escape.  He paid with his life, and so in honor of this exemplary dwarf, we called ourselves the Coldain and our leader bears the title of Dain.");
	elseif(e.message:findi("place")) then
		e.self:Emote("gestures toward the surrounding area and says 'The area known as the Crystal Caverns, which you see before you, was created in little more than four score years.  A vision from Brell was granted to a Coldain miner by the name of Glight Snowchipper, who presented his proposal to Dain Frostreaver the First and the Dain, seeing the soundness of this plan, began construction immediately.  A test came three decades later, when a giant scout followed one of our hunting parties back to our caverns and reported the location to the [chieftain] of the ice giants.'");
	elseif(e.message:findi("chieftain")) then
		e.self:Emote("spits on the ground 'Slagd Frozentoe was its name.  He led a small party of giants, only 250 or so.  Glight was given the honor of leading the defense of the caverns and using his magical pickaxe, aptly named Snowchipper, he led his forces using hit and run tactics, felling many giants.  With over half its forces dispatched, Slagd still managed to penetrate his way further into the cavern and would have made it to the city proper if not for the courageous act of [Glight].'");
	elseif(e.message:findi("glight")) then
		e.self:Say("Glight led them on a wild chase, using false passageways and such, until he finally went down a passageway with no chance of escape.  It was then that Glight triggered the cave-in of the passage burying the remaining giant forces and Glight's as well under tons of ice and snow.  To honor this act of self-sacrifice, Brell rest his soul, the cavern is known as Glight's Fall.  As a result of the cave-in, there looks to be a waterfall frozen in time.  It is said his [ghost] still remains somewhere in the caverns.  Peace was at hand for some time, but as with all things, it did not [last].");
	elseif(e.message:findi("ghost")) then
		e.self:Emote("shivers slightly. 'Glight's ghost still roams these caverns.  He can be heard wailing sometimes in the dead of night.  We think it is near the place of his death but we do not know for sure.  None who have seen him dare speak of it.'");
	elseif(e.message:findi("last")) then
		e.self:Say("Strange [creatures] began to migrate into the caves.  We do not know why they came, they just did.  They turned out to be some of the most dangerous foes we have ever encountered as they used stealth and camouflage to attack their prey.  Many a kin has fallen prey to them with only their shrieks of agony and terror to echo throughout the halls as notice of their deaths.  This did not bode well for the remaining Coldain, so it was decided that this keep was to be abandoned.  All but a few who refused to leave stayed.  And those are our ancestors.  We are the only Coldain left on this land.  We have heard no word from the others and assume them gone.");
	elseif(e.message:findi("creature")) then
		e.self:Say("We call them crystal widows.  You will understand when you see them.  Then there are the stalagterrors.  You may not realize they are there until they open their great maw to devour you as they wrap their frosty tentacles around you.  A recent arrival have been the Ry'Gorr.  They had started mining the tunnels and have not yet discovered our presence here for we kill all who wander too close.  There may be others we have not seen before, so be wary.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18237}, 0)) then
		e.self:Say("You found one of our lost tomes! A lost volume of the Book of Grudges, quite a find! Oh, dear Brell! This evidence proves that the legend of Burdael is true! Thank you, " .. e.other:GetCleanName() .. ". And now I suppose you wish to meet his ghostly form. I have sensed him from time to time. I will call to him now. Go and wait for him in the lower halls. His spirit sometimes calls to me from the fearsome stalagterrors' lair. Be wary though, undeath may have twisted his mind beyond reason.");
		e.other:Faction(460,5); -- citizen of frostone
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
		eq.spawn2(121088,0,0,-308,-151,-554,0); -- NPC: Ghost_of_Burdael
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
