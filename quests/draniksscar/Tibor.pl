# Tibor's Chain Armor (Tier 2)
#location draniks scar -1093 -908 192
#Appearance: http://eqbeastiary.allakhazam.com/search.shtml?id=16675

sub EVENT_SAY {
  if($faction < 3) {
    if($text=~/hail/i) {
      quest::say("I have been expecting a creature like you for sometime now as I have heard rumors of strangers in our lands. Powerful strangers that, shall we say, do not find the Muramites to be the most tasteful of folk. I am Tibor, former officer from the Dragorn militia. It was my army that held off the Muramites at the wall during those dark days. Many fine warriors under my command [fell] to those that came out of that portal near the wall. Many more in the days after that became infected with the sickness of thought that came from the influence of Discord. Brother turned on brother, friend turned on friend.");
    }
    if($text=~/fell/i) {
      quest::say("Many of us had no choice but to flee rather than face striking down our own brethren and risk making our enemy stronger. So here I have been, waiting and watching . . . biding my time, gathering information. And now I am ready to put a plan into action. With your help, the dragorn can reclaim their dignity and honor by finding the courage to rise up against our enemy. I cannot promise riches for I only have a few meager pieces of [armor] to trade for your valiance. What say you?");
    }
    if($text=~/armor/i) {
      quest::say("I have been slowly collecting implements of war, but have not found many weapons due in part to the Muramites destroying most of our forges. What weapons I have I cannot part with as the force I am building needs them. I do, however, have several pieces of chain armor that you may be interested in for helping me solve my [problem].");
    }
    if($text=~/problem/i) {
      quest::say("The simple fact of the matter is that I cannot risk attracting attention to myself or those I still command and yet I cannot allow the Muramites that remain to do so uncontested. No, we must strike back, but if the Muramites learn that dragorns are behind the attacks, they will crush our resistance. But if someone else were to carry out the attacks they would have no cause to believe it was us. Therefore, in exchange for your help, I will give you several pieces of armor that I have. I have a [helm], a pair of [sleeves], [bracers], a pair of [gloves], a [breastplate], [leggings], and [boots].");
    }
    if($text=~/helm/i) {
      quest::say("I am in need of a method of stealth. This is where you can help. There was a late dragorn elder by the name of Patorav that was always seen bearing a certain walking stick. It was rumored that this walking stick of his had the ability to guide him to his destinations safely as it avoided paths of danger. Bring me this walking stick so I may see if it the rumors hold any truth because if so, this may prove very useful to my men and me. In addition to bringing me this walking stick, I need you to discretely thin out some of the kyvs in the area as I am worried that they may discover my plans. Once you bring me the walking stick and two kyv scout rings, I will give you a fine chain helm worthy of a dragorn officer.");
    }
    if($text=~/sleeves/i) {
      quest::say("If you help me, I will give you a pair of chain sleeves that even a dragorn officer would be proud to wear. I have noticed that one of the Muramites holds a certain embossed leather pouch. I'm told he carries notes and orders that may enlighten us as to the Muramite's plans for our lands and people. I want you to retrieve that pouch. I also need you to perform a secondary task for me. I've noticed a concentration of Ikaav forces near the palace and maze. Weaken the Muramite forces by reducing the number of them without attracting too much attention. Bring me this embossed leather pouch and two Ikaav Heads and I will give you the sleeves.");
    }
    if($text=~/bracers/i) {
      quest::say("Though the Muramite legion was indeed fierce, our warriors almost managed to rout them at the Bloodfields portal. Our council, led by Rurof the Negotiator, formed a pact with the riftseekers. We were to push the Muramites back to the portal and the riftseekers would close it. Both Muramite and dragorn armies clashed, neither gaining ground until one moment when a small, but brave group of dragorn warriors, managed to fight their way past the Muramite guards and slay some of their commanders. At that moment the tide of battle turned against them as the shock of their loss reverberated throughout their side. Just when we gained a small advantage, the portal seemed to shimmer and close with a mighty explosion. Until that moment we believed victory [was] within our grasp.");
    }
    if($text=~/was/i) {
      quest::say("Yes, we thought that the riftseekers had kept their word by closing the portal. Yet just as the portal disappeared it exploded so violently that those nearest to it were instantly cast into dust. Those of us that survived knew that we had been betrayed. At the moment of our greatest victory, the riftseekers had handed us our greatest loss. I would have you bring me back one of their hearts, but you must know that the heart of a riftseeker is not a heart like the one that beats with blood. No these vile beings keep their essence within a gem-like object that is often guarded by powerful beings. Bring me back one of their hearts so that my thirst of vengeance is quenched. Another source of constant irritation has been those disgusting discordlings that have overrun our lands. In addition to the heart bring me two withered discordling tongues so I know their accursed yelping has been forever silenced.");
    }
    if($text=~/gloves/i) {
      quest::say("Makyah the fierce is the most famous warrior of my people. During the invasion, scores of Muramites fell beneath the fury of his axe on that day at the portal. Not until the Muramite slayer, [Harnock] Vreck, did any Muramite give Makyah pause.");
    }
    if($text=~/harnock/i) {
      quest::say("The two battled for a long time trading blow for blow, neither giving ground to the other. The battlefield, already slick with the blood of the dead or dying, caused Makyah to slip and lose his footing. As Makyah rolled down a shallow hill, Harnock jumped down upon him hoping to end the colossal struggle. Harnock raised the black sword above his head and struck Makyah in the chest. The impact of the black sword against the breastplate shattered the stones in the nearby walls and towers. Dragorn and Muramite alike were left stunned by the blast. Yet Makyah's breastplate held. Harnock's blade had shattered into so many glinting shards scattered across the field. Already defeated, Harnock simply smiled at Makyah as the [axe] fell upon his skull.");
    }
    if($text=~/axe/i) {
      quest::say("Soon after this, the portal seemed to collapse upon itself and we thought we had won . . . that the invaders had been defeated. Yet moments later the air itself screamed as if mortally wounded. A tremendous blast emanated from where the portal was, annihilating both sides. No trace of Makyah's body was ever found, but I have hope that the axe may have survived the blast. As a symbol of righteousness, I could use it to rally my people. Find the axe and two Kyv whetstones so I may hone the edge again.");
    }
    if($text=~/breastplate/i) {
      quest::say("At this critical time, it is crucial that my scouts are able to spy on the enemy without fear of being discovered. One of my people's most famous hunters was Jayruk. He was rumored to wear a vest of shadowy swiftness that helped him perform his duties when protecting our people. I want you to recover this vest for me so I may put it to good use. I also need you to bring me three kyv short bows so that my scouts may protect themselves.");
    }
    if($text=~/leggings/i) {
      quest::say("Day by day, the Muramites entrench themselves further in our lands by building towers and other defensive structures. If we are to have a chance of ever repelling them we must not allow them to continue building. As you know all too well though, I currently do not have enough warriors to do this. You must stop the Muramite architect for us. I know little about him except that he wears a stolen dragorn amulet signifying his role as the leader of the girplans though he himself is not one. Bring this amulet back to me to prove to me that he no longer leads them. In addition you must bring me three shattered ukun hides to show that you have halted their current plans.");
    }
    if($text=~/boots/i) {
      quest::say("I have a pair of chain boots that once belonged to a young officer from a noble family close to my own. Ethask was captured by the Muramites and sent to their Proving Grounds to be used as sport for their warriors. Unarmed and already wounded, he never stood a chance. I have heard the Muramite that killed him was awarded a medal for the cruelty he demonstrated. Bring me proof of this Muramite's demise by showing me this Muramite Cruelty medal and I will give you the boots that Ethask wore. Though it pains me to say this, I also need you to bring me back two dragorn Muramite rings. As I have said before, some of the noblest dragorn became twisted and turned against us. Now they are but mere shadows of the honorable dragorn they once were. Release their spirits from this burden and bring me their rings as proof.");
    }
  }
  else {
    quest::say("I do not know you well enough, yet."); #Made up text
  }
}

