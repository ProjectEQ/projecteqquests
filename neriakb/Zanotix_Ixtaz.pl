# items: 1890
sub EVENT_SAY {
if($text=~/what indigo sabres/i){
  quest::say("Indigo sabres are the weapons of choice for true swordsmen. They are constructed of the finest adamantite and can only be crafted in our unique Teir'Dal forge. In order to successfully craft an indigo sabre. you will require a curved blade mold. Neriak nectar. a folded sheet of adamantite. and a mold for the hilt and pommel. If you are a faithful follower of our Lord of Hate then you may be interested in crafting an imbued indigo sabre. You will need to temper the sword with shadow temper instead of Neriak nectar. and will have to forge a sapphire that has been imbued by a cleric into the sword at the time of its creation.");
  }

# Quest for The Visiting Priestess
# Nothing prevents them from doing the plat hand in more than once not sure if it is a problem
#
if($text=~/blue flame/i){
  quest::emote("gazes at you for many breaths, studying your eyes before looking back at his forge and saying, 'The Blue Flame. This is what allows us to forge our ancestral armor and weapons of adamantite. That and my unmatched skill that is. Many souls were [ritually] sacrificed to spark the flame that now feeds off the constant flow of hatred and envy of the victims . Some call it the Flame of Vengence.' Zanotix stares into the flames, poking at it absently.");
  }
if($text=~/ritual/i){
  quest::say("The Ritual? Well I was young when it took place. I don't really remember. I've had so much on my mind lately, what with all these new taxes. For instance, I need to come up with an extra 75 pieces of platinum just to cover the forge tax. I don't know what I'm going to do.....*cough*.");
  }
}

sub EVENT_ITEM {
# 75pp
if ($platinum == 75) {
  quest::emote("quickly pockets the coins and says, 'Go see the Librarian, Nallar. Tell him Denouncer Ixtaz sent you. Do not return here for at least 3 days, now go, $race.");
  quest::exp(26555);   # 0.5% @ level 30
  }
# 1890 - Vial of Noble's Blood
elsif (plugin::check_handin(\%itemcount, 1890 => 1)) {
  quest::emote("accepts the vial and looks you over, eyebrow raised. He says, 'Well, a sacrifice to feed my forge. You have done Neriak a great service, Citizen $name. I shall burn it now.' He then holds the vial up the the flames, the blood seems to glow brightly as he stares into it. Then suddenly, with the shout of an arcane phrase, he throws the vial violently into the flame. The force shatters the vial, spilling the blood about the flames. Almost immediately the flames flare up to the ceiling. When they die down a presence is felt within the flames.");
  quest::spawn(41106, 0, 0, -867, 70, -35);   # 41106 -- vengeful_spirit
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:neriakb  ID:41044 -- Zanotix_Ixtaz 
