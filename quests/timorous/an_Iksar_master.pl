#This iksar master is actually Master Rinmark, for the monk shackle quest line that eventually culminates in the Whistling Fists

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("is humming and chanting softly. He seems oblivious to your presence.");
 }
 elsif($text=~/master rinmark/i){
  quest::emote("squints one eye open, then returns to his meditation.");
 }
 elsif($text=~/talon southpaw/i){
  quest::emote("waves his arms in the air. 'The great master. His soul is the wind. He speaks to us in words of thunder. He strikes Norrath with bolts of lightning. I seek to be as he is. I have traveled the globe in search of his fists. I have found only one. Another is said to be with [Gomoz]. I shall return it when I am finished with my seasons-long meditation or perhaps I shall find a monk to [return the hand to Cabilis].'");
 }
 elsif($text=~/Gomoz/i){
  quest::say("Disciple Gomoz was once Talon Southpaw's pupil. It is rumored that he has only one hand. Unfortunately, a horde of ogre raiders swiped his bones, along with others, from their place in Kurn's Tower. What those simple oafs plan to do with them is a mystery. Only one who has studied the arcane sciences could use them. They most likely used them as soup bones.");
 }
 elsif($text=~/return the hand to Cabilis/i){
  quest::emote("hands you an old tattered sack. 'This shall be your proof of allegiance. Prove that you are strong with an intact mandible of a skulking brutling and the claws of a burynai excavator. Prove that you are a monk of fist and tail with a sash of an exiled human monk and the sparring gloves of a goblin pit fighter. Combined, these items make the sack full. This will earn my trust and the hand.'");
  quest::summonitem(17036);
 }
 elsif($text=~/assist old Rinmark in completing his rock garden/i){
  quest::emote("pours the pebbles into his pocket and hands the box to you. 'Take my box. Fill and combine within my box the following; a radiant meteorite, frontier fool's gold, petrified redwood, Rile's sand coin, sulfur stone, fragment of tektite, plains pebble, jade magma, heart of ice and an unholy coldstone. Return the full tin box to me and I shall reward you with a shackle of bronze.'");
  quest::summonitem(17039);
 }
 elsif($text=~/student/i){
  quest::emote("hands you what appears to be the base of a key. 'This was delivered to me by a dying student. He collapsed just after handing it to me. He was accompanying a student of mine named Veltar. They were questing for the legendary Whistling Fists. The key is made of a metal I have never felt or heard of. Find him.'");
  quest::summonitem(17040);
 }
 elsif($text=~/test of patience/i){
  quest::say("So your time has finally come to be tested for the final rung. To show your patience you shall spar with me. When you have gained the insight and strategy to strike you will know when. Strike me too soon and you will perish, too late and I will be gone. Come at me when the time is right. Let us begin.");
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(96318,0,0,$x,$y,$z,$h);
  quest::depop();
 }
 elsif($text=~/whistling fists/i){
  quest::say("The Whistling Fists are rumored to be magical instruments of destruction which can only be wielded by monks. The founder, Supreme Master Tynn, was the only lizard to ever gaze upon the weapon. He only spoke of it to his student Marthor. Marthor rarely spoke of it and when he did it was usually after a few flagons of Trog Brew. That is why many consider it to be babble.");
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 12815 => 1)){
  quest::emote("bows before you and takes a wrinkled, mummified hand from a pouch at his side. 'Take the hand. Let it rest within Cabilis and be reunited with the left.'");
  quest::summonitem(12797);
  quest::exp(20000);
  quest::ding();
  quest::faction(317,20);
  quest::faction(193,10);
 }
 elsif(plugin::check_handin(\%itemcount, 12829 => 1)){
  quest::emote("opens the box to reveal a variety of pebbles. 'How grand!! My pebbles!! Now I can continue with my rock garden!! Hmmm. You look familiar. Hey!! I bet you can help me complete my garden!! Would you please [assist old Rinmark in completing his rock garden]?'");
  quest::exp(30000);
  quest::ding();
  quest::faction(317,20);
  quest::faction(193,10);
 }
 elsif(plugin::check_handin(\%itemcount, 12836 => 1)){
  quest::emote("graciously accepts the tin box filled with precious rocks and gems. 'Thank you greatly, young $name. For your deed, I bestow upon you the shackle of bronze!! You have completed the third rung. Alas, there is no time for celebration. I need your help in rescuing a [student] of mine.'");
  quest::summonitem(4195);
  quest::exp(30000);
  quest::ding();
  quest::faction(317,20);
  quest::faction(193,10);
 }
 else{ 
 plugin::return_items(\%itemcount);
 quest::say("That is not what I sent you for."); #Made this up
 }
}

#Submitted by: Jim Mills