sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Are you looking for something special, friend?"); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Armorer_Nimij 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Well met, friend.  May I be of assistance?"); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Amat_Iuziq 

sub EVENT_ITEM{
if($itemcount{4460} == 1){}
}
#END of FILE Zone:sharvahl  ID:Not_Found -- #Shainai 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Sorry friend, no time to talk right now. Busy busy busy!"); }
}
sub EVENT_ITEM{
if($itemcount{2873} == 1){
quest::say("Young $name, I will be happy to process your registration for you. While I etch your name on our people@s book of records I will require you to run a couple of errands. Take this certificate to the tax collector and obtain his seal. While you're out doing that, have Mignah create your personal Acrylia slate for you. Bring both the seal and the slate to me as soon as you can.");
quest::summonitem("2874");
}
if($itemcount{2875} == 1 && $itemcount{2876} == 1){
quest::say("Ahh, there you are. I was about to send someone looking for you. Everything seems to be in order here, only one task remains. You must gain audience with the king and swear fealty to his highness by handing him this document. Return to me when this is done.");
quest::summonitem("18299");
}
if($itemcount{18304} == 1){
quest::say("Well done, $name. I am honored to be the first to welcome you to citizenship of Shar Vahl! May you serve our society as well as it serves you. Return to your guildmaster and present both the slate and the application to him. The acrylia slate shall henceforth serve as proof of your citizenship.");
quest::say("Oh, by the way, be careful with this as it will be important for recording your service to our society. If you should somehow lose it, ask me about your slate and I will issue you a new one.");
quest::summonitem("2877");
quest::faction("Not_Found","1");
}
if($itemcount{9991} == 4){
quest::say("Young $name, I will be happy to process your registration for you. While I etch your name on our people's book of records I will require you to run a couple of errands. Take this certificate to the tax collector and obtain his seal. While you're out doing that, have Mignah create your personal Acrylia slate for you. Bring both the seal and the slate to me as soon as you can.");
quest::summonitem("2874");
}
if($itemcount{2874} == 1){
quest::say("This item, by itself, means nothing to me.");
quest::say("Ahh, there you are, I was about to send someone looking for you. Everything seems to be in order here, only one task remains. You must gain audience with the king and swear fealty to his highness by handing him this document. Return to me when this is done.");
quest::summonitem("18299");
}
if($itemcount{18299} == 1){
quest::say("Well done, $name. I am honored to be the first to welcome you to citizenship of Shar Vahl! May you serve our society as well as it serves you. Return to your guildmaster and present both the slate and the application to him. The acrylia slate shall henceforth serve as proof of your citizenship.");
quest::say("Oh, by the way, be careful with this as it will be important for recording your service to our society. If you should somehow lose it, ask me about your slate and I will issue you a new one.");
quest::summonitem("2877");
quest::faction("Not_Found","1");
}
if($itemcount{2876} == 1){
quest::summonitem("18299");
}
if($itemcount{2876} == 1 && $itemcount{2897} == 1){
quest::summonitem("18299");
}
if($itemcount{2876} == 1 && $itemcount{2877} == 1){
quest::summonitem("18299"); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Registrar_Bindarah 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Well met, friend.  May I be of assistance?"); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Dar_Khura_Ahmih 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("May I assist you with something?"); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Spiritcaller_Gaarus 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("You there.  Have you seen the [poachers] out in the thicket?  You best not be one of them!");
}
if($text=~/what poachers/i){
quest::say("There has been an outbreak in the thicket of people hunting wild cats for their hides.  Their hides!!!  People profiting off of that which was never theirs, bringing pain to any that they may overrun with force.  I can think of nothing else that turns my stomach so!  A former Khala Dun named Ferin is out there heading up the initial investigation into the despicable actions.  My apologies if I seemed a bit gruff, but I am not quite myself when discussing such matters as these."); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Khala_Dun_Jasir 

sub EVENT_ITEM{
if($itemcount{30625} == 4){
quest::summonitem("30609"); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- #Chialle 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetings, how may I assist you?"); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Khati_Sha_Jaarin 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("How may I help you?  What are you looking for?"); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Dar_Khura_Hamat 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Welcome to my store! How may I help you?"); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Jhimis_Khadwi 

sub EVENT_ITEM{
if($itemcount{2876} == 1){
quest::summonitem("12000");
quest::givecash("6","6","4","0");
quest::faction("Not_Found","1"); }
}
#END of FILE Zone:sharvahl  ID:Not_Found -- #Delival 

