#The enslaved iksar is part of the Greenmist quest line, and is for the seventh quest in the series. He gives a bit of flavor through most of his speech, but is also used to turn in items for a part of the Stupendous Tome.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("looks up at you. You can tell his spirit is broken. His scars speak of a severe beating.");
  }
 elsif($text=~/Vok Na Zov/i){ #Test of the Lord (Greenmist Quest 7/8)
  quest::say("Forget them. I believe all six scrolls lie in the [Kaesora Library] and that is no safe place for any explorer. The scrolls are not readable by any livng person, but I came here in search of a machine which may be able to decipher them, the [Stupendous Contraption]. Should you return to Cabilis, see that the Arch Duke hears of the scrolls.");
  }
 elsif($text=~/kaesora library/i){ #Test of the Lord (Greenmist Quest 7/8)
  quest::say("Oh!! You heard of the ancient library I discovered in Kaesora? I think the six scrolls of [Vok Na Zov] may lie there. I have not yet actually found the location of the library and it's very dangerous to lurk within the ruins of Kaesora. I would not venture there if I were you.");
  }
 elsif($text=~/stupendous contraption/i){ #Test of the Lord (Greenmist Quest 7/8)
  quest::say("I have learned it was a machine tinkered by a legendary gnome. It has many uses. It lies in the slave pens of Droga. Perhaps it may be used to decipher the [Scrolls of Vok Na Zov]. I have leearned that it will not work without a [contraption needle]. Luckily I have found one in my journies.");
  }
 elsif($text=~/contraption needle/i){ #Test of the Lord (Greenmist Quest 7/8)
  quest::say("The contraption needle is a piece of the machine, the [Stupendous Contraption]. It won't operate without it and if you want it, you're going to have to bring me the [pen keys].");
  }
 elsif($text=~/pen keys/i){ #Test of the Lord (Greenmist Quest 7/8)
  quest::say("Pen keys!! I need the pen keys to get out of here! Find the ones who hold these keys. Bring me the key to pen number 1 and both keys to the pen gates. Do so and I shall give you the [contraption needle].");
  }
}

sub EVENT_ITEM {
  if(($itemcount{12708} == 1) && ($itemcount{12712} == 1) && ($itemcount{12713} == 1)){ #Test of the Lord (Greenmist Quest 7/8)
  quest::emote("escapes with a flash, but before he goes, he speaks, 'At last!! The keys which shall bring me freedom! I thank you and here is the contraption needle. Good luck.'");
  quest::summonitem(12714);
  quest::exp(2000);
  quest::ding();
  quest::depop();
 }
 else{ 
 plugin::return_items(\%itemcount);
 quest::say("These are not the items I sent you for."); #Made this text up.
 }
}

#Submitted by: Jim Mills