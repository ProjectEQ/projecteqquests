# items: 31799, 31829, 31832, 31831, 31830, 3873, 3875
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail $name, it is a pleasure to meet you. As the Governor of Defense for Katta Castellum it is my duty to ensure the safety of the city from outside enemies. At present the most imminent threat to the safety of our citizens is the Coterie of the Eternal Night and their [assassins]. There are other matters of defense as well however that you may be of [assistance] in dealing with.");
  }
  elsif($text=~/assassins/i) {
    #Start of Assassins Part1
    quest::say("The Coterie of the Eternal Night has trained several of their members to infiltrate the defenses of Katta Castellum and capture or kill citizens of our great city. Few of these assassins are successful at breaching the gate but the ones that do succeed tend to hide in shadowy corners waiting for an opportune moment to emerge and attack their victims. Should you discover one of these undead assassins slay it immediately. Kill four such assassins and deliver their Coterie Assassin Garrotes to me and you shall be honored by the Validus Custodus.");
  }
  elsif($text=~/assistance/i) {
    #Start of Assistance
    quest::say("Ah... Im glad that you have asked. There is a special matter that may benefit from your skills as an adventurer. I would love to explain the matter in full detail, but Im afraid that I am not your best source of information at this juncture. The matter was delegated to Kellari Autumnfall. Seek her out and see if she requires your assistance. She is looking into a matter of grave importance. Tell her that I sent you, should she ask. Be well and good luck with it.");
  }
  elsif($text=~/coterie infiltrators/i) {
    #Start of Assassins Part2
    quest::say("They are undead Illusionists capable of disguising themselves as mortals. The signs of an infiltrator are often difficult to spot but should you identify an infiltrator within the city slay it, bring me two of the creatures fangs, a Gem of Condensed Flame and your Reflective Combine Claymore and I shall bestow upon you a greater reward.");
  }
}

sub EVENT_ITEM {
  #Handin: 4x Coterie Assassin Garrotes (31799)
  if(plugin::check_handin(\%itemcount, 31799 => 4)){
    #End of Assassins Part1
    quest::say("I see you have met with success $name! You have earned the respect of the Validus Custodus. Please take this as a symbol of our gratitude and your bravery. You are gaining notoriety with the Coterie, be wary of the [Coterie Infiltrators].");
    quest::summonitem('31829'); #Reflective Combine Claymore
    quest::faction(1504,10);  # +Magus Conlegium
    quest::faction(1502,10);  # +Katta Castellum Citizens
    quest::faction(1503,10);  # +Validus Custodus
    quest::faction(1505,-10); # -Nathyn Illuminious
    quest::faction(1506,-10);  # -Coterie of the Eternal Night
    quest::faction(1483,-10); # -Seru
    quest::faction(1484,-10); # -Hand of Seru
    quest::faction(1485,-10);  # -Eye of Seru
    quest::faction(1541,-10); # -Hand Legionnaries
    quest::exp(1000);
  }
  #Handin: 2x Vampyre Infiltrator Fang (31832), 1x Gem of Condensed Flame (31831), 1x Reflective Combine Claymore (31829)
  elsif(plugin::check_handin(\%itemcount, 31832 => 2, 31831 => 1, 31829 =>1)){
    #End of Assassins Part2
    quest::say("Congratulations $name! You have done great deeds for the Validus Custodus and the safety of Katta Castellum. I award you with Ashbringer, a weapon wielded in the past by some of the Validus Custodus most fervent undead slayers. May it pass into good hands and may it continue to turn the undead to ash and dust.");
    quest::summonitem('31830'); #Ashbringer
    quest::faction(1504,10);  # +Magus Conlegium
    quest::faction(1502,10);  # +Katta Castellum Citizens
    quest::faction(1503,10);  # +Validus Custodus
    quest::faction(1505,-10); # -Nathyn Illuminious
    quest::faction(1506,-10);  # -Coterie of the Eternal Night
    quest::faction(1483,-10); # -Seru
    quest::faction(1484,-10); # -Hand of Seru
    quest::faction(1485,-10);  # -Eye of Seru
    quest::faction(1541,-10); # -Hand Legionnaries
    quest::exp(1000);
  }
  elsif(plugin::check_handin(\%itemcount, 3873 => 1)){ #Colain head turn-in for Saureem's Assistance
    quest::say("It is very unfortunate that you had to be exposed to such corruption.  Please, do not consider what you have seen during this situation to be the standard for our community.  This was a rare occurrence.  This situation did however allow you to prove yourself to us.  We thank you for your bravery and selfless action in this matter.  May you be followed by favor and may this small gift from my fellow governors and me assist you in your journeys.");
	quest::ding();
    quest::summonitem('3875'); #Elaborately Gilded Wooden Spear
    quest::faction(1504,10);  # +Magus Conlegium
    quest::faction(1502,10);  # +Katta Castellum Citizens
    quest::faction(1503,10);  # +Validus Custodus
    quest::faction(1505,-10); # -Nathyn Illuminious
    quest::faction(1506,-10);  # -Coterie of the Eternal Night
    quest::faction(1483,-10); # -Seru
    quest::faction(1484,-10); # -Hand of Seru
    quest::faction(1485,-10);  # -Eye of Seru
    quest::faction(1541,-10); # -Hand Legionnaries
    quest::exp(1000);
  }
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}

#Submitted By: Senzo

