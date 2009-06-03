sub EVENT_SAY {
  if ($text=~/hail/i) {
     quest::emote("glances at you from the corner of his eye.");
    quest::say("You'd better speak more swiftly than my blades or you won't walk out of here $name.");
    quest::say("You are quite bold to approach a member of the Ebon Mask. Now be smart and run away.");
    quest::say("Prepare to be gutted like a fish.");
    quest::say("Ah, come to speak business have you, I figured Ryoz would be sending someone to me eventually. Well then, let's get down to business. I know of a [potent poison] that will kill even the hardiest Froglok quickly and silently, but with great pain.");
  }
  if ($text=~/potent poison/i) {
    quest::say("It is a bubbling concoction that can be quite dangerous to make for those with less than skilled hands. I will make this poison for you. However, I will need you to gather the [necessary materials].");
  }
  if ($text=~/necessary materials/i) {
    quest::say("Well, first off, we will need one dose of Mage's Bane which I just happen to have here. However, I will also need a dose of Susceptible Essence, a dose of Mind Melt and two [special ingredients]. When you have collected these poisons use this mortar to combine them and then hand me the result. Now you must be careful as this mortar is very fragile. If you happen to break it just tell me you need another and I will give you a new one.");
    quest::summonitem(67002);
      }
      if ($text=~/special ingredients/i) {
        quest::say("There is an associate of mine who can be found in a place known as the cauldron. Show him this note and he should be able to point you in the right direction. Be wary, retrieving these two ingredients will not be easy. Keep in mind that my friend will not talk to you unless you have some proof from me. If you lose this note come on back, let me know and I will write another for you.");
        quest::summonitem(67003);
      }
  if ($text=~/need new mortar/i) {
    quest::say("Here you go.  Be careful.");
    quest::summonitem(67002);
  }
if ($text=~/need new note/i) {
   quest::say("Here you go.  Be careful");
   quest::summonitem(67003);
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67007 =>1 )) {
    quest::emote("takes the materials from you. Sniffing the sickly smell coming from the container, he nods and grabs a small vial from a pouch on his belt. He begins to mix the vial into the jar gently as beads of sweat begin to form on his forehead. Then, he smiles in triumph.");
    quest::say("I did it! I didn't think I would be able to but here I stand triumphant. I got the recipe from an associate of mine named Tisumie, beautiful lass, deadly with a blade. It took a fortune to get that recipe from her but it will be well worth it if we can accomplish our goal. Well now, all that remains is the delivery. Take this to Ryoz and he will give you further instructions. It will kill any Froglok in Norrath. That I guarantee!");
    quest::summonitem(67001);
  }
  plugin::return_items(\%itemcount);
}