##Verrell_Cogswin.pl

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Sorry, but I am a very tired gnome. I am returning from a trip to Halas but this desert heat has worn me out and for some reason my gate spell keep failing. If only I had some water then I could make it to the wizard portal and wait for my brother Pellillo to pick me up.");
  }
  if(defined($qglobals{Green_Scale_Quest}) && ($qglobals{Green_Scale_Quest} == 1)) {
    if($text=~/recipe/i) {
      quest::say("My old shaman friend Shamus Felligan has been working on some way to change the color of items. He was very close to completing it but for some reason everytime he applied the mixture to something it would change the color temporarily. So he asked me to come down and help him. After a few months we realized what the problem was and we're now capable of changing things from red to green and from green to gray. I kept a sample for myself so I could turn my friend's red drake green as a surprise, but I would like to test it on a [red scale] first.");
    }
    if($text=~/red scale/i) {
      quest::say("Yes the red scales of a dragon would be perfect for a test now that I think about it. Do you know anyone with a red scale that would be willing to let me use it in the pursuit of magical studies?");
    }
  }
  if(defined($qglobals{Green_Scale_Quest}) && ($qglobals{Green_Scale_Quest} == 2)) {
    if($text=~/good news/i) {
      quest::say("Well the good news is the scale changed color but. . .");
    }
    if($text=~/bad news/i) {
      quest::say("The scale is no longer red it is gray. I confused the color change it is red to gray and gray to green, no need to fret tough I can just apply more and change it to green but there is a [catch].");
    }
    if($text=~/catch/i) {
      quest::say("The scale split into four pieces and the only way I can fix it is by applying a special [adhesive].");
    }
    if($text=~/adhesive/i) {
      quest::say("In order to make this special adhesive you will need to combine some [glue powder] and some [Deep Barley Brew] in this container with this special vial. Return the result to me and I should be able to fix the scale, but please try to hurry I have to meet my brother Pellillo Cogswin at the wizard platform so he can take me home.");
      quest::summonitem(67387); #Verrell's Box of Potions
      quest::summonitem(67395); #Potion Vial
    }
    if($text=~/glue powder/i) {
      quest::say("Glue powder can be made from a fractured centaur hoof, some fire giant embers, and some jagged permafrost shards. The hoof can be found on centaurs in the Karanas, the fire giant embers you will have to retrieve from the fire giants in the caverns of exile and the shard can be found in the keep of Permafrost on a chilling terror. When you have collected these three things use a mixing bowl to grind them together and make glue powder.");
    }
    if($text=~/deep barley brew/i) {
      quest::say("Deep Barley Brew is easy for someone with a bit of brewing skill. Just buy some deep fungus mold, some barley, and a bottle of distilled spirits, combine them in a brew barrel and viola.");
    }
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13006 => 1)) { #Water Flask
    quest::say("Thank Brell your kindness will not go unnoticed. I am eager to get back home I have been in the cold environment of Halas for so long, I thought I was going to turn into a snowgnome. I am just glad we finally figured out the [recipe] for that concoction.");
    quest::setglobal("Green_Scale_Quest",1,0,"F");
  }
  elsif(plugin::check_handin(\%itemcount, 11622 => 1)) { #Red Dragon Scales
    if(defined($qglobals{Green_Scale_Quest}) && ($qglobals{Green_Scale_Quest} == 1)) {
      quest::emote("pulls a vial out of his pocket and places the red scale on the ground before pouring some of the vials contents on the scale. The scale begins to bubble and fizz as the liquid covers it entirely. Verrell looks at you and smiles before looking back at the scale. gasping and snatching the scale up from the floor.");
      quest::say("Hmmm . . well I have some [good news] and a lot of [bad news] which do you want to hear first?");
      quest::setglobal("Green_Scale_Quest",2,0,"F");
    }
  }
  elsif(plugin::check_handin(\%itemcount, 67386 => 1)) { #Thick Adhesive
    quest::say("That should do. Here, combine these in the Box of Potions I gave you."); #text made up
    quest::summonitem(67385); #Grey Scale Pieces
    quest::summonitem(67396); #Thick adhesive v2, for recipe
  }
  elsif(plugin::check_handin(\%itemcount, 67384 => 1)) { #Grey Colored Scales
	quest::emote("pulls a vial out of his pocket and places the red scale on the ground before pouring some of the vials contents on the scale. The scale begins to bubble and fizz as the liquid covers it entirely. Verrell looks at you and smiles before looking back at the scale.");#copied/made up.
    quest::say("Worked that time, yer bugger!"); #text made up
    quest::summonitem(11582); #Green Dragon Scales
    quest::delglobal("Green_Scale_Quest");
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:nro  ID:34049 --#Verrell_Cogswin.pl