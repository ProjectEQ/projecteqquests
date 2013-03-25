sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Greetings..It has been long since I have been aware on this plane.. Who are you and what do you want of I, Ganak, slayer of Jaled-Dar?");
  }
  if($text=~/veeshan's peak/i){
    quest::say("You wish to know of Veeshans Peak?! You are either very brave or very foolish! There is nothing there for the uninvited but a fiery death. I have been away from this plane of existence for a long time yet still I feel the presence of the ancient wurms. I am sure they sense my presence as well, being as I hold the only [key to the chambers] of the Ring of Scale.");
  }
  if($text=~/key to the chambers/i){
    quest::say("I am not so quick to grant someone the key to their death! If you truly wish your doom to fall upon you so soon then bring me the three medallions of the fallen Iksar tribes, Kylong, Obulus, and Jarsath. The tribes were long ago crushed by the warriors of the Kunzar and their remains lie buried beneath ages of rubble. Finding the lost medallions of my people will not be enough to prove yourself worthy of entry into the fortress of the great wurms -- there is another task that you must complete before you return the [medallions].");
  }
  if($text=~/medallions/i){
    quest::say("There were five different tribes of my people. The Kunzar, Kylong, Nathsar, Obulus, and Jarsath. Each of these tribes had a medallion that represented it. If you can return to me the Medallion of the Kunzar and Nathsar, I will give you the idol of Trakanon.");
  }
  if($text=~/task/i){
    quest::say("Those who enter Veeshans Peak uninvited by the lords of the Ring of Scale become nothing more than a snack for the wurms that dwell within its halls. Once you cross the threshold of the Peak there Is no escape. Any fool dedicated enough to locate the medallions can do so, but it takes a truly mighty individual to slay the dragon that has plagued my people for ages. I speak of the poison dragon Trakanon, the vile undead wurm that has conquered my peoples greatest wurmslayers. Bring me proof of Trakanons death with the medallions I request and I may deem you worthy of the key to the Ring of Scale.");
  }
  if($text =~ /glowing orb/i) {
    quest::say("The glowing orb is activated by a special key, an idol crafted in the likeness of the dread Trakanon, Reaver of Sebilis. I have this idol and will give it to you, but only if you give me two [medallions] representing the Iksar tribes of old.");
  }
  if($text =~ /Sebilis/i) {
    quest::say("An adventurer that wishes to enter the inner city of Sebilis you say?? There are only two ways in, either the [glowing orb] in the heart of the ruins in the outer city, or via one of the tortured souls that wanders the jungles nearby.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19951 => 1, 19952 => 1)) {
    quest::say("You have returned to me two medallions of my people. In return, I give you this key to enter the ruins of Sebilis. Be wary though, for Trakanon, Scourge of the Sibilisian empire resides within. ");
    quest::summonitem(20883);
    quest::exp(10000);
    quest::set_zone_flag(89);
  }
  if (plugin::check_handin(\%itemcount, 7276 => 1, 19953 => 1, 19954 => 1, 19955 => 1)) {
    quest::say("I must say, I thought your flesh would be rotting from your bones alongside the remains of the ancient Sebilisians. I commend you on your victory over the poison dragon and thank you for returning the ancient medallions of my people. I reward you with the key you seek. A place shall be prepared for your souls among the most honored of the dead. Soon you will be seeing the world through the shroud of death.");
    quest::summonitem(20884);
    quest::set_zone_flag(108);
  }
  plugin::return_items(\%itemcount);
}

# Quest by mystic414