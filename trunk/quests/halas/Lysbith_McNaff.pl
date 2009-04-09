sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Hail! Ye've come to [serve Halas]. have ye not? We're the Wolves o' the North and it is our task to defend our city from harm.");
}
if($text=~/serve halas/i){
quest::say("Halas is surrounded by barren arctic tundra. We've many foes. Among them are the [orc troopers]. [ice goblins] and the ever-present polar bears.");
}
if($text=~/what orc troopers/i){
quest::say("So. Ye think yerself strong enough to battle the snow orc troopers?  I pray to the Tribunal that ye are.  If ye can return to me four wrath orc wristbands  from the troopers' bodies. I'll reward ye with the [Seax].");
}
if($text=~/what ice goblins/i){
quest::say("The ice goblins have plagued our community fer some time now.  At times. they even manage to get inside our walls. Fer the most part. they prey on travelers who pass through Everfrost Peaks. Since they're a weak race. we employ our youngest warriors to [protect the pass].");
}
if($text=~/what seax/i){
quest::say("The Seax is a Northman warrior's piercing weapon.  Dinnae confuse this with the [Langseax].  The local rogues have also learned to master the Seax.  I'll only offer it to those who battle the [orc troopers].");
}
if($text=~/gnoll bounty/i){
quest::say("I've placed a bounty on the gnolls o'Blackburrow.  Their whelps have invaded our land and we must carry the fight into their dens.  Join the fight and return three gnoll fangs as proof of yer victory in Blackburrow.  Do so, and earn the respect o' the Wolves o' the North.");
}
if($text=~/protect the pass/i){
quest::say("Then travel to the Everfrost Peaks and take this pack with you.  I want you to return this pack to me when it is filled with the beaded ice necklaces of the Ice Goblins.  When it is filled, combine the items and return it to me and I shall decide if you deserve a reward for your deed.");
quest::summonitem(17944);
}
 }

sub EVENT_ITEM {
  if  (plugin::check_handin(\%itemcount, 12223 => 4)){
   quest::say("Well done! You've proved yerself worthy o' this!");
   quest::summonitem(7322);
   quest::exp(300);
   # Wolves of the North
   quest::faction("361","5");
   # Shamen of Justice
   quest::faction("294","5");
   # Merchants of Halas
   quest::faction("213","5");
   # Steel Warriors
   quest::faction("311","5");
 }
  if  (plugin::check_handin(\%itemcount, 13898 => 1)){
   quest::say("Ye've done well, me young $class .  We've gathered these to add to yer provisions.  While in the Everfrost Peaks, be on the watch fer any gnolls ye may find.  I declare there to be a [gnoll bounty].");
   quest::exp(3800);
   quest::givecash("0","0","4","0");
   # Reward: Iron Ration
   quest::summonitem(13005);
   # Wolves of the North
   quest::faction("361","5");
   # Shamen of Justice
   quest::faction("294","5");
   # Merchants of Halas
   quest::faction("213","5");
   # Steel Warriors
   quest::faction("311","5");
 }
 # Gnoll Bounty - Return 3 Gnoll Fangs
   if  (plugin::check_handin(\%itemcount, 13915 => 3)){
   quest::say("Fine work, fine work!  The gnoll threat must be extinguished before it can ever fully grow.  Ye've done yer part to aid our cause.  Please allow me to repay ye with a few provisions and a wee bit o' coin.  Then, continue with yer good deeds.");
   quest::exp(3800);
   quest::givecash("0","0","5","0");
   # Reward: Iron Ration
   quest::summonitem(13005);
   # Wolves of the North
   quest::faction("361","10");
   # Shamen of Justice
   quest::faction("294","10");
   # Merchants of Halas
   quest::faction("213","10");
   # Steel Warriors
   quest::faction("311","10");
 }
 else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:halas  ID:29056 -- Lysbith_McNaff - Updated by Blaz