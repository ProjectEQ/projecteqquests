############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 29,2005
# VERSION: 1.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Plagus_Ladeson
# ID: 9112
# TYPE: Guild Master Warrior
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Sealed Letter ID-26644 (Blank - Not real letter for quest)
# A Sealed Letter ID- MISSING - 'LoveToMilea'
#
# *** QUESTS INVOLVED IN ***
#
#1 - Hogcallers Inn
#2 - Hopeless Love 2
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
#2 - Warrior
#
############################################


sub EVENT_SAY
{ 

  if($text=~/Hail/i)
  {
  quest::say("Greetings $name, and welcome to the Bunker. Are you a [new warrior] or [veteran]?");
  }

  if($text=~/new warrior/i)
  {
  quest::say("Good to know you chose the Bunker to train you. It is the home of The Steel Warriors. We find our inner strengths grow through battles and deeds to further our growth. Do you [seek deeds] or [crave battle] ?");
  }

  if($text=~/seek deeds/i)
  {
  quest::say("It may not be a fray, but who said all we Steel Warriors are nothing more than brawn. There has been recent reports of frequent visits by Dark Elves to the Hog Caller's Inn, here in Freeport. Go speak with Lady Shae. Tell her, the [Steel Warriors sent you]. We cannot rely on the Freeport Militia to look into such matters. They are probably involved. Bring me any clues.");
  }

  if($text=~/I am veteran/i)
  {
  quest::say("I apologize for not knowing. I am new to the Bunker. I was a trainer at the Hall of Steel in Qeynos before this.I left Qeynos in search of [Milea] and instead found myself joining the Bunker's weapons masters.");
  }

  if($text=~/Milea/i)
  {
  quest::say("Milea Clothspinner. She was my one true love. She is a Steel Warrior also. When she left Qeynos to find adventure my heart left also. I never saw her again, but I decided to transfer my skills to Freeport. It is probably best I did not find her. She was in love with adventure. Sigh !! The women I am attracted to are always in love with another. Just like [Toala].");
  }

  if($text=~/Toala/i)
  {
  quest::say("Toala is supreme when it comes to the blade, but in the art of passion she chooses to sway towards Cain Darkmoore. I do not get it. She is a very beautiful and strong hearted warrior. That Cain does not like her is a mystery to me. Why does she waste her time when she could have me. After all, we men of Qeynos are known as the most romantic in all of Norrath.");
  }

  if($text=~/Milea is in East Karana/i)
  {
  quest::say("You have seen Milea Clothspinner!! This is great news. I wish I could travel to see her, but Cain will not allow me to do so at this time. You must take her a note for me. Here. Take this to her. I as a master in this order command you to do so immediately. Go!!");
  # A Sealed Letter ID- MISSING - 'LoveToMilea'
  ## quest::summonitem(MISSING);
  }

}

sub EVENT_ITEM
{

 #do all other handins first, then let it do disciplines
 # A Sealed Letter ID-26644 (Blank - Not real letter for quest)
 if(plugin::check_handin(\%itemcount, 26644 => 1))
 {
  quest::say("Oh my! Opal? She is providing these agents of Neriak with information regarding the Acedemy's secrets. I can not tell Cain about this. He will be furious. Show this to Toala. She will know what to do. ");
  # A Sealed Letter ID-26644 (Blank - Not real letter for quest)
  quest::summonitem("26644");
 }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportw  ID:9112 -- Plagus_Ladeson
