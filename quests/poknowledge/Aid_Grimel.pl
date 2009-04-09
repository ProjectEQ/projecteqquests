#Aid_grimel.pl
#PoP Crafting quests/Signets of the Councilmen/Planar Progression


sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Greetings and Salutations $name! I am Grimel, aid to the mighty paladin Councilman Taldarius. In between his duties to the city, Taldarius and I spend most of our time in the Planes cleansing evil. Even now I am preparing for battle. Taldarius intends to go further into the Planes than ever before on our next trip and I am working on gathering the special supplies we need. If you are willing to help I may have some use for your skills if you are a master of trades and have traveled in the Planes.");
 }
 elsif($text =~ /willing to help and am a master of trades/i) {
 	quest::say("Excellent! I am looking for a smith to add a special imbue to Councilman Taldarius's armor. Are you well versed in the art of smithing?");
 }
 elsif($text =~ /versed in the art of smithing/i) {
 	quest::say("Thank you for offering to help $name. Take this breastplate and clean it with a diluted acid wash to get all of the debris out of it. Brew the wash by combining acid and three celestial essences. Once the armor is cleaned, coat it with hurricane temper. Finally add two black diamonds of nightmare to the breastplate. This should provide adequate protection for our next journey.");
 	quest::summonitem(15984);#filthy breastplate
 }
  elsif($text =~ /have brewing skill/i) {
 	quest::say("I bet you could make a wicked brew! However I am forced to drink a refreshing drink while out adventuring. I do have this powder that will give the best drinks quite a bite though. Mix the powder in with two Kaladim Constitutionals and a flask of pure water. If you need more dust just ask for it! Put three twice brewed constitutionals and the signet in this drink barrel. As hard as drink barrels are to get these days, you need to return it to me along with the drink you create with it.");
 	quest::summonitem(17179);#Portable Drink Barrel
 	quest::summonitem(15992);#Fermenting Dust
 	quest::summonitem(15992);#Fermenting Dust
 	quest::summonitem(15992);#Fermenting Dust
 	#That's not a typo,need three dusts at least, though there might be a better
 	#way of summoning 3 of them, I dunno. 	
 }
 elsif($text =~ /put my jewel craft skills to the test/i) {
 	quest::say("My hand was crushed when I used it to deflect a blow from a War Boar that was headed towards Taldarius's back. For some time afterwards my hand was crippled but Brell saw to it I regained full use of it. The ring I used to wear was damaged beyond repair and my hand was never steady enough to etch a new one. If you would make me a new one by combining a mounted blue diamond, the etching dust and etching tools in a jewelry kit. Then take the faceted gem and combine it with a bar of pure enchanted velium and my signet. I have no idea how the pure bars are made. You may want to seek the help of the ice dwarves.");
 	quest::summonitem(15988);#Etching Dust
  } 
 elsif($text =~ /ready to use some clay/i) {
 	quest::say("On our last tome gathering expedition a stray arrow in the Plane of War struck our urn filled with sacred water. It was quite a waste of sacred water! Three large enchanted blocks of clay, three lacquered opals, a vial of purified mana, a ceramic lining, sculpting tools and the urn pattern should make an unfired urn. The urn is so large you will need to fire it with three divine crystalline glazes. Once you have the urn it needs to be filled with three sacred waters and the signet as a cap.");
 	quest::summonitem(16243);#Urn Pattern
 }
 elsif($text =~ /am skilled with the needle/i) {
 	quest::say("I appreciate the help $name. I need a new tunic made for Councilman Taldarius. Last trip through the Plane of Disease, one of those flies spit mucus on him and it dripped through his armor seams! The result was a gooey mess that ate away all the leather underneath. It was a blessing he was wearing something under all that metal! Combine three firesilk swatches, a vial of purified mana, an emblem of fire, a firestrand curing agent, a tunic pattern and the signet. Bring it to me when you have completed it.");
 }
 elsif($text =~ /skills with a fletching knife/i) {
 	quest::say("Aye I can see you are skilled with the fletching knife $name. It is good too, I need to replace Councilman Taldarius's bow from Plane of Air. Combine a planing tool, two wind metal bow cams, an air arachnid silk string, a featherwood staff and the signet. I hope the bow will be up to his standards, he sure loved his old bow.");
 }
 elsif($text =~ /master chef/i) {
 	quest::say("When we adventure in the Planes there is only one meal that keeps us in top fighting shape. It is called a Bristlebane's Party Platter. Unfortunately the platter is awkward and not easy to adventure with so you need to place them in this satchel. I know not how to make the Platter, a rather nice female Halfling cleric always used to deliver them to us but I heard she was crushed by a Regrua while hunting for a rare component in the Plane of Water. Brell bless her soul! Combine three of the platters and the signet inside the satchel.");
 	quest::summonitem(17180);#Field Satchel
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 15985 => 1)) {#Imbued Breastplate
    quest::say("What a wonderful job! Councilman Taldarius shall wear this on our next adventure, I am sure he will find it more protective than his old one. Take this signet as a token of my gratitude. If you are not too busy I have another task, do you have any brewing skill?");
    quest::summonitem(16249);#Hardened Leather Signet
  }
  elsif(plugin::check_handin(\%itemcount, 15993 => 1, 17179 => 1)) {#Portable Drink and Portable Drink Barrel
    quest::emote("gulps down a Twice Brewed Constitutional and burps loudly! 'Ahhhh that was refreshing! That should hold me over for quite some time. I see you are quite deft of hand, perhaps you would care to put your jewel craft skills to the test?'");
    quest::summonitem(16250);#Clay Signet
  }
  elsif(plugin::check_handin(\%itemcount, 15991 => 1)) {#Velium Blue Diamond Ring
    quest::emote("grins. 'Quite a nice ring you have made for me $name. May it serve me as well as my old ring. Here take this signet. We seem to be finishing the tasks on my list at a nice pace. Tell me when you are ready to use some clay.");
    quest::summonitem(16251);#Wooden Signet
  }
  elsif(plugin::check_handin(\%itemcount, 16246 => 1)) {#Filled Sacred Urn
    quest::say("Outstanding work $name! I can feel the purity of the water radiating through the clay. Are ye skilled with the needle as well as an accomplished potter?");
    quest::summonitem(16252);#Metal Signet
  }
  elsif(plugin::check_handin(\%itemcount, 15986 => 1)) {#Fire Undergarment Tunic
    quest::say("Good work $name. This will definitely serve Councilman Taldarius well. Here take this! If you have skills with a fletching knife I may have a job for you to do.");
    quest::summonitem(32800);#Marked Signet
  }
  elsif(plugin::check_handin(\%itemcount, 16247 => 1)) {#Signet Featherwood Bow
    quest::say("Masterful work $name! I can see your skill in the curves of the bow. Take this as a sign of my respect for your skill. The last item I need before we can be off is some food. I warn you this will truly test your skills. Do you fancy yourself a master chef?");
    quest::summonitem(16254);#Runed Signet
  }
  elsif(plugin::check_handin(\%itemcount, 16248 => 1)) {#Food Satchel
    quest::say("Truly amazing! Now the Councilman and I can be off on our expedition to the Elemental Planes!' He takes out a tool and marks his signet before handing it to you, 'Before we depart you may want to ask the Councilman about the signet.");
    quest::summonitem(16256);#Marked Runed Signet
  }
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
  }
  
