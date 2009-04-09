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
}

# Quest edited by mystic414