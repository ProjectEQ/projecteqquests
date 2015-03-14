# Gemmed Sword Hilt

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name, I am Lord Daloran Glimmerblade. I reside over the Fordel section of the Haven with my dear Mistala. I have not ever seen you around these parts so I would imagine you are a [newcomer] to our great city.");
  }
  if ($text=~/newcomer/i) {
    quest::say("Excellent, $name. It's nice to have you here as a guest. I am very proud of all that we have accomplished here and invite you to make yourself at home when you are with us. If you wish to further [prove your allegiance] to the House of Fordel I may have some tasks for you to complete.");
  }
  if ($text=~/prove my allegiance/i) {
    quest::say("Ah that is excellent to hear, $name. I believe I have a task that I could entrust you with. I have numerous Gemmed sword hilts that I have yet to attach to a blade. They have all been glowing for quite some time with an [unknown force]. All of my residing magicians and enchanters have been unable to decifer the magics that surround these hilts.");
  }
  if ($text=~/unknown force/i) {
    quest::say("I wish that I was able to discover this myself. Unfortunately, not one person in my quarter possesses such identification powers. However, I do have a [friend] in Katta Castellum that specializes in discovering such magical origins.");
  }
  if ($text=~/friend/i) {
    quest::say("Yaeorat is who I speak of, he is a very trusted and old friend of mine that is a very powerful and skillfull enchanter. Will you bring to him the [Gemmed sword hilt]? I feel that if anyone will be able to identify this it will be Yaeorat.");
  }
  if ($text=~/gemmed sword hilt/i) {
    quest::say("That is great to hear, $name, here is the hilt. Please go see Yaeorat at once and bring me news about the magic that surrounds this sword hilt good or bad.");
    quest::summonitem(4762); #Gemmed Sword Hilt
    quest::setglobal("swordhilt",1,5,"D1");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4762 => 1) && defined($qglobals{swordhilt}) && ($qglobals{swordhilt} == 2)) { #Gemmed Sword Hilt
    quest::say("Fantastic work, $name. It would seem that this hilt is fit to be attached to a blade and distributed amongst my guards. I have many other hilts that I need delivered to Yaeorat should you choose to courier another in the future. Until then good luck to you.");
    quest::exp(1000);
    quest::faction(152,10); #house of fordel
    quest::faction(140,10); #haven defenders
    quest::faction(338,10); #traders of the haven
    quest::delglobal("swordhilt");
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: shadowhaven ID: 150089 NPC: Daloran_Glimmerblade