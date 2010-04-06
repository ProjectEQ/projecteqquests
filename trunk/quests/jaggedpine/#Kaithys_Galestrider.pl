# NPC: #Kaithys_Galestrider.pl in Jaggedpine
# Quest: Silver Blade of Thunder  (http://everquest.allakhazam.com/db/quest.html?quest=2137)
# Written by Gameross - 04/05/10
# Ally Faction needed.  


sub EVENT_SAY {
if ($faction == 1) {
  if ($text=~/hail/i) {
	quest::emote("closes his eyes and gives a mid-bow of his head toward you. 'Greetings, traveler. It is an honor to be reunited with our kindred of the outside world of Norrath, and a great pleasure to make your acquaintance. I am Kaithys Galestrider, citizen and formerly one of many dedicated protectors of the Jaggedpine. Alas, the cycle of life has grown gray in this once vibrant body. Aaaah. . . but do not think that my spirit has grown weary as this body, dear child. I still retain a will of iron and my wisdom has only strengthened with the passing of time. [I still hold a great knowledge] unique to this old mind and my dedication toward this forest and our people is quite strong yet. Do not underestimate the power of sheer will, child, for it can be more cunning and deadly than even the sharpest of blades wielded by the mightiest of warriors.'");
  }
 
   if ($text=~/great knowledge/i) {
	quest::emote("gives a brief grumble and harshly clears his throat before speaking in his rough, strong voice, 'All citizens of the Throne of Karana's Thunder will learn to uphold an artisan skill of some sort when they come of age. This is the necessity of those of us who have lived for so long in solitude -- cut off from the outside world and left to our own for existence. In conjunction with my former duties as a ranger of the Jaggedpine, I was found to be adept in the art of blacksmithing. My mentor, who has passed beyond into the great storm of Karana's Eye, taught me the ancient rites and magics used by those of nature?s ward to enhance the quality of our products wielded by our scouts. Unfortunately, I am at a loss to continue production of these weapons, as they are in great need since the arrival of our most unexpected [threat].'");
  }

   if ($text=~/threat/i) {
	quest::emote("clears his throat and makes a motion with his strong arm toward the west, 'The gnolls of Blackburrow dug their way to our forest. Their reasons are apparently 'holy' ones for their kind as they were in search of the ancient shrine of Brell Serilis that was built by the dwarves in secrecy. . . how many years ago I am not certain of. Where the dwarves went and why, again I don't know. In any case, these 'questors' of their earthen deity have taken it upon themselves to make routine attacks on our home. I suppose they feel that if the shrine is now theirs, that the forest above should as well be their personal playing ground. Not that we care so much if the gnolls wish to pay homage to their god, mind you, but their intrusion here is far beyond a nuisance and inconvenience for with them came much more worrisome [turmoil].'");
  }

  if ($text=~/turmoil/i) {
    quest::say("Much more has come through the gnoll-dug tunnel than the gnolls and their attacks upon our home. The vile criminals of your world have followed the gnolls' heels and infected our land with their greedy lusts for wealth. It seems that one cannot walk the forest without finding a rotting, half-skinned corpse of one of our sacred beasts anymore. They kill for profit -- not for necessity, and they do it endlessly it seems. Many of our scouts have seen dark figures moving in and out of the tunnels leading to Blackburrow and our brethren in Surefall Glade have been kind enough to inform us that these poachers and thieves are selling their prizes on the underground market of Norrath. But their greed does not end at the poaching of wild beasts, for they have taken an [interest] in our ways as well. . . something that will one day prove to be a great misfortune for them.");
  }

  if ($text=~/interest/i) {
    quest::say("As I have already said, the poachers seek profit, wealth, and infamy among the goodly citizens of your world -- and now ours. Like infectious parasites, they feed off of the recognition of their names and the fear that comes to those innocents who are cursed with their attentions. The way they earn this infamy is to directly assault those who would remember them and in this case, it is the Throne of Karana's Thunder that they have turned to in order to quench that venomous desire of theirs. They have raided the village and many of our brothers and sisters, stealing what they can that might fetch some price on their criminal's market. However, it has become a much more dangerous situation than mere thieving of family heirlooms -- we fear that they are unwittingly [aiding a much greater threat] to all protectors of the natural order.");
  }

  if ($text=~/greater threat/i) {
    quest::say("One of the items stolen in the recent raids was a priceless and sacred tome -- the Tome of Thunder. This ancient tome was scribed by the first of our druids many centuries ago, when the Throne of Karana's Thunder and the Shrine of Karana were constructed. This tome detailed the legend of Karana, the legend of our people and the creation of these still standing monuments that act as a testament of The Rainkeeper's power and his influence among us. Our efforts to relocate the tome were proven unsuccessful until the aid of the Qeynos loyalists came to our side. A scout of the Jaggedpine Treefolk came across some information and his [report] is most disturbing if proven to be the true fate of the Tome of Thunder.");
  }
  
  if ($text=~/report/i) {
	quest::emote("sighs and shakes his head in further display of his disappointment, 'It seems that the Tome of Thunder was something commissioned to be stolen -- that one who knew of the poachers and their recent activities in the Jaggedpine paid these criminals to steal this specific tome. The scout believes to have found the individual, or [group] rather, that sought and likely now holds the tome and if my suspicions are correct, then it does not bode well for all that pay homage to the sacred protection of nature.'");
  }

  if ($text=~/group/i) {
    quest::say("The scout believes them to be a cult of militant, brutal, and viscous so-called druids and rangers who have resided in the planes of Karana and the Mountains of Rathe for decades now. This group calls themselves the Unkempt Druids -- but they are false bearers of the Unkempt name, my friend. The true Unkempt reside in solitude to the east in the Unkempt Wood, sealed off from the rest of the world as we were for so long. This is as much a blessing as it is unfortunate for the true unkempt are far more feral and dangerous than any ignorant cultists of your world could even dream to be. What these imposters wish with the Tome of Thunder we have to discover -- but the fact that they exist at all is the danger. We have worked long and hard to keep the unkempt ways unique to their inaccessible territory but this news that the unkempt philosophies, if only a small part of them, have reached the interest of outsiders is very [troubling].");
  }
  
  if ($text=~/troubling/i) {
	quest::emote("coughs hard for a moment and then clears his throat, the old mans attentions clearly caught off-guard and his eyes wide with surprise, 'Why is this troubling, you ask?! Any who serves nature -- any part of it be them of the Mother of All or The Rainkeeper must realize that the [philosophies] and ways of the unkempt are not only the ways of chaotic, brutal, viscous, and murderous killers who hold no remorse for their actions against their fellow homid kin, but their ways are one of the greatest threats to ours. They have immersed themselves in the chaos of nature -- acting like a pack of wild, frenzied wolves that will kill any that stumbles into their territory, as well as their own kind when it is deemed 'necessary'. They are feral and wild, believing all semblance of civilization to be blasphemous to the protection of nature and they despise those like you and I because we accept and embrace our culture and use it as a part of our path.'");
  }

  if ($text=~/philosophies/i) {
	quest::say("To be honest, we know very little about the unkempt as they are not ones to openly share their ways with outsiders in the civil manner of words. What we do know, however, is that where we try to accept and teach all who would lend ear the importance of the natural world -- allowing them to continue their culture and civilization in a way that would not disturb the precious and delicate order and balance of nature, the Unkempt hold a much different outlook. They would see any who give recognition or pledge any fealty to civilization or culture as enemies and thus, they would and will exterminate them. Well. . . so is the perception, in any case. However, we do know that the true unkempt have [no desire to leave their woods] leaving the only explanation for those beyond the Unkempt Woods' boundaries to be impostors.");
  }

   if ($text=~/leave their woods/i) {
    quest::say("We are not certain, but I believe that they are content where they lay. The true unkempt do not show the desire to convert the other orders dedicated to the preservation of nature to their ways through any mass scale mission. Much of this recluse nature is likely a result of the strong influence of the Tribes of the Dawn and the Moon. To be honest, the barricades keeping the unkempt sealed from the Jaggedpine were set in-place with the desire to keep our young, curious, and strong-headed rangers and druids from venturing into the territory. There was also an element of desire to keep the inhabitants of the forest there, for although they may not seem the missionary types, figuratively speaking of course, their ways may very well escape the confines of the Unkempt Wood and many thirsty and curious young druids and rangers might find themselves seduced by the allure and mystery of the Unkempt ways. Unfortunately, it seems that our efforts have [proven to be in vain].");
  } 
  if ($text=~/proven to be in vain/i) {
    quest::say("If what the scout of the glade says is true and the presence of unkempt cultists is indeed a reality then somehow the philosophies or some semblance of them have leaked out into the world. I sincerely doubt that their naming convention is but a coincidence. The true unkempt pay homage to the Mother of All exclusively, although they do so not within the traditional methods of worship and reverence. From what we have gathered, they view her as a spiritual manifestation of the cycle and balance of the natural world -- the divine force that ultimately fuses the delicate balance between life and death, creation and destruction together. That is why it is so difficult to understand why these cultists would want our tome. Perhaps they were misinformed by the one who had introduced them to the path of the unkempt. In any case, despite their reasons for reaving it into their possession, the tome must be [returned] to us.");
  }
 
  if ($text=~/return the tome/i) {
	quest::emote("furrows his heavy, wrinkled brow as he carefully studies you, 'If you believe you can brave such an endeavor, child, then I am willing to accept the offering of your services to us. The scout of the glade tracked the tome as far as the Mountains of Rathe. I would suggest that be the start of your search. Once you have retrieved the tome, return it to me with haste. We do not want you to be followed or any unnecessary attention being brought to us. When and if you return with the tome, I shall see what I can do to reward your efforts, but without the tome, I fear that my talents are of little use to one of your caliber. But mind you, child, a scout of The Rainkeeper may only use the reward I can provide -- the scouts I refer to are the rangers, rogues and bards who have dedicated themselves to the laws of the storm. If you cannot complete this task without reward and are unable to wield that which I can provide, then move along and know that I bear you no ill will for doing so.'");
  }
if (defined($qglobals{silverbladeofthunder}) && $qglobals{silverbladeofthunder} == 1) {
   if ($text=~/key materials/i) {
    quest::say("There is a blade, a cursed blade that I have held onto for many years now. Until Gurrin came of age and his skills in blacksmithing and his druidic magics had matured, I was unable to purify the curse and use the blade to create one of my finest creations yet. That weapon is the Blade of Rot -- a weapon that I procured during one of my finer moments as a young adventurer. You see, before the Jaggedpine was sealed, I had frequently left the confines of the forest in search of adventure and my own curiosity of the unknown world guided me. Shortly before the Jaggedpine was sealed, one of my companions stumbled upon a spell that would create a mysterious gateway to an unknown place. Of course, we were foolhardy and arrogant in our ways, so naturally we encouraged our wizard, Yanous, to create the gateway so that we might scout what lies beyond in the unknown. Little did we know the [horrible danger] we had brought upon ourselves.");
  }

  if ($text=~/horrible danger/i) {
	quest::emote("chuckles hoarsely to himself in fond remembrance of his youth, 'We, a group of able, adept, and arrogant adventurers found ourselves in a maelstrom of darkness, chaos, and hate. Aye, my child, we had miraculously found and foolishly walked through a gateway that led to the astral realm of the Prince of Hate. Awestruck, excited, and justly frightened, we dispelled any thoughts to turning away and readied our blades and minds for the battles of our young lives. After all, how could we turn away? This was a true adventure -- to be in the midst of the danger of dangers and engage in the battle of battles. We fought for what seemed to be eons; undead after undead and priest after priest -- each one falling to a torrent of blades and woven magical energies. We emerged victorious through even the seemingly impossible battles and then as we readied our blades for yet another planar villain, the [tides were turned].'");
  }

  if ($text=~/turned/i) {
    quest::say("'Till the day that the Eye of Karana's Storm takes me, I will never forget the sight that fell before us. An unnatural behemoth; a monster of steel, bone, and flesh stood before us. Its blue-black flesh was like a sheet of silk stretched over unnaturally formed muscles beneath an exoskeleton of bone and steel-plated armor. The armor child, the armor breathed! It pulsed with life. . . or death, and it moved -- slithering around its host's form like cloth churned by a gentle breeze. Clutched in one of its massive talons was the twisted length of steel and bone, which it wielded with a grace I've yet to see surpassed and the deadly force of Innoruuk's very hatred. We engaged this agent of hate -- this nemesis of life for what seemed an immeasurable limit of time. All that I can remember are the deafening, monstrous roars bellowed by the knight and the blaze of steel, blood, and flesh that danced around us in the peril we engaged. [Victory] seemed impossible.");
  }

  if ($text=~/victor/i) {
	quest::emote("sighs, his demeanor now strikingly seriously, 'In the finest aspect of the world -- aye, we ultimately defeated the monster but not without consequence. My brother both in blood and in arms fell, as did our enchantress and my beloved, Malyrie. We could not save them. . . I still remember Malyrie's calling to me; pleading for us to flee and leave her to hold off the rushing hoards of Innoruuk's servants that sought to avenge their fallen champion. Yanous, a Koada'Dal wizard who I believe still lives but whom I have not seen in decades, fell upon instinct and phased us away from that place of death and hate. I can only assume that Malyrie perished shortly thereafter, and my brother's corpse was never laid to a proper burial. However, I was able to recover the massive [blade] that the knight wielded -- I don't know why exactly I recovered it, but it was a force strangely like a foreign instinct that forced me to take it up from the ground.'");
  }

  if ($text=~/blade/i) {
    quest::say("When we returned to the Jaggedpine and several weeks after the mourning of our departed loved ones, I took the liberty of inspecting the blade carefully. It was a curious item, although saturated with the corruption and evil of the very seething hatred that inspires all of Innoruuk's creations. Through extensive research and Yanous' aid, I was able to determine that the blade was tied to the Deathrot Knight -- the creature that wielded the blade, but it was fading, attempting to return to the divine realm that it was forged in. Yanous placed an enchantment upon the weapon to keep the corruption dormant and its 'consciousness' at bay, so long as the weapon remained within the confines of the Jaggedpine. Unfortunately, [Yanous was unable to purge the corruption] from the blade entirely and we felt it wise to not speak its presence to the elder priests whom might have been able to do that which Yanous was unable.");
  }

  if ($text=~/purge the corruption/i) {
    quest::say("Though his powers as a wizard are great, his knowledge did not reach far enough into the occult and the spiritual realms of divine magic. He did what he could and it was more than enough for the time being. As I have already said, I have been waiting patiently for my assistant and apprentice to come of age and mature in his priestly power before I attempted to make proper use of this blade in honor of my brother and beloved's demise. But, the blade was stolen before I was able to present it in secret to Gurrin and I fear that it may have returned to the realm of hate and the Deathrot Knight may again be in existence. We must have the blade returned and the only way you can do this is to venture to the plane of hate and destroy the Deathrot Knight. You must return the blade to Gurrin with the Writ of Thunder and we shall be able to complete what was intended all those years ago.");
  }
 }
}
}

