# Lerian Wyndrunner
# Jaggedpine druid armor quest
# by RealityIncarnate

sub EVENT_SAY {
#Hail text made up
if($text=~/hail/i) {
quest::say("Hello, $name.  I am new to Surefall Glade, but I already find it to my liking.  There is much here that reminds me of my home in the Jaggedpine, and I find that myself and the people of Surefall are of a kind.");
}

if($text=~/leggings/i) {
quest::say("Aaaahh. . . I see that you have chosen to embark on the sacred path of the Jaggedpine. No doubt my dearest Cheyloh has sent you, and if she has placed her trust in you and given you the sacred knowledge to embark on this ancient quest, then my services are at your disposal in this cause, my friend. To create the Moss Threaded Rawhide Leggings, you will need to obtain the [needed components] that I will work with to make the leggings.");
}

if($text=~/needed components/i) {
quest::say("The recipe for the Moss Threaded Rawhide Leggings is very specific, and the materials that I am about to describe to you must be exact for the creation of the Leggings of the Pine to be properly completed. From you, I will need a pair of Ruined Rawhide Leggings and a [Spool of Moss Thread]. The ruined leggings you will likely find in the Shrine of Brell Serilis, located beneath our forest. When the gnolls first arrived in the Jaggedpine, they raided our fort several times and although no lives have yet to be lost specifically to their talons, something of which I give praise and thanks to The Rainkeeper for daily, the gnolls have stolen our supplies from time to time.");
}

if($text=~/spool of moss thread/i) {
#text altered from Live. There is no item "spool of moss thread"; a bug allowed the leggings to be created from only the moss and threads.  I modified the recipe and text to require all three things to be combined.
quest::say("This item you will need to use your own hands, patience, and devotion to the natural world to create. A mastery of the skill of weaving -- tailoring -- is very important when attempting to handle such a feat. The items that you must weave to make this enchanted thread are the Shadowjade Moss and Threads of the Hatchling. The Shadowjade Moss you will find as a gift from the Jaggedpine for your services to her. If you search carefully and with selfless patience, she will grant you a perfect specimen suitable for the creation of this item. The Threads of the Hatchling you must acquire from the Potameid Bewilders in the caves located off the Hatchling River. Combine these two items with the ruined leggings to prepare the Moss Threaded Leggings.  May The Rainkeeper guide you in your quest, my friend, and I look forward to your return.");
}

if($text=~/sharktooth sleeves/i) {
quest::say("You seek to prove yourself upon the ancient and sacred path of the Jaggedpine, I see. You will need to procure two specific items for me so that I might make one of the components that you will need to produce the sleeves. Yes, my, friend, you will be making the final product with your own hands and patience, as is the ultimate test of this path -- to prove that you are willing and able to earn these items on your own accord. The items I need to make the Reinforced Rawhide Sleeves are a Shark Rib from one of the great behemoths of Kedge, and a Flayed Panther Hide. The hide you will find upon one of the poachers that have taken it upon themselves to establish an outpost in our forest. The one you will find to have such hide within their possession is Yranik Blackguard.");
}

if($text=~/more must i do/i) {
quest::say("Return to Kedge and find two Discarded Shark Teeth. These teeth you will likely find at the bottom of the oceanic ruins and need not interfere with the corrupted, coerced slaves of Phinagel to acquire the teeth. Yes, we know of Phinagel and the gruesome legend that surrounds him -- remember, he is indeed very old and his 'accomplishments' with the Kedge race happened long before the Jaggedpine borders were sealed off. We are not entirely ignorant to the outside world -- it is just the modern times that have become a bit of a mystery. Once you have acquired the teeth, you will need to sew them onto the reinforced sleeves that I have just given you. Be sure you hold a master's eye in the art of tailoring when attempting this feat, for the thread is very thin and will break at the touch of an armature's attempt.");
}

if($text=~/mithril fern boots/i) {
quest::say("Cheyloh has caught the attentions of yet another druid seeking to prove themselves worthy of nature's gifts. If she has placed her trust and faith in you with this, one of our most sacred of tests and equipment, then I shall guide and aid you in parallel to her faith, my friend. I will need you to seek out and return to me some Shadowjade Fern Seeds, two Shadowjade Fern Leaves, all of which you can forage from the Jaggedpine forest, and a Jaggedpine Panther Hide. To obtain this hide, you will seek out one known as Fitorrin Bladespur. The citizens of Qeynos have reported that he has taken a ship to Odus. As he is a criminal, Erudin may have already disposed of him, but that is unlikely for Fitorrin is well informed and education on the ways of the world for one of such a debased profession as he. It would be wise to search the forest of Toxxulia for his whereabouts.");
}

if($text=~/bracer/i) {
quest::say("This is an item that you will need to work hard to obtain, my friend, but I shall guide you through this task -- if you can appeal to the world that you have dedicated your life to and receive her acceptance and gifts. I will need two specific items from you to create that which Cheyloh has requested of you. Those items are the Black Rawhide Bracer and the [Braids of Pine]. The rangers of the Jaggedpine Treefolk have informed me that Ryleen Bladespur, one of the poachers to have recently infested our forest, has made her way to South Karana to sell much of her stolen wears within the underground market of Norrath. Seek her out and you will find the bracer.");
}

if($text=~/braids of pine/i) {
quest::say("This item you will need to make on your own by carefully weaving strands of Shadowjade Moss, Jaggedpine Needles, and Potameid Braids into one delicate strand. The forest will offer the Shadowjade Moss and Jaggedpine Needles to you if she deems you worthy of her gifts. The braids, however, you must take from the Potameid Wildlings of the Hatchling River. Be sure that your mastery in the ways of tailoring are in the forefront of your mind when you attempt this feat, for anything less will result in the destruction of these delicate materials.");
}

if($text=~/forest woven gloves/i) {
quest::say("The gloves you seek to acquire will take much patience and perseverance on your behalf to be successful in obtaining. I can guide you as to who and what you must seek and give you the proper instructions to fulfill your part before I can give the final touch to creating the Forest Woven Gloves. The task you must fulfill before returning to me to complete the final process in the item's creation is to use your own mastery in the ways of tailoring to create the Blackened Mithril Netted Gloves. There are two components for this item -- one is the Tattered Panther Hide Gloves, which you will likely find upon a renegade poacher known as Theoris Bladespur, who the scouts of the Glade have informed me currently resides in South Karana. The second item is the [Blackened Mithril Netting].");
}

if($text=~/blackened mithril netting/i) {
quest::say("This material is new to the creation of the gloves, as the resource we had once used grows dangerously scarce. I have spoken with the craftsman of Qeynos and they have given me the knowledge of the Blackened Mithril, which can be found in the clutches of the kobold king's guard who resides in Solusek's Eye. The artisans of Qeynos say that the Blackened Mithril is light and its ability to hold an enchantment is unsurpassed by anything they have yet to find on Antonica, making it suitable for our intentions of creating this item. Once you have successfully made the Blackened Mithril Netted Gloves, you will need to return them to me with the Shadowjade Moss and Shadowjade Fern Leaves, both of which you can safely procure in the Jaggedpine, if the forest will allow you take of it.");
}
}
sub EVENT_ITEM {

#flawless panther hide, sap, & dew of the hatchling -> cured panther hide
#text made up
if($itemcount{8766} && $itemcount{8767} && $itemcount{8765}) {
quest::say("My sister Jhaya must have sent you.  Let me see what you have brought.");
quest::emote("carefully examines the hide, then turns his attention to the gifts of the forest.  He slowly begins to rub the liquids into the hide, all the while chanting softly.  His words are unrecognizable, but nonetheless seem familiar, and it seems as if only an instant passes before Lerian completes the ritual.  With a wordless smile, he hands the freshly cured pelt to $name");
quest::summonitem(8764);
}

#shark rib & flayed panther hide -> reinforced rawhide sleeves
elsif($itemcount{8799} && $itemcount{8797}) {
quest::emote("inspects the rib and the hide, checking for imperfections that might disable him from completing his work. Satisfied with the quality of the components, Lerian places the rib in the center of the hide, which is draped over his arm. He then begins to speak softly in an ancient, druidic tongue that is foreign to your ears and knowledge. As he speaks, the black fur of the hide seems to pierce the cartilage shark rib, binding it in-place. The rest of the hide folds back, wrapping itself around the druid's arm. Lerian then completes his chant and removes the Reinforced Rawhide Sleeves from his arm and offers it to $name");
quest::say("There is [more that you must do], my friend, before this task is complete.");
quest::summonitem(8863);
}

#jaggedpine panther hide,shadowjade fern seeds,2x shadowjade fern leaves->shadowjade hide 
elsif($itemcount{8879} && $itemcount{8873} && $itemcount{8878} == 2) {
quest::emote("studies the hide carefully -- using his eyes, fingertips, and sense of smell to be sure that it is indeed of the panthers native to the Jaggedpine forest. Accepting the true identity of the hide, Lerian removes a small vial of clear oil and smears it across the flawless midnight fur. He then retrieves the seeds from the small pouch given to him by Silverfur, and begins to chant lowly and softly in his ancient druidic tongue. The seeds begin to sprout, growing at an unnatural pace from the nourishing oil. The fern imbeds itself in a beautiful design upon the hide as they grow -- their roots and the thin, delicate vines rendering the flora secure in its place. Lerian then offers the hide to $name");
quest::say("You will need to seek out one other item -- the Blackened Mithril Boots from the kobold priest in Solusek's eye. Once you have the boots, you will need a master's knowledge of tailoring to carefully fit this hide over the boots before returning them to Cheyloh.");
quest::summonitem(8881);
}

#braids of pine & black rawhide bracer -> bracer of braided pine 
#text made up
elsif($itemcount{8866} && $itemcount{8867}) {
quest::emote("gently places the braids of pine across the rawhide bracer.  He murmurs a few soft syllables, and the braids begin to move and grow, as if of their own volition.  Wrapping around and through the blackened rawhide, the bracer is soon completely covered by the braids.  With twinkle in his eye, Lerian hands the bracer to $name.");
quest::summonitem(8865);
}

#blackened mithril gloves & shadowjade moss & fern leaves -> forest woven gloves
elsif($itemcount{8872} && $itemcount{8792} && $itemcount{8878}) {
quest::emote("examines the gloves, checking the item's stability and quality of make. Satisfied, Lerian then pulls the gloves onto his hands and proceeds to carefully cover the gloves with the dark emerald moss. He then closes his eyes and begins to whisper a soft chant in an ancient druidic language as he opens the small pouch and sprinkles the fern seeds across the palms and back of his hands. As he chants, his hands hold a soft emerald radiance and the seeds begin to sprout before your eyes. The tiny ferns weave in an out of the Mithril netting, binding the moss to the gloves and creating a beautiful design upon the back of each gloves. Lerian removes the gloves as his chant ends and extends them to $name, a delicate, warm smile upon his face in silent approval.");
quest::summonitem(8871);
}

#return items

  else {
    quest::say("The forest supplies all I need."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
}

#end of file