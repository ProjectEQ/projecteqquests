sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome back, young Jin. I hope your training is going well. Unfortunately, I have been unable to keep up to date on your progress, but should you need advanced training in any individual skills, for I am never too busy to enlighten one of my kin. You may have chosen a life of adventure, a life that will take you far from our home, but never forget your duty to your blood. The Guktan Army needs your growing powers. To remind you of this and school you in the way of our people, I will tell you something of [this place].");
  }
  
  if ($text=~/this place/i) {
    quest::say("The fetid land we now live on of holds many evils. Trolls and other evil ilk still wander the Innothule Swamp, ready to feast on Froglok flesh. Their allies, the ogres, infest the Feerrott to the south, vying with the cursed Lizard men in a lasting contest of evil. Our lands stand distant from the other good races, separated by wastelands and deserts. Our army is our only defense. But that is enough. I am the teacher of young [froglok wizards].");
  }
  
  if ($text=~/froglok wizards/i) {
  quest::say("That is your path? Good. Then we must begin immediately for time is short. The arcane path ahead of you is fraught with dangers, many of them of your own making. I will guide you as I can, so [listen well].");
    }
    
    if ($text=~/listen well/i) {
    quest::say("This Arcane Crucible will allow you to combine [various components] to form a basic magical mesh. This mesh, when combined with the proper mold and worked in a forge, will allow you to create your own Armor of the Jin Initiate.");
    quest::summonitem(17831);
      }
      
      if ($text=~/various components/i) {
      quest::say("These are not the usual components used in spells. Look instead in Innothule Swamp for your pieces. The many enemies and vermin that stalk that bog hold items which are only trash to others. But to you they will eventually become treasures. When you are ready to attempt making your armor, return and tell me what you wish to make and I will instruct you. I can teach you the recipes and give you the proper molds for the Armor of the Jin Initiate [Headband], [Vestment], [Armwraps], [Bracer], [Handwraps], [Leggings], and [Sandals].");
        }
        
        if ($text=~/headband/i) {
        quest::say("Wise. Your mind is your greatest weapon and you must protect it. You'll need a Malleable Bleeder Skin, a Pristine Bleeder Skin and two Mushroom Spores. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Headband of the Jin Initiate ");
        quest::summonitem(63080);
        }
        
        if ($text=~/vestment/i) {
        quest::say("The true mark of an initiate and a banner to the world of our growing might. To make it you'll need a Pristine Bull Alligator Hide, Bull Alligator Spines, a Giant Moccasin Eye and some Spiderling Silk. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Vestment of the Jin Initiate. There is a [final lesson] you must learn.");
        quest::summonitem(63086);
        }
        
        if ($text=~/armwraps/i) {
         quest::say("Gird yourself completely. To craft these you'll need a Bleeder Wing, an Undead Froglok Talisman, some Moccasin Eggs and a Water Moccasin Tail. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Armwraps of the Jin Initiate.");
          quest::summonitem(63084);
        }
        
        if ($text=~/bracer/i) {
          quest::say("This bracer will be a compliment to your other armor. You'll need a Blackened Fungus, Airborne Spores, a Bleeder Carapace and a Cracked Crab Spider Legs. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Bracer of the Jin Initiate.");
          quest::summonitem(63082);
          }
          
        if ($text=~/handwraps/i) {
          quest::say("Your mind commands, but your hands implement. It is wise to protect them. You'll need a Bull Alligator Tooth, two Pristine Kobold Paws and a Larval Carapace. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Handwraps of the Jin Initiate.");
          quest::summonitem(63081);
          }
          
        if ($text=~/leggings/i) {
        quest::say("What better to protect you from all that lurks beneath the swamp's murky waters? You'll need a Kobold Talon, a Ball of Pulpy Fungus, a Kobold Liver and a Giant Moccasin Fang. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Leggings of the Jin Initiate.");
        quest::summonitem(63085);
        }
        
        if ($text=~/sandals/i) {
        quest::say("Your feet will always touch your homeland. You'll need a Cracked Skeleton Skull, two Alligator Hides, and a Mosquito Carcass. Combine these components in your crucible. When you have the proper basic mesh in hand, take it to a forge along with this mold to finish your Sandals of the Jin Initiate.");  
        quest::summonitem(63083);
        }
        
        if ($text=~/final lesson/i) {
           quest::say("It is said, with power must come mercy or only tyranny can result. Well there is one in need of mercy, the mercy of death. A former student of mine, Initiate Xabbis, tried his skills against the ghouls of the swamp. But he only became one himself. Now, he wanders near the broken tower, his soul a toy for the evil gods. I beg you, go free him. Go . . .[slay him].");
        }
        
        if ($text=~/slay him/i) {
          quest::emote("appears to be intently concentrating on the topics at hand, soon gaining an understanding of the topic being discussed, and continues in conversation with $name.");
          quest::say("Yes. It is the only way now. But once he has fallen, look in his possessions and see if you can find a Tattered Codex. It was my last gift to him. Return it to me along with two Burly Kobold Ears and a Larvae Skin and I shall use my own crucible to repair it. You are certainly worthy of it.");
        }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,  63089=>1, 51036=>2, 51019=>1  )) {
    quest::say("You have done me a great favor and shown mercy to own of our own.  Here is you reward, use it well and remember your lessons.");
    quest::summonitem(63079);
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}