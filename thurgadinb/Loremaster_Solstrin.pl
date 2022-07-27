# items: 8896, 18610, 18611, 8895, 1199, 17651
sub EVENT_SAY { 
  if($text=~/Hail/i) {
    quest::emote("bows before you and says, 'Greetings to you as well, $name. I have recently heard many tales of your people and their glory. I am honored to welcome you to the Hall of Ancestors. Here our people come to pay tribute to the bravest and wisest of our kin who have passed from this life into Brell's holy domain. If you are interested I'd be happy to tell you a little bit about the heroes buried here.");
  }
  if($text=~/what heroes?/i) {
    quest::emote("smiles at you, obviously pleased by your interest.");
    quest::say("This hall contains the bodies of Dain Frostreavers the I, II, and III as well as his grace Grand Historian Nicmar. There is also an empty bier in the back awaiting the next hero of our people. But the most sacred tomb of all lies right behind me here.");
  }
  if($text=~/sacred tomb/i) {
    quest::say("In this block of ice lie the sole remnants of our great father, leader, and founder, Colin Dain. While leading our people to the safety of the mountains following the destruction of our beloved Froststone. Colin came to a grim realization. He knew that there was no way our people could outrun the giants and safely get away. And so he took thirty volunteers and led them in a suicide ambush to halt the giants' chase while the rest of our people got away. Without his sacrifice, the Coldain might very well have been wiped out that day. Once we were safe, scouts were dispatched to the battle with the hope of finding survivors. Amidst the field of bodies they found this crown, axe, and breastplate which belonged to our beloved leader. Of Colin's actual body, no remnant was ever found.");
  }
  if($text=~/working with gemstones/i) {
    quest::say("Aye, gems are placed within the armor. Brell is pleased with this fusion of ore and gem. The combination produces a sturdy piece of armor. You will need some Etching Tools to work with the gems. If you ask Meg Tucter for a set, she should have some laying about.");
  }
  if($text=~/issue kit/i) {
    quest::say("The Standard Issue Kit is what we issue to soldiers at the beginning of their mission. I have this empty one here. Before I give it to you, could you show me your Runed Coldain Prayer Shawl? I would like to see how skilled you are.");
  } 
}

sub EVENT_ITEM {
  # Royal Coldain Orders
  if(plugin::check_handin(\%itemcount, 8896 => 1)) {
    quest::say("So, the Dain needs your assistance with the Field Plate. The Dain must trust you a great deal to impart the wisdom of our armor creation to you. Here are the tomes. The first details how to make the basic armor, the other details how to begin [working with gemstones]. If the Dain is asking you for them you should place them in an [Issue Kit]. May Brell guide your hand friend, good luck to you.");
    quest::summonitem(18610); # Forge of Icewell Arms (Royal Field Plate Study)
    quest::summonitem(18611); # Forge of Icewell Arms (Precious Gem Study)
  }
  # Runed Coldain Prayer Shawl (either version)
  elsif(plugin::check_handin(\%itemcount, 8895 => 1) || plugin::check_handin(\%itemcount, 1199 => 1)) {
    quest::say("Amazing, your skill is truly great. I am sory that I had doubted you. Here is the empty Issue Kit. Place a full set of Imbued Royal Velium armor in it before giving it to the Dain.");
    quest::summonitem(17651); # Empty Coldain Issue Kit
    quest::summonitem(8895); # Runed Coldain Prayer Shawl (approved)
  }
} 

# Quest edited by mystic414