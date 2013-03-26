sub EVENT_SAY {
      if($text =~ /Hail/i) {
	quest::emote("bows before you. His eyes are kept wide by the pins which distort his eyelids.");
        quest::say("Greetings! You have stumbled upon the cave of the Keepers. We record the arcane secrets of the Brood of Kotiz. We have scribed many spells and make them available to all those who are deserving. Please, have a look.");
 }
      if($text =~ /chosen occultist/i) {
	quest::emote("kneels before you abjectly.");
        quest::say("Oh, great occultist! I am glad you have arrived, but I do not have the artifacts Kyvix seeks. You will have to seek out the sarnak revenants who still hold the precious stem and base. Get them and take them with your occultist skullcap back to Master Kyvix. Since you are headed in the general direction, I also have an [additional mission], if you do not mind.");
 }

if($text =~ /additional mission/i) {
	quest::emote("grabs a fist full of scribbled notes and throws them into the air in a rage.");
        quest::say("All these notes are useless to me without the first four note pages! While I ventured through the fields of the drixies, I was assaulted by a band of gobs. They were shamans. I heard them calling spirits. They took the first two pages before I escaped. Then I lost the [second two pages] the next day!! Blast!!");
 }

if($text =~ /second two pages/i) {
	quest::emote("begins to curse. Luckily, you do not understand the language, but you feel a bit of spittle strike your face.");
        quest::say("...and then there I was, almost home and the legion expedition leader decided we should explore a bit more near the lake. Then I find myself up against the same type of gobs from the fields. I just ran for the exit an never looked back, but they still managed to swipe pages 3 and 4!!");
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12854 => 1, 12855 => 1, 12856 => 1, 12857 => 1)) {
    quest::say("Oh, great necromancer, how can I repay you?!! I know. Here is a spell I recently researched. It should help you increase the strength of a summoned pet. Learn it well.");
    quest::summonitem("16426");
    quest::faction(24, 3);
    quest::faction(193, 3); 
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}