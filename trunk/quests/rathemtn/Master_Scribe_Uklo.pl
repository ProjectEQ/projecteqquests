# Master Scribe Uklo
# Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
# added 2009 BWstripes - because we can!
#
# Master Scribe Uklo is on an unknown Guktan faction.
# This seems to underline the fact that Sony gave up with faction except when they wanted to make it a barrier to progress, spells, items etc.
# Even though people reported the included faction hits, the frogs themselves alayws seem be indiff to all but evil, and KoS only to Trolls?
# Commented out Guktan Suppliers faction, as not entered on PEQ.

sub EVENT_SAY {

  if($text=~/Hail/i){
    quest::say("Well met! Welcome to Gukta, the Outpost of Marr -- our new home and base of operations for our fight to remove the trolls from the rest of our beautiful swamp. The liberation of Gukta was quite a battle! Many brave Froglok warriors, a good dose of [powerful magic] and the blessings of Mithaniel Marr allowed us to cleanse this place of the vile Trolls.");
    }

  if($text=~/powerful magic/i){
   quest::say("Our battle wizards called many comets of ice from the sky, along with bolts of pure magical force, brutal walls of flame and even [illusions] to confuse and disorient the stupid trolls.");
    }

  if($text=~/illusions/i){
    quest::say("A select few of Mithaniel's chosen know the secrets of spinning illusions. This skill allowed our bravest warriors to infiltrate the Troll's defenses and ensure victory. These are some of our most closely guarded secrets. We only [teach] them to a select few so they can better aid us in our battle.");
    }

  if($text=~/teach me/i){
    quest::say("You must first [prove] yourself a friend of Gukta before I will teach you our secrets.");
    }

  if($text=~/prove myself/i){
    quest::say("Very well, I will put your loyalty to the test. Long ago, a great hero of our people lost his life fighting the Trolls. He was in Rathe Mountains investigating a rumor that the Trolls were stockpiling special weapons in an effort to turn the tide of war back in their favor. He was ambushed by a group of troll marauders and their captain Krignok. He fought valiantly, slaying the marauders and eventually locking swords with the captain. But in the end, exhaustion got the better of him and he died by the troll's hand. The Krignok respected the froglok's ferocity and swore that they would one day finish their fight. So through a dark ritual the troll Captain locked the froglok's spirit in his own sword and broke it into 3 pieces. One piece he placed on the [battlefield] where they fought. The other piece he gave to an [infamous troll] warrior to guard. The location of the third piece has been lost over the time but there are [clues] as to where it may be.");
    }

  if($text=~/battlefield/i){
    quest::say("The Mountains of Rathe hold many stories. One of them is the story of froglok warrior Chalex for this is the place where he was killed. Find the place where his bones are kept and say aloud 'I wish to recover what is lost' and if you are worthy you shall receive a gift.");
    }

  if($text=~/infamous troll/i){
    quest::say("Gribnor is one of the strongest trolls alive, he is also one of the shortest. His strength is the reason that the Troll Captain entrusted him with a piece of the sword because he knew that it would be almost impossible for anyone to take it away from him. Last we heard Gribnor had taken up residence in Neriak Third Gate along with the rest of those vile trolls. I warn you to be careful as allies of Gukta are not welcome in the home of Innoruuk's children.");
    }

  if($text=~/what clues/i){
    quest::say("The troll captain spent some time in the lower part of Guk. Apparently he was trying to control the undead frogs there and use them against us. His plans did not see fruition and while trying to escape he dropped the sword blade. It is rumored that another explorer found it and the power drove him insane doomed to wander the halls of Lower Guk seeking only to destroy others. I believe you will find this to be the toughest piece to retrieve.");
    }
}

##Note: Quest turn in supposedly required apprehensive or better. Dark elves could get above starting dubious faction by illusion. Whether that works on the EMU is another matter

sub EVENT_ITEM {
  if ($faction => 9 && plugin::check_handin(\%itemcount, 67014 => 1, 67015 => 1, 67013 => 1)) { # Restore the Blade - Tarnished Cross-Guard, Tarnished Pommel, Fused Sword Blade
    quest::say("I just can't believe that I am holding all three items. You are truly amazing. Now let me see. . . Seems the blade has been fused with some sort of material. We must remove this before the sword can be restored. I think this calls for an old recipe. Take this distiller and use it to mix some skyash bile and a pinch of drake lava powder together. You should be able to find the bile in the mountains of fire and the drake lava powder is best retrieved from fire drakes in the mountains of lava. Bring me the result and I should be able to restore this ancient weapon.");
    quest::summonitem(67019);  # Uklo's Distiller.
    quest::faction(484, 20); # Guktan Suppliers
    quest::faction(264, 25); # Protectors of Gukta
    quest::faction(146, 25); # High Council of Gukta
    quest::faction(202, 25); # Lorekeepers of Gukta
    quest::faction(136, 25); # Guktan Elders
    quest::exp(200000);
    quest::ding;
    }

  elsif ($faction => 9 && plugin::check_handin(\%itemcount, 67017 => 1)) { # Vial of Magical Blade Restorative
    quest::emote("grins as you hand him the restorative."); #Text modified as quest::echo not working
    quest::say("Words cannot describe what you have done. This is truly a wonderful day for our citizens. Now I can rebuild the sword and our hero can finally finish that which he started. Please, while this is more then enough proof of your loyalty, I must ask that you take this sword and place it in the remains. Return with proof that it has been done and I shall reward you with the knowledge you seek.");
    quest::summonitem(67012);  # You receive Marr's Retribution.
    quest::faction(484, 20); # Guktan Suppliers
    quest::faction(264, 25); # Protectors of Gukta
    quest::faction(146, 25); # High Council of Gukta
    quest::faction(202, 25); # Lorekeepers of Gukta
    quest::faction(136, 25); # Guktan Elders
    quest::exp(400000);
    quest::ding;
    }

  elsif ($faction => 9 && plugin::check_handin(\%itemcount, 67018 => 1)){ # turn in of spectral memory
    quest::emote("kneels before you as tears of happiness roll down his face."); #Text modified as quest::echo not working
    quest::say("I thank you. Since our creation it has been rare that we have received such kindness. You will always be welcome in our city and future generations will croak the story of your greatness. Please take this as a small token of my gratitude you have truly earned it.");
    quest::summonitem(67011); # Spell: Illusion: Guktan
    quest::faction(484, 20); # Guktan Suppliers
    quest::faction(264, 25); # Protectors of Gukta
    quest::faction(146, 25); # High Council of Gukta
    quest::faction(202, 25); # Lorekeepers of Gukta
    quest::faction(136, 25); # Guktan Elders
    quest::exp(1200000); # Poor amount for a hard quest, but that was live for you, you will bask instead in your reward, damn you!
    quest::spawn2(50328,0,0,$x,$y+8,$z,$h); # spawn the 'Memory of Chalex' for completeness
    quest::ding;
    }

  else{
    quest::say("I do not need this $name. Here, have it back.");
    plugin::return_items(\%itemcount); # return unused items
    }

}