sub EVENT_ITEM {
if ($faction == 1) {
  if (plugin::check_handin(\%itemcount, 8907 => 1)){ #Tome of Thunder from an unkempt fanatic
    quest::emote("examines the tome carefully, running his callused hands over the cover and spine and flipping through the ancient parchement within, 'Yes...nicely done, child. It is in miraculous condition for the recent fate that befell it. I am indebted to you and have the noblest intentions to repay your efforts. However, whilst you were away, my smithy was raided and most of my needed supplies to create the item I think a suitable reward for your efforts were stolen by the poachers. I will need to retrieve one of the [key materials] and take it with the Writ of Thunder to my assistant, Gurrin Nitestorm who you may find in the Surefall Glade.'");
    quest::exp(1000);
    quest::ding();
    quest::faction(271,20);  #Residents of Jaggedpine
    quest::faction(159,20);  #Jaggedpine Treefolk
    quest::faction(265,20);  #Protectors of Pine
    quest::faction(135,20);  #Guards of Qeynos
	quest::setglobal("silverbladeofthunder",1,0,F);
	quest::summonitem(8908); # Writ of Thunder
   }
  if (plugin::check_handin(\%itemcount, 8915 => 1) && $qglobals{silverbladeofthunder} == 1){ # Purified Silver Blade turn in from Gurrin Nitestorm in Surefall
	quest::emote("takes the blade and intently examines it. Satisfied with the purified quality, he nods to himself and proceeds to remove the gem from the hilt of the blade before returning it to Malvesti, 'You will need to seek out two items and return them to me. Those items are the Essence of Thunder and the Voice of Karana. The essence you will find in The Hole where one known as Ikurenm the Sly resides. Some time ago, before my initial acquisition of the blade, this imp stole the sacred rune from my mentor and only now are we able to retrieve it for its purpose has now reached its dawn. The second item, the Voice of Karana, you will find in the possession of Zrithsadioun the Tainted who wanders the planes of Southern Karana. Zrithsadioun is one of the plague worshiping gnolls of Infected Paw who is so twisted and vile that even his own people have cast him out. Very recently, one of our scouts overheard the gnolls of the shrine discussing a recent loss of their stolen bounty. One of the items that were stolen from them..."); #Final sentence incomplete from live
	quest::exp(10000);
    quest::ding();
    quest::faction(271,20);  #Residents of Jaggedpine
    quest::faction(159,20);  #Jaggedpine Treefolk
    quest::faction(265,20);  #Protectors of Pine
    quest::faction(135,20);  #Guards of Qeynos
    quest::summonitem(17505); # Container to combine Essence of Thunder(8912) and Voice of Karana(8913) in to form the Silver Blade of Thunder(8916)
    quest::delglobal("silverbladeofthunder");
  }
 }
 plugin::return_items(\%itemcount);
}