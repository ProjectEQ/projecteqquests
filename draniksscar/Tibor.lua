--Tibor's Chain Armor (Tier 2)   
-- helm,bp,boots,gloves needed to be parsed on live for proper emotes

function event_say(e)
  if (e.other:GetFaction(e.self) <= 1) then -- require ally
    if(e.message:findi("hail")) then
      e.self:Say("I have been expecting a creature like you for sometime now as I have heard rumors of strangers in our lands. Powerful strangers that, shall we say, do not find the Muramites to be the most tasteful of folk. I am Tibor, former officer from the Dragorn militia. It was my army that held off the Muramites at the wall during those dark days. Many fine warriors under my command [fell] to those that came out of that portal near the wall. Many more in the days after that became infected with the sickness of thought that came from the influence of Discord. Brother turned on brother, friend turned on friend.");
    elseif(e.message:findi("fell")) then
      e.self:Say("Many of us had no choice but to flee rather than face striking down our own brethren and risk making our enemy stronger. So here I have been, waiting and watching . . . biding my time, gathering information. And now I am ready to put a plan into action. With your help, the dragorn can reclaim their dignity and honor by finding the courage to rise up against our enemy. I cannot promise riches for I only have a few meager pieces of [armor] to trade for your valiance. What say you?");
    elseif(e.message:findi("armor")) then
      e.self:Say("I have been slowly collecting implements of war, but have not found many weapons due in part to the Muramites destroying most of our forges. What weapons I have I cannot part with as the force I am building needs them. I do, however, have several pieces of chain armor that you may be interested in for helping me solve my [problem].");
    elseif(e.message:findi("problem")) then
      e.self:Say("The simple fact of the matter is that I cannot risk attracting attention to myself or those I still command and yet I cannot allow the Muramites that remain to do so uncontested. No, we must strike back, but if the Muramites learn that dragorns are behind the attacks, they will crush our resistance. But if someone else were to carry out the attacks they would have no cause to believe it was us. Therefore, in exchange for your help, I will give you several pieces of armor that I have. I have a [helm], a pair of [sleeves], [bracers], a pair of [gloves], a [breastplate], [leggings], and [boots].");
    elseif(e.message:findi("helm")) then
      e.self:Say("I am in need of a method of stealth. This is where you can help. There was a late dragorn elder by the name of Patorav that was always seen bearing a certain walking stick. It was rumored that this walking stick of his had the ability to guide him to his destinations safely as it avoided paths of danger. Bring me this walking stick so I may see if it the rumors hold any truth because if so, this may prove very useful to my men and me. In addition to bringing me this walking stick, I need you to discretely thin out some of the kyvs in the area as I am worried that they may discover my plans. Once you bring me the walking stick and two kyv scout rings, I will give you a fine chain helm worthy of a dragorn officer.");
    elseif(e.message:findi("sleeve")) then
      e.self:Say("If you help me, I will give you a pair of chain sleeves that even a dragorn officer would be proud to wear. I have noticed that one of the Muramites holds a certain embossed leather pouch. I'm told he carries notes and orders that may enlighten us as to the Muramite's plans for our lands and people. I want you to retrieve that pouch. I also need you to perform a secondary task for me. I've noticed a concentration of Ikaav forces near the palace and maze. Weaken the Muramite forces by reducing the number of them without attracting too much attention. Bring me this embossed leather pouch and two Ikaav Heads and I will give you the sleeves.");
    elseif(e.message:findi("bracer")) then
      e.self:Say("Though the Muramite legion was indeed fierce, our warriors almost managed to rout them at the Bloodfields portal. Our council, led by Rurof the Negotiator, formed a pact with the riftseekers. We were to push the Muramites back to the portal and the riftseekers would close it. Both Muramite and dragorn armies clashed, neither gaining ground until one moment when a small, but brave group of dragorn warriors, managed to fight their way past the Muramite guards and slay some of their commanders. At that moment the tide of battle turned against them as the shock of their loss reverberated throughout their side. Just when we gained a small advantage, the portal seemed to shimmer and close with a mighty explosion. Until that moment we believed victory [was] within our grasp.");
    elseif(e.message:findi("was")) then
      e.self:Say("Yes, we thought that the riftseekers had kept their word by closing the portal. Yet just as the portal disappeared it exploded so violently that those nearest to it were instantly cast into dust. Those of us that survived knew that we had been betrayed. At the moment of our greatest victory, the riftseekers had handed us our greatest loss. I would have you bring me back one of their hearts, but you must know that the heart of a riftseeker is not a heart like the one that beats with blood. No these vile beings keep their essence within a gem-like object that is often guarded by powerful beings. Bring me back one of their hearts so that my thirst of vengeance is quenched. Another source of constant irritation has been those disgusting discordlings that have overrun our lands. In addition to the heart bring me two withered discordling tongues so I know their accursed yelping has been forever silenced.");
    elseif(e.message:findi("glove")) then
      e.self:Say("Makyah the fierce is the most famous warrior of my people. During the invasion, scores of Muramites fell beneath the fury of his axe on that day at the portal. Not until the Muramite slayer, [Harnock] Vreck, did any Muramite give Makyah pause.");
    elseif(e.message:findi("harnock")) then
      e.self:Say("The two battled for a long time trading blow for blow, neither giving ground to the other. The battlefield, already slick with the blood of the dead or dying, caused Makyah to slip and lose his footing. As Makyah rolled down a shallow hill, Harnock jumped down upon him hoping to end the colossal struggle. Harnock raised the black sword above his head and struck Makyah in the chest. The impact of the black sword against the breastplate shattered the stones in the nearby walls and towers. Dragorn and Muramite alike were left stunned by the blast. Yet Makyah's breastplate held. Harnock's blade had shattered into so many glinting shards scattered across the field. Already defeated, Harnock simply smiled at Makyah as the [axe] fell upon his skull.");
    elseif(e.message:findi("axe")) then
      e.self:Say("Soon after this, the portal seemed to collapse upon itself and we thought we had won . . . that the invaders had been defeated. Yet moments later the air itself screamed as if mortally wounded. A tremendous blast emanated from where the portal was, annihilating both sides. No trace of Makyah's body was ever found, but I have hope that the axe may have survived the blast. As a symbol of righteousness, I could use it to rally my people. Find the axe and two Kyv whetstones so I may hone the edge again.");
    elseif(e.message:findi("breastplate")) then
      e.self:Say("At this critical time, it is crucial that my scouts are able to spy on the enemy without fear of being discovered. One of my people's most famous hunters was Jayruk. He was rumored to wear a vest of shadowy swiftness that helped him perform his duties when protecting our people. I want you to recover this vest for me so I may put it to good use. I also need you to bring me three kyv short bows so that my scouts may protect themselves.");
    elseif(e.message:findi("legging")) then
      e.self:Say("Day by day, the Muramites entrench themselves further in our lands by building towers and other defensive structures. If we are to have a chance of ever repelling them we must not allow them to continue building. As you know all too well though, I currently do not have enough warriors to do this. You must stop the Muramite architect for us. I know little about him except that he wears a stolen dragorn amulet signifying his role as the leader of the girplans though he himself is not one. Bring this amulet back to me to prove to me that he no longer leads them. In addition you must bring me three shattered ukun hides to show that you have halted their current plans.");
    elseif(e.message:findi("boot")) then
      e.self:Say("I have a pair of chain boots that once belonged to a young officer from a noble family close to my own. Ethask was captured by the Muramites and sent to their Proving Grounds to be used as sport for their warriors. Unarmed and already wounded, he never stood a chance. I have heard the Muramite that killed him was awarded a medal for the cruelty he demonstrated. Bring me proof of this Muramite's demise by showing me this Muramite Cruelty medal and I will give you the boots that Ethask wore. Though it pains me to say this, I also need you to bring me back two dragorn Muramite rings. As I have said before, some of the noblest dragorn became twisted and turned against us. Now they are but mere shadows of the honorable dragorn they once were. Release their spirits from this burden and bring me their rings as proof.");
    end
  else
    e.self:Emote("hisses as you approach but does not attack.");
  end