sub EVENT_ITEM {
  if($faction < 3) {
    if (plugin::check_handin(\%itemcount, 51489 => 2, 51475 => 1)) { #cap
      if($class eq "Berserker") {
        quest::summonitem(70958);
      }
      if($class eq "Rogue") {
        quest::summonitem(70909);
      }
      if($class eq "Shaman") {
        quest::summonitem(70916);
      }
      if($class eq "Ranger") {
        quest::summonitem(70874);
      }
    }
    elsif (plugin::check_handin(\%itemcount, 51493 => 2, 51479 => 1)) { #sleeves
      quest::emote("reaches for the pouch and quickly opens it. He dumps the contents on the ground and quickly rummages through the pile, picking up a folded note and reading it.");
      quest::say("Yes, it turns out my suspicions were correct. This pouch contained two sets of orders, one for the girplan and discordlings, and another set for the dragorn Muramites. Now that I am aware of their plans, I can prepare my forces accordingly. I also thank you for removing some of the ikaav as this will make it easier for my soldiers to move about undetected.");
      if($class eq "Berserker") {
        quest::summonitem(70959);
      }
      if($class eq "Rogue") {
        quest::summonitem(70910);
      }
      if($class eq "Shaman") {
        quest::summonitem(70917);
      }
      if($class eq "Ranger") {
        quest::summonitem(70875);
      }
    }
    elsif (plugin::check_handin(\%itemcount, 51494 => 2, 51480 => 1)) { #bracers
      quest::emote("opens his eyes wide as you hand him the heart that glows with arcane magic. 'Ah, the heart of our enemy', he says holding the heart up to the light. Within the center of the heart you notice what appears to be a small diseased shadow. Tibor violently throws the gem down to the ground and as he grinds it to dust, you hear a faraway scream that sends a shiver down your spine. 'Here is a chain bracer that I myself once wore in battle. May it bring you countless victories.");
      if($class eq "Berserker") {
        quest::summonitem(70960);
      }
      if($class eq "Rogue") {
        quest::summonitem(70911);
      }
      if($class eq "Shaman") {
        quest::summonitem(70918);
      }
      if($class eq "Ranger") {
        quest::summonitem(70876);
      }
    }
    elsif (plugin::check_handin(\%itemcount, 51495 => 2, 51481 => 1)) { #gloves
      if($class eq "Berserker") {
        quest::summonitem(70961);
      }
      if($class eq "Rogue") {
        quest::summonitem(70912);
      }
      if($class eq "Shaman") {
        quest::summonitem(70919);
      }
      if($class eq "Ranger") {
        quest::summonitem(70877);
      }
    }
    elsif (plugin::check_handin(\%itemcount, 51492 => 2, 51478 => 1)) { #boots
      if($class eq "Berserker") {
        quest::summonitem(70962);
      }
      if($class eq "Rogue") {
        quest::summonitem(70913);
      }
      if($class eq "Shaman") {
        quest::summonitem(70920);
      }
      if($class eq "Ranger") {
        quest::summonitem(70878);
      }
    }
    elsif (plugin::check_handin(\%itemcount, 51490 => 3, 51476 => 1)) { #chest
      if($class eq "Berserker") {
        quest::summonitem(70963);
      }
      if($class eq "Rogue") {
        quest::summonitem(70914);
      }
      if($class eq "Shaman") {
        quest::summonitem(70921);
      }
      if($class eq "Ranger") {
        quest::summonitem(70879);
      }
    }
    elsif (plugin::check_handin(\%itemcount, 51491 => 3, 51477 => 1)) { #leggings
      quest::say("Ah, the amulet. Yes, this surely belonged to a dragorn noble or perhaps an elder. I can still smell the stink of the Muramite that stole it though. I will see to it that it is returned to the owner or one of his brood. The demise of the architect and the girplan workers will buy our people some time to regroup. For your courageous acts, I will give you these chain leggings that are fit for even the most-skilled dragorn fighter.");
      if($class eq "Berserker") {
        quest::summonitem(70964);
      }
      elsif($class eq "Rogue") {
        quest::summonitem(70915);
      }
      elsif($class eq "Shaman") {
        quest::summonitem(70922);
      }
      elsif($class eq "Ranger") {
        quest::summonitem(70880);
      }
    }
    else {
      quest::say("These are not the pieces I need."); #Made up text
      plugin::return_items(\%itemcount);
    }
  }
  else {
    quest::say("I do not know you well enough to entrust you with such an item, yet."); #Made up text
    plugin::return_items(\%itemcount);
  }
}