#Crusader Vragor is used for spawning Zhaoku, a Trakasaur who drops one of the pieces for the Whistling Fists quest.
# items: 18051, 17031

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Perhaps you would care to hear a tale, and perhaps you could help me with the ending. It is the tale of the end of Grandmaster Tynn. We all know that Tynn came into Sebilis with no rebirth. I suppose you know he created the caste of Iksar monks, but I doubt you know where he now [rests] do you?");
 }
 elsif($text=~/rests/i){
  quest::say("Then I shall tell you. Master Tynn chose a place of rest in his old age. While deep in meditation he slipped away and breathed no more. His corpse remained in the stance of meditation for many years unyielding to the elements. This brings us to recent times. A Trakanasaur that has been named Zhaoku came along the remains and devoured them. The bones too hard to be chewed, he swallowed them whole. To this day he wanders with them lodged in his stomach. Are you interested in knowing [where] Zhaoku is?");
 }
 elsif($text=~/where/i){
  quest::say("I will tell you but you must help me first. I have been tied to this plane because of deeds unfinished. I was questing for the stupendous tome for ages to no avail. Without this tome I can not pass on in peace. Finish my quest, bring me the stupendous tome and a crusader coffin. I will tell you where the beast rests before I pass on. I doubt you can finish this, but I can always hope.");
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 18051 => 1, 17031 => 1)){
  quest::say("The tome! I can finally pass on in peace. Before I go I will tell you that Zhaoku rests to the east of here near Old Sebilis. He is gigantic and not easily missed.");
  quest::emote("Crusader Vragor vanishes into a mist, his sigh of relief the only thing left behind.");
  quest::spawn2(95184,0,0,-1801,-2260,-365,76); # NPC: Zhaoku
  quest::exp(20000);
  quest::ding();
  quest::faction(444,20); # Faction: Swift Tails
  quest::faction(441,10); # Faction: Legion of Cabilis
  quest::depop_withtimer();
 }
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills
