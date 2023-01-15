-- BeginFile qeynos2\Vegalys_Keldrane.lua (2051)
-- Quest file for North Qeynos - Vegalys Keldrane: Investigators Badge (Badge #1)
-- items: 2173, 18289, 2386, 18292, 2583, 2694, 2392

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you, citizen. By order of the Council of Qeynos I have been given the duty of apprehending the individuals [responsible] for unleashing this terrible plague upon the people and the lands of Antonius Bayle. The more I look into this matter, the more I come to find that this will be no easy task.");
	elseif(e.message:findi("responsible")) then
		e.self:Say("The plague unleashed upon the Plains of Karana is the work of the followers of Bertoxxulous. Those responsible belong to group known as the Bloodsabers though there were others involved as well. Some time back, they launched a plot to overthrow Antonius Bayle and our ruling council. Their [plan] failed.");
	elseif(e.message:findi("plan")) then
		e.self:Say("Their plan was to unleash a plague so deadly and virulent that it would wipe out all life from here to Highpass Hold. They planned to brand themselves and their foul allies with a rune that would have rendered them immune to the effects of this plague. From that point they would have been able to simply walk in, easily defeat the weakened stragglers and declare themselves the rulers of this kingdom by default. But they were [careless].");
	elseif(e.message:findi("careless")) then
		e.self:Say("The sudden influx of scoundrels and loathsome individuals was our first tip off. They required a rather enormous number of supplies, materials and manpower to construct the ornate altars, craft and enchant their runed branding irons and supply their armies with the weapons needed for the cleanup work afterward. They needed to rely upon [outside help].");
	elseif(e.message:findi("outside help")) then
		e.self:Say("They mostly chose to hire bandits and brigands who are foolishly more concerned with immediate profits than the long-term effects of their actions. But once they knew we were on to them they even started hiring some of the more 'civil' gnolls, if there is such a thing. Gnolls tend to be easy to push around, stupid, and they work very cheaply. They knew their time was short and they were desperate. Choosing to work with untrustworthy, lazy scoundrels caused the whole thing to begin to [unravel], praise Rodcet!");
	elseif(e.message:findi("unravel")) then
		e.self:Say("Their workers were careless. Aside from noticing the unsavory element in our city, our citizens began to run across many of the strange items and materials that were being trafficked into our city en masse. It was at that point that the citizens began to [complain] quite loudly about all of this.");
	elseif(e.message:findi("complain")) then
		e.self:Say("Obviously, they questioned the meaning behind these events and rightfully so. They were frightened much as they are now. I admit, I was remiss in my duties for not noticing it sooner. One of the biggest complainers during this time was a man by the name of [Earron Huntlan], proprieter of the famed Lion's Mane tavern. Though he is just a simple merchant, he did us a great service.");
	elseif(e.message:findi("Earron Huntlan")) then
		e.self:Say("Earron is quite a character. He gets all kinds of travelers stopping by his inn for a drink or whatever other business. His patrons started telling stories of being mugged and harassed by these loathsome individuals in the very streets of our fair city. Of course, he was concerned. So he became a kind of advocate for this cause, ringing the [alarm] bell as it were. I admit, at first I did not believe the conspiracy. I simply could not believe it was all happening under our nose.");
	elseif(e.message:findi("alarm")) then
		e.self:Say("Well, he succeeded in whipping the populace into a frenzy. He even got the famous wizard Al'Kabor to help him out by determining the nature of the strange items many of our citizens were finding. Getting that man to do anything not directly related to his research is not an easy thing to accomplish either. Needless to say, at that point I saw the truth and the Prime Healer forgive me for not seeing it sooner. Were it not for the investigations and general outcry of [concerned citizens], we might not be standing here talking today.");
	elseif(e.message:findi("concerned citizens")) then
		e.self:Say("Yes, it was citizens like you that helped to save Qeynos that day. We uncovered their plot, captured the man who was in charge and put him to death. Of course, the Bloodsabers retaliated and using their incomplete research still managed to unleash the plague we face now. Though devastating in its own right, you must admit it is rather mild compared to what it might have been. I thank you for your interest. Perhaps you would be willing to [help] me?");
	elseif(e.message:findi("help")) then
		e.self:Say("Excellent! The more I learn from my investigators the more I find that these Bloodsabers have stretched their tendrils of influence all throughout our beloved city. Nevertheless, we are committed to exposing these fiends once and for all. Perhaps you would like to become an [investigator]?");
	elseif(e.message:findi("individual that unleashed this plague")) then
		e.self:Say("A woman named Azibelle Spavin unleashed the plague. She was the bodyguard and some say concubine of Mordavin Telase. He was put to death for his long list of crimes against Qeynos, which included murder, treason and attempted genocide.  The plague was apparently her revenge. I sent one of my investigators and one of the best guardsmen we have to try and find her and bring her to justice. They are [still missing].");
	elseif(e.message:findi("still missing")) then
		e.self:Say("Kane recommended Guard Helminth personally as one of his best. They must have run into serious trouble. These were two of Qeynos' finest. I am only willing to send those with both strength and intelligence down there to complete this mission and find our people's whereabouts. Give me your Researcher's Badge should you wish to accept this mission.");
	elseif(e.message:findi("investigator")) then
		e.self:Say(string.format("Very well then, %s. We will not allow just anyone to wear the official Investigator's Badge and please forgive me. . . But it is hard to tell where one's loyalties lie these days. If you are truly [serious] then there is a duty you must perform first to show you are on the side of Antonius Bayle, the council and the good people Qeynos.",e.other:GetName()));
	elseif(e.message:findi("serious")) then
		e.self:Say("There is a guard by the name of Robbie Shilster that patrols the Northern Plains of Karana. He is allied with our enemies and completely corrupt. He is flagrant in his trafficking of contraband goods. His orders are to guard the great wooden bridge to stave off the insect swarms. But our investigators report that he simply stands to the side and watches as the swarm rolls through. You are to execute this man for his treason and bring me his helm. Then, we will talk.");
	elseif(e.message:findi("advance further") and e.other:HasItem(18289) == true) then
		e.self:Say("At this point, I am mainly in need of loyal and trustworthy investigators. I must first gather information on who these people are and exactly how far their influences stretch. However, once I begin to implement the next phase of this operation, you may be able to assist us once again if you prove to be talented enough. For now, simply continue to observe and report.");
	elseif(e.message:findi("advance further") and e.other:HasItem(2386) == true) then
		e.self:Say("Interested in advancing further are you? Excellent, we are ready to begin the next phase of our operation. We have gathered a great deal of information as a result of the latest series of arrests. We do require [interrogators] that are able to pry the information we require out those less than willing to talk. Also, Velarte Selire at the Temple of Life is looking for help with his [research]. You may wish to talk with him.");
	elseif(e.message:findi("advance further") and e.other:HasItem(2583) == true) then
		e.self:Say("Interested in helping us further? We continue to gather valuable information. We still require [interrogators] that are able to pry the information we require out those less then willing to talk. Also, Velarte Selire at the Temple of Life is looking for help with his [research] so you may wish to talk with him. Lastly, we now have information we believe may lead us to the [individual that unleashed this plague] in the first place.");
	elseif(e.message:findi("interrogators") and e.other:HasItem(2386) == true) then
		e.self:Say("If you are interested in joining the ranks of our interrogators and helping Qeynos further as we bring these fiends and murderers to justice, turn in your investigator's Badge and I will give you the briefing document you need. I already know I can trust my investigators, so there is no need to further test you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 2173})) then -- Cracked Corrupt Guard Helm
		e.self:Say("Thank you for bringing this person to justice. Please read this manual very, VERY carefully. Commit it to memory. We do everything strictly by the book. We are a people of law and order and I simply won't tolerate a breach of protocol. Investigators are expected to accurately report findings, are authorized to issue warrants and to notarize official documents for all lands under the jurisdiction of Antonius Bayle and the council. I sincerely hope you can earn your Investigator's Badge.");
		e.other:SummonItem(18289); -- Investigator's Briefing
		e.other:Ding();
		e.other:Faction(219,1,0); -- Antonius Bayle
		e.other:Faction(262,1,0); -- Guards of Qeynos
		e.other:Faction(304,-1,0); -- Ring of Scale
		e.other:Faction(273,-1,0); -- Kane Bayle
		e.other:Faction(291,1,0); -- Merchants of Qeynos
		e.other:AddEXP(2000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 2386})) then -- Investigator's Badge
		e.self:Say("Very well, here is the briefing document. Please read it very carefully. I wish you luck friend, this mission could prove to be dangerous.");
		e.other:SummonItem(18292); -- Interrogator's Briefing
		e.other:Ding();
		e.other:AddEXP(2000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 2583},0)) then -- Researcher's Badge
		e.self:Say("Here is my personal seal. Go to the sewers and locate my investigator and show him this seal if he yet lives. Find out what happened to he and guard Helminth. Then if at all possible, complete this operation by finding Azibelle Spavin and execute her. Bring me her head and return me my seal and you shall be rewarded.");
		e.other:QuestReward(e.self,0,0,0,0,2694,2000); -- Seal of Vegalys
	elseif(item_lib.check_turn_in(e.trade, {item1 = 2694,item2 = 2392})) then -- Seal of Vegalys and Head of Azibelle Spavin
		e.self:Say("Good work " .. e.other:GetCleanName() .. "! So Guard Helminth was corrupt? So crafty are these black hearted souls that they can fool even the righteous Kane Bayle himself! I'm sure he will be saddened to hear of this. I too am saddenned by the loss of one of my best investigators. At least we've served justice this day by sending Azibelle Spavin to her dark master. May she rot with her god. Take this Badge of Honor and wear it with pride and distinction.");
		e.other:Faction(219,5); -- Antonius Bayle
		e.other:Faction(262,5); -- Guards of Qeynos
		e.other:Faction(304,-5); -- Ring of Scale
		e.other:Faction(273,-5); -- Kane Bayle
		e.other:Faction(291,5); -- Merchants of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,2388,2000); -- Qeynos Badge of Honor
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EndFile qeynos2\Vegalys_Keldrane.lua (2051)
