#Selzar L'Crit, Neriakc 42085
#Need Ending Statement
#Need Factions
#Status: Not Complete

sub EVENT_SAY {
if($text=~/hail/i)
  {
  quest::say("What have we here? Another hopeful member of the House of the Ebon Mask? You've got much to learn before you will be of much use to our House or the secret operations that support both the thrones of our King and Queen. First you need to outfit yourself in a suit of [armor], $name. ");
  }

if($text=~/armor/i)
  {
  quest::say("Seek Kanthu M'Rekkor and give him this request parchment. When you have outfitted yourself in a suit of armor return to the House of the Ebon Mask and I will grant you [another task]. ");
  quest::summonitem(2416);
  }

if($text=~/other task/i)
  {
  quest::say("Ah, you are eager to advance further within the House of the Ebon Mask. Although it is my duty to aid your training, do not allow your arrogance to blind you to your lowly position in our House. I can see that you have not yet learned to temper the use of your tongue. Your next task is to assist the construction of a [weapon] and [bow] worthy of being wielded by a Rogue of the House of the Ebon Mask. ");
  }

if($text=~/bow/i)
  {
  quest::say("The Halfling Druids from Rivervale that frequent the ancient druid ruins in the Nektulos Forest are guarded by Leatherfoot Warriors. The peck druids perform the rituals that they hope will prevent Innoruuks corruption from spreading deeper into the Forest and the lands beyond. Should you slay the peck warriors guarding the druids and obtain a Leatherfoot Short Bow, take the bow, a Black Mamba Skin, and a Lock of Zombie Hair to Andara C'Luzz at The Bleek Fletcher in the Neriak Commons near the headquarters of the Indigo Brotherhood. ");
  }

if($text=~/weapon/i)
  {
  quest::say("Beyond the mouth of Neriak lies the Nektulos Forest. There the Halflings of Rivervale have set up camps at ancient druid holy sites in an attempt to cleanse Innoruuks corruption that is spreading through the Nektulos Forest. Slay these trespassers and bring me a Large Snake Skin, a Halfling Fibula bone, and a Halfling Clavicle bone. ");
  }
}

sub EVENT_ITEM {
 if(($itemcount{19578} == 1) && ($itemcount{19577} == 1) && ($itemcount{13060} == 1))
  {
  quest::exp(150);
  quest::summonitem(19608);
  quest::say("You have slain enemies of our order.  Carry your weapon with pride.");
  }
  
   else 
 {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
 }
}
