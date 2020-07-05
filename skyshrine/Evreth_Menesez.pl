#Quest for skyshrine Evreth Menesez
# items: 17166, 12550, 12558

sub EVENT_SAY {
  if ($faction == 1) {
    if($text=~/hail/i) {
      quest::say("Greetings, ally of the Claws of Veeshan! Allow me to introduce myself. I am Evreth Menesez of the Draconic Loyalist Fellowship, scholar and researcher of draconic arcane knowledge and practitioner of magery. I am currently researching the whereabouts of an [ancient dragon tome] that may contain lost arcane knowledge that could prove useful to the Claws of Veeshan, particularly the dragons and dragon-kin of Skyshrine.");
    }
    if($text=~/ancient dragon tome/i) {
      quest::say("The dragon sorcerer, Xervolithax, according to dragon lore, had penned a tome of arcane knowledge that he guarded with his life. It is told that Xervolithax fell to the Kromzek centuries ago in the Great Divide in a great battle. The only surviving apprentice of Xervolithax that survived the fateful incident recovered the tome from the fallen dragon sorcerer and divided it into [sections], which he then hid for fear of the tome falling into the hands of the Kromzek magic-users.");
    }
    if($text=~/sections/i) {
      quest::say("It is my belief from the information I have gathered thus far, that sections of the tome have been scattered into four sections that were hidden across Velious. The pages of the tome are a thick durable parchment, possibly magically preserved, and the ancient dragon script was penned in the blood of the author. Here is a binding that can be used to store the sections of the tome should you come across them in your explorations. If you find all the sections of the tome return the complete tome to me and I will reward you for your assistance with treasures from the Skyshrine coffers.");
      quest::summonitem(17166); # Item: Empty Dragon Tome Binding
    }
  }
}

sub EVENT_ITEM {
  if ($faction == 1) {
    if(plugin::check_handin(\%itemcount,12550 => 1)) {
      quest::say("By Veeshans claws, you've found it! You have done a great service for the residents of Skyshrine, $name! I will make sure that news of your accomplishment reaches the nobles of Skyshrine. Here is the reward that has been promised for your assistance.");
      quest::summonitem(12558); # Item: Orb of Draconic Energy
      quest::faction(430,30); # Faction: Claws of Veeshan
      quest::faction(436,30); # Faction: Yelinak
      quest::faction(448,-30); # Faction: Kromzek
      quest::exp(1250);
     }
  }
  plugin::return_items(\%itemcount);
}

# Quest edited and updated by mystic414
