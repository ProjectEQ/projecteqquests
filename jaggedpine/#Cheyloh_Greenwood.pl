# Cheyloh Greenwood
# Jaggedpine druid armor quest
# by RealityIncarnate

sub EVENT_SAY {
if($text=~/Hail/i) {
quest::emote("gives a warm smile");
quest::say("Greetings traveler and welcome to Fort Jaggedpine, our humble, though suitable home. If you have need of my [wares or talents], then please do not hesitate to inquire. I am always more than willing to share our ancient knowledge with our kin of the outside world.");
}

if($text=~/wares or talents/i) {
quest::say("Here in the Jaggedpine, I serve as a seamstress and one of many protectors of our precious home. Our people will often come to me in search of my talents in the ways of weaving. Often times my father and his students will seek to borrow my knowledge of the natural world and The Rainkeeper to weave specific pieces of an [ancient suit of leather] worn by our most adept and dedicated of druids.");
}

if($text=~/ancient suit of leather/i) {
quest::say("When our ancestors were young to the Jaggedpine and the Throne of Karana's Thunder was in the fledgling years of its establishment, a young seamstress and druid by the name of Hymara Cloudweaver discovered the laws of accepting nature's gifts in return for our services in protecting her. Hymara used these gifts of the wilderness to sew a complex suit of armor, which she then wove energies of the wilderness into. These gifts were used solely for the purpose of the protection of the pine, and we uphold her legacy to t his day. The armor is acquired upon a [path of devotion] successfully walked by our most devoted of druids.");
}

if($text=~/path of devotion/i) {
quest::say("One must protect nature to the fullest of their abilities in both faith and conviction to walk this path. The world they ward will in-turn present her sacred gifts unto those who walk this path with the true desire, intent, and fulfillment of their duties. To weave specific components of the armor, the druid uses these gifts of the nature and once that druid has [proven themselves worthy] of these gifts, one such as I would aid in the final steps to create the armor.");
}

if($text=~/prove myself worthy/i) {
quest::emote("raises a brow and gives another gentle smile toward $name");
quest::say("Very well, my friend. If you wish to take upon yourself the task to prove your devotion to nature, I will be more than willing to lend my talents justly to your cause. There are several individual [pieces] to this mystic suit of armor, and each piece requires a test of your faith and dedication to that which you have declared your life to protect.");
}

if($text=~/pieces/i) {
quest::say("My skills and knowledge of history extends my talents to the creation of the [leggings], [sleeves], [bracer], [boots], [gloves], and [circlet] of the Armor of the Pine. My father, Nolan Greenwood, is the only who holds the necessary faith and mastery in the knowledge of history that is needed to make the most sacred and powerful piece of this set -- the Tunic of the Pine. There are several components needed to complete each piece of armor that I specifically am able to create. Those components vary between each individual piece. You will need to endeavor through several tasks to complete the set, but as with nature, there is no true order to the tasks that you must complete. Tell me which piece you wish to [acquire], and I shall guide you as necessary.");
}

if($text=~/leggings/i) {
quest::say("Very well, $name. There are two components that you will need to return to me; [Polished Jade Acorns] and [Moss Threaded Rawhide Leggings]. But procuring those items will not be an easy task, and I can assure that you will plunge yourself into danger to complete it. However, you should not know fear of this for we must often selflessly endanger ourselves to fulfill our ultimate goal in protecting and preserving the purity of nature. Through these endeavors, your success will be rewarded by nature's recognition and she shall grant to you the gifts you will need to complete this task.");
}

if($text=~/polished jade acorns/i) {
quest::say("Every piece of the Armor of the Pine requires a special stone. These stones have been carved into different shapes by our artisans and each one blessed by our elder warders of the pine. Unfortunately, the introduction of the poachers through the recently carved passageway between the forest and the den of Blackburrow has brought us a loss in these sacred items. The Blackguard family and their henchmen have raided our fort several times, stealing our materials to be sold illegally upon the underground market of Norrath. However, the poachers are very limited in their knowledge of this area and our ranger scouts have informed us that [Myraephe the Pure] killed the one who stole the specific stones we need.");
}

if($text=~/myraephe the pure/i) {
quest::say("The Hatchling River -- a beautiful waterway jealously protected by the nymph spirits known as Potameides, fuels the lifeblood of this forest. These naiads are beautiful creatures, who were benevolent to us until the development of great cultures and the construction of great cities destroyed much of nymph kind. The Potameides felt the loss of their sisters and became hostile to all mortals alike, viewing our presence as a threat to their very existence. Myraephe is one of the ancient Potameides and our scouts have said that in recent days she wears a necklace made of Polished Stone Acorns. Seek Myraede and retrieve the acorns as you will, my friend. Know neither regret nor sorrow for your actions as the Potameides intentions have been influenced by the threat of the Unkempt Wood to the east. The Potameid spirit will return to protect the river it is bound to, so long as the river itself does not become corrupt.");
}
if($text=~/rawhide leggings/i) {
quest::say("To procure this item, you will need to venture to Surefall Glade and speak with my beloved fiancee, Lerian Wyndrunner. His talents in the ways of leather and hide are unsurpassed by any of our people in the Jaggedpine and his devotion and faith to The Rainkeeper make him all the more important to your cause. Approach him and inquire about the Moss Threaded Rawhide Leggings. He will know of your task and will guide you well.");
}

if($text=~/sleeves/i) {
quest::say("If that is your wish, my friend. You will need to seek out two items and return them to me. In the depths of the Potameid caves located off of the Hatchling River, you will find the Potameid Protectors. Our ranger scouts have found many of our sacred jade ornaments scattered throughout the possession of the Potameides. The reports indicate that it is the protectors who hold the Polished Jade Leaves, which you must acquire for the final product. The second item that you must return to me are the Shark Tooth Sleeves. Seek out Lerian Wyndrunner in Surefall Glade and he will guide you in obtaining the Shark Tooth Sleeves.");
}

if($text=~/boots/i) {
quest::say("Then you shall endeavor to earn such a gift. I will guide and aid you where I can, as will Lerian Wyndrunner, whom you may find in Surefall Glade -- but it is you who will ultimately prove yourself worthy of this item and the sacred oath that is tied to it -- the oath of the guardian of nature. You must venture out into the world and procure several items that you will eventually return to me. The items I require are two Polished Jade Plates from the Potameid Guardians of the Hatchling River. Our rangers have reported much of our recently stolen jade ornaments to be in the possession of the Potameides -- the jade items likely came into their possession after they killed the poachers who raid our fort here on occasion. Lerian will guide you to acquire the second item if you approach and inquire to him about the Mithril Fern Boots.");
}

if($text=~/bracer/i) {
quest::say("Then you shall work to obtain that which you desire, my friend. Nature's gifts are not given without justification and you must prove yourself worthy of this most sacred of our items. You must venture out into the wilds and procure the Polished Jade Blossoms and the Bracer of Braided Pine, both to be returned to me. The Jade Blossoms are not traditional flora -- they are of the jade stones carved by our artisans and blessed by our elders. You will likely find them in the Potameid Caves, where many of our recently lost charms have been discovered in the recent past. The Potameid Temptresses use the blossoms as charms around their necks, or so the scouts have reported. To acquire the bracer, you must seek out Lerian Wyndrunner, who currently resides in the Surefall Glade. Speak with him about the Bracer of Braided Pine and he shall guide you to fulfilling this task.");
}

if($text=~/gloves/i) {
quest::say("You must continue to uphold the sacred duties that you have pledged your existence to and thus gain nature's recognition to fulfill this task. The items I require so that I might properly weave the gloves are Polished Jade Studs and Forest Woven Gloves. The Polished Jade Studs you will find in the Potameid Caves, where much of our sacred jade ornaments have found their way by the fates of the thieves and poachers who infest this land and frequently raid our homes. Our scouts believe the Potameid Matriarchs to hold the jade studs, and I would heed their advice to discourage any unnecessary danger to you. The Forest Woven Gloves will require further aid from a member of the Jaggedpine to obtain. Seek out my beloved, Lerian, in the Surefall Glade and inquire about the gloves. He will know who has sent you and what he must do to aid you.");
}

if($text=~/circlet/i) {
quest::say("Nature will provide to you what it is you provide to her -- if you protect her, she shall in-turn offer shelter and provide to you. I shall aid you, as is my duty here, but you must set out on your own before my aid can be granted. There are two items you must seek; a Polished Jade Tear that resides in the clutches of Lameriae the Alluring, a powerful Potameid Temptress who seduced and killed one of the Blackguard's most cunning of thieves and hunters. It is said that she holds the tear, which was given to her by the entranced Blackguard before he drowned to death. The second item you must retrieve for me is a Shadowjade Circlet that Jhaya Wyndrunner in Surefall Glade will aid you to acquire -- all you need to do approach and ask her.");
}

}