end


function event_trade(e)
  local class = e.other:Class();
  local item_lib = require("items");
  if (e.other:GetFaction(e.self) <= 1 or e.other:GetGM() and (class == "Berserker" or class == "Rogue" or class == "Shaman" or class == "Ranger" or e.other:GetGM())) then -- require ally and chain
    if(item_lib.check_turn_in(e.trade, {item1 = 51475,item2 = 51489,item3 = 51489})) then -- chain helm rewards 
      e.self:Say("Well met, ".. e.other:GetCleanName() ..". You may have well disrupted the Muramite chain of command long enough to afford me a chance to go looking for my surviving brothers. The Muramites are on the watch for me, but now they will be scrambling for word from their master. To thank you for your efforts, here are the chain gloves I have promised you."); --need live parse
        if class == "Berserker" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70958,100000); -- (70958); # Item: Wrathbringer's Chain Helm of the Vindicator
        end
        if class == "Rogue" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70909,100000); -- (70909); # Item: Whispering Hat of Shadows
        end
        if class == "Shaman" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70916,100000); -- (70916); # Item: Ritualchanter's Cap of the Ancestors
        end
        if class == "Ranger" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70874,100000); -- (70874); # Item: Bladewhisper Chain Cap of Journeys
        end
    elseif(item_lib.check_turn_in(e.trade, {item1 = 51479,item2 = 51493,item3 = 51493})) then -- chain sleeves rewards 
      e.self:Emote("reaches for the pouch and quickly opens it. He dumps the contents on the ground and quickly rummages through the pile, picking up a folded note and reading it. 'Yes, it turns out my suspicions were correct. This pouch contained two sets of orders, one for the girplan and discordlings, and another set for the dragorn Muramites. Now that I am aware of their plans, I can prepare my forces accordingly. I also thank you for removing some of the ikaav as this will make it easier for my soldiers to move about undetected.");
        if class == "Berserker" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70959,100000); -- (70959); # Item: Wrathbringer's Chain Sleeves of the Vindicator
        end
        if class == "Rogue" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70910,100000); -- (70910); # Item: Whispering Armguard of Shadows
        end
        if class == "Shaman" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70917,100000); -- (70917); # Item: Ritualchanter's Armguards of the Ancestors
        end
        if class == "Ranger" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70875,100000); -- (70875); # Item: Bladewhisper Chain Sleeves of Journeys
        end
    elseif(item_lib.check_turn_in(e.trade, {item1 = 51480,item2 = 51494,item3 = 51494})) then -- chain bracers rewards 
      e.self:Emote("opens his eyes wide as you hand him the heart that glows with arcane magic. 'Ah, the heart of our enemy', he says holding the heart up to the light. Within the center of the heart you notice what appears to be a small diseased shadow. Tibor violently throws the gem down to the ground and as he grinds it to dust, you hear a faraway scream that sends a shiver down your spine. 'Here is a chain bracer that I myself once wore in battle. May it bring you countless victories.");
        if class == "Berserker" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70960,100000); -- (70960); # Item: Wrathbringer's Chain Wristguard of the Vindicator
        end
        if class == "Rogue" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70911,100000); -- (70911); # Item: Whispering Bracer of Shadows
        end
        if class == "Shaman" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70918,100000); -- (70918); # Item: Ritualchanter's Wristband of the Ancestors
        end
        if class == "Ranger" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70876,100000); -- (70876); # Item: Bladewhisper Chain Wristband of Journeys
        end
    elseif(item_lib.check_turn_in(e.trade, {item1 = 51481,item2 = 51495,item3 = 51495})) then -- chain glove rewards 
      e.self:Say("Well met, ".. e.other:GetCleanName() ..". Hopefully this book will contain some valuable information on the nature of Discord. To survive on my own, I must first understand the poison affecting the land. As promised, here is the helm as your reward for such a dangerous mission.");
        if class == "Berserker" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70961,100000); -- (70961); # Item: Wrathbringer's Chain Gloves of the Vindicator
        end
        if class == "Rogue" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70912,100000); -- (70912); # Item: Whispering Gloves of Shadows
        end
        if class == "Shaman" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70919,100000); -- (70919); # Item: Ritualchanter's Mitts of the Ancestors
        end
        if class == "Ranger" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70877,100000); -- (70877); # Item: Bladewhisper Chain Gloves of Journeys
        end
    elseif(item_lib.check_turn_in(e.trade, {item1 = 51476,item2 = 51490,item3 = 51490,item4 = 51490})) then -- chain chest rewards
      e.self:Say("This is the scepter of Noble Pravel the Diviner! I recognize the markings! I can tell by the way the light has faded that he no longer draws breath. Though this is terrible news, I'm grateful at least you have recovered it from the Muramites. I'll try to smuggle this back to those still loyal to Dranik. Thanks you,".. e.other:GetCleanName() ..". As promised, here is my chain vest. It has grown too cumbersome for me to carry in my wanderings.'");
        if class == "Berserker" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70963,100000); -- (70963); # Item: Wrathbringer's Chain Chestguard of the Vindicator
        end
        if class == "Rogue" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70914,100000); -- (70914); # Item: Whispering Tunic of Shadows
        end
        if class == "Shaman" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70921,100000); -- (70921); # Item: Ritualchanter's Tunic of the Ancestors
        end
        if class == "Ranger" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70879,100000); -- (70879); # Item: Bladewhisper Chain Vest of Journeys
        end
    elseif(item_lib.check_turn_in(e.trade, {item1 = 51477,item2 = 51491,item3 = 51491,item4 = 51491})) then -- chain leg rewards 
      e.self:Say("Ah, the amulet. Yes, this surely belonged to a dragorn noble or perhaps an elder. I can still smell the stink of the Muramite that stole it though. I will see to it that it is returned to the owner or one of his brood. The demise of the architect and the girplan workers will buy our people some time to regroup. For your courageous acts, I will give you these chain leggings that are fit for even the most-skilled dragorn fighter.");
        if class == "Berserker" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70964,100000); -- (70964); # Item: Wrathbringer's Chain Leggings of the Vindicator
        end
        if class == "Rogue" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70915,100000); -- (70915); # Item: Whispering Pants of Shadows
        end
        if class == "Shaman" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70922,100000); -- (70922); # Item: Ritualchanter's Leggings of the Ancestors
        end
        if class == "Ranger" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70880,100000); -- (70880); # Item: Bladewhisper Chain Legguards of Journeys
        end
    elseif(item_lib.check_turn_in(e.trade, {item1 = 51478,item2 = 51492,item3 = 51492})) then -- chain boots rewards 
      e.self:Say("So, the embers do exist! Excellent work, ".. e.other:GetCleanName() ..". I plan to hold this ember in the forge when crafting in the future. This will ensure that the ember's heat is used to forge armor for the enemies of the Muramites. Poetic justice, don't you think? For your efforts, here are the boots as promised!");
        if class == "Berserker" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70962,100000); -- (70962); # Item: Wrathbringer's Chain Boots of the Vindicator
        end
        if class == "Rogue" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70913,100000); -- (70913); # Item: Whispering Boots of Shadows
        end
        if class == "Shaman" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70920,100000); -- (70920); # Item: Ritualchanter's Boots of the Ancestors
        end
        if class == "Ranger" or e.other:GetGM() then
          e.other:QuestReward(e.self,0,0,0,0,70878,100000); -- (70878); # Item: Bladewhisper Chain Boots of Journeys
        end
    end
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