sub EVENT_ITEM {

#moss threaded leggings and jade acorns -> Leggings of the Pine
#text made up
if($itemcount{8790} && $itemcount{8769}) {
quest::emote("smiles warmly at $name");
quest::say("Excellent work, friend.  I have sewn the Polished Jade Acorns into your leggings.  May they serve you as well as you have served the natural world.");
quest::summonitem(8442);
}

#shark tooth sleeves and jade leaves -> Sleeves of the Pine
if($itemcount{8796} && $itemcount{8795}) {
quest::say("Marvelously done, my friend. I am pleased to know that the natural world has embraced and recognized you so. I have bound the moss thread to the Polished Jade Leaves and your sleeves are complete. Take them and wear them with the selfless knowledge that you are equal to all of nature’s most devoted warders.");
quest::summonitem(8445);
}

#mithril fern boots & 2x jade plates -> boots of the pine
elsif($itemcount{8877} && $itemcount{8876} == 2) {
quest::say("Aaaah. . . these will do nicely. Lerian's gifts upon the hide that you have expertly sewn into the boots have proved an extra enchantment that allowed me to appropriately fit the plates onto the toes and sides of the boots. You have earned this reward justly and without a selfish nature or compromise of your dedication to nature. May they serve you as you have served the world that has granted them to you.");
quest::summonitem(8758);
}

#bracer of braided pine & jade blossoms -> bracer of the pine
#text made up/altered from sleeves reward
elsif($itemcount{8865} && $itemcount{8864}) {
quest::say("Marvelously done, my friend. I am pleased to know that the natural world has embraced and recognized you so. I have bound the braided pine to the Polished Jade Blossoms and your bracer is complete. Take it and wear it with the selfless knowledge that you are equal to all of nature's most devoted warders.");
quest::summonitem(8499);
}

#forest woven gloves & jade studs -> gloves of the pine
elsif($itemcount{8871} && $itemcount{8870}) {
quest::say("Well done, $name. The Jade Studs have been easily bound to the enchantment of the Forest Woven Gloves. Although you will not see bindings to hold the studs in-place, know that they are quite secure. Lerian's gifts are not to be underestimated, nor taken for granted. You have earned this item selflessly in displaying your protection of the natural order of this world, and in-turn, your ward has blessed you in many ways with the creation of this item. May it protect you as you have protected the land and order that forged it.");
quest::summonitem(8757);
}

#shadowjade circlet & jade tear -> circlet of the pine
#text made up/altered from sleeves reward
elsif($itemcount{8883} && $itemcount{8882}) {
quest::say("Marvelously done, my friend. I am pleased to know that the natural world has embraced and recognized you so. I have bound the shadowjade circlet to the Polished Jade Tear. Take it and wear it with the selfless knowledge that you are equal to all of nature's most devoted warders.");
quest::summonitem(8759);
}

#return items

  plugin::return_items(\%itemcount);
}

#end of file