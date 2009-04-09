sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetings to you.  I seek those who call themselves enchanters.  Are you an enchanter?");
}
if($text=~/i am an enchanter/i){
quest::say("I thought so.  I have several tasks for you accomplish.  Once you have completed them I will have a cap. a robe. sleeves. wristbands. gloves. leggings and boots to reward you with.");
}
if($text=~/what cap/i){
quest::say("For an enchanted head guard bring me a torn enchanted silk turban as well as three pieces of crushed flame opal.");
}
if($text=~/what sleeves/i){
quest::say("Bring unto me a set of torn enchanted silk sleeves as well as three flawed topaz.  With these in my possession I can create a set of enchanted sleeves the likes of which spellcasters like you dream of.");
}
if($text=~/what wristbands/i){
quest::say("An enchanted silk wristguard and three crushed onyx sapphires is all that I require to create an imbued wrist wrap of great power.  Seek out these items and return to me when you have acquired them.");
}
if($text=~/what leggings/i){
quest::say("Three nephrite and a pair of torn enchanted silk leggings will net you a fine set of pantaloons.");
}
if($text=~/what boot/i){
quest::say("Three crushed jaundice gems combined with torn enchanted silk boots would make a most interesting set of footwear.  The latent powers of the gems can be harnessed to create magical effects.");
}
if($text=~/what gloves/i){
quest::say("If you seek gloves of great power. bring to me three crushed topaz and a pair of torn enchanted silk gloves.  I will use the power of the gems to imbue the gloves."); }
}
sub EVENT_ITEM{
if($itemcount{1423} == 1 && $itemcount{1427} == 1){
quest::say("Ohh. that's better. I get so touchy when I'm hungry. I should probably go apologize to Derrin for being snappy. Please return this to Mordin for me.");
quest::summonitem("1424");
quest::faction("336","-1");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("331","-1");
}
if($itemcount{1417} == 1 && $itemcount{17906} == 1){
quest::say("Ohh. that's better. I get so touchy when I'm hungry. I should probably go apologize to Derrin for being snappy. Please return this to Mordin for me.");
quest::summonitem("1424");
quest::faction("336","-1");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("331","-1");
}
if($itemcount{1417} == 1 && $itemcount{16901} == 3 && $itemcount{16908} == 1 && $itemcount{13006} == 1){
quest::say("Ohh. that's better. I get so touchy when I'm hungry. I should probably go apologize to Derrin for being snappy. Please return this to Mordin for me.");
quest::summonitem("1424");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
quest::faction("331","-1"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Lorekeeper_Brita 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("A ring or necklace for yer sweetheart. traveler? It'll be sure ta brighten their day and ye'll not find finer craftmanship this side o' the Gretespeign."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Talem_Tucter 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("As far as I'm concerned there are only two arts in this world. alcohol and food. The Velium Keg is probably the best place to go for the former but I've got all yer needs for the latter covered right here."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Perkins_Doughbeard 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Huh?  Dont you know better than to interrupt a Coldain enjoying his ale?  I may be a user of priestly magic but that doesnt mean I cant bash your head in."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Erdarf_Restil 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Welcome to the Thurgadin Minin' Company, $name. As foreman it's my job to see that me lads are well trained and well cared fer. Unfortunately we're not in too good shape right now. Ye see, it seems a new vein was struck recently and a bunch of unwelcome critters have come crawlin outta the works attackin' me lads. In order ta help combat this menace I've engineered a new set of armor for the miners, but need some raw materials to get them started.");
}
if($text=~/what armor/i){
quest::say("Excellent. $name! I knew ye were the right wood elf for the job. The pieces I can make are a coif. a tunic. sleeves. bracers. gauntlets. leggings. and boots.  This stuff might not be fitting ya if ye're not stealthy like us miners though.");
}
if($text=~/what coif/i){
quest::say("To create a piece of armor to protect your sensitive skull. I will require three pieces of crushed coral as well as a corroded chain coif.");
}
if($text=~/what sleeves/i){
quest::say("Protection for your arms will come at the price of three flawed emeralds and a set of corroded chain sleeves.");
}
if($text=~/what bracers/i){
quest::say("For the bracers. I will require a corroded chain bracer as well as three crushed flame emeralds.  Return to me when you find such things. $name.");
}
if($text=~/what gauntlets/i){
quest::say("Protecting your hands is very important.  I can forge protection for your hands if you bring me a pair of corroded chain gauntlets and three crushed topaz.");
}
if($text=~/what leggings/i){
quest::say("A set of corroded chain leggings might be salvageable if you were to find three flawed sea sapphires.  With the right techniques and ingredients almost anything is possible.");
}
if($text=~/what boots/i){
quest::say("We use our feet so often. should not they be protected as well as any other portion of our bodies?  If you seek fine protection for your feet. return to me with three pieces of crushed black marble and a set of corroded chain boots.");
}
if($text=~/what tunic/i){
quest::say("To forge a spectacular chain tunic I will require three flawless diamonds and a corroded chain tunic.  With the gems and my skills I may be able to draw out some of its magical powers."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Foreman_Felspar 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("The gems I carry were actually collected by geonids. a race of rock and gem people that communicate with their minds alone. If'n ye haven't had the chance to see one yet I suggest ye journey to the Wakenin' Lands; they've reportedly got a colony somewhere in that area."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Meg_Tucter 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hey. what do ye think yer lookin' at. ugly? Yeah. that's right. I called ye ugly. You gonna make somethin of it. $race? Yeah. I didn't think ye would. The last guy that looked at me wrong took me fist right in his mouth. laid him out flat on the ground! He been drinkin' an' all but he woulda been laid out flat even if he hadna been.");
quest::say("Hey. what do ye think yer lookin' at. ugly? Yeah. that's right. I called ye ugly. You gonna make somethin of it. Barbarian? Yeah. I didn't think ye would. The last guy that looked at me wrong took me fist right in his mouth. laid him out flat on the ground! He been drinkin' an' all but he woulda been laid out flat even if he hadna been.");
quest::say("Hey. what do ye think yer lookin' at. ugly? Yeah. that's right. I called ye ugly. You gonna make somethin of it. %#1472? Yeah. I didn't think ye would. The last guy that looked at me wrong took me fist right in his mouth. laid him out flat on the ground! He been drinkin' an' all but he woulda been laid out flat even if he hadna been."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Clifus 

sub EVENT_SAY{
if($text=~/what velium vapor/i){
quest::say("Ahh. you come seeking my family recipe? After all you've done for our people it's the least I can do. First you must fashion a velium vial. then combine the vial with two small pieces of velium in this jar. That's all there is to it. Please keep the recipe a secret.");
quest::say("Ahh. you come seeking my family recipe? After all you've done for our people it's the least I can do. First you must fashion a velium vial. then combine the vial with two small pieces of velium in this jar. That's all there is to it. Please keep the recipe a secret.");
quest::summonitem("17513"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Frundle_Frenkler 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Can I help you with something? If you want anything to do with carpentry. somethin' I grew up with and was raised on. I can't help ya. Nope."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Fergus_Sawdust 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetings traveler. and welcome to the Temple of Lore. This library contains the sacred scrolls and texts of our ancestors. detailing both the history of their lives and the trials of our people. Previously the lore contained within these halls was forbidden to enter the hands of outsiders such as yourself. However. his majesty Dain Frostreaver IV has recently decreed that certain tomes of our heritage should be shared with the newly arrived offlanders so that they might better understand our culture. I have recently inscribed and translated several of these books which you may purchase for a modest donation."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Lorekeeper_Derrin 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Oh. HI! Hey. you're an adventurer aren't you? Yeah I thought so from your worn clothes and weapons.  Wow. is that a real bloodstain? Some day I'll be adventuring out there too. some day. they'll see..."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Thermin_Wandereye 

sub EVENT_ITEM{
if($itemcount{1424} == 1 && $itemcount{1428} == 1){
quest::say("My compliments. $name. what a wonderful dish! Please accept my personal Seal as a token of my appreciation. May it give you power over your adversaries.");
quest::say("My compliments. $name. what a wonderful dish! Please accept my personal Seal as a token of my appreciation. May it give you power over your adversaries.");
quest::summonitem("1422");
quest::faction("336","-1");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("331","-1"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Grand_Historian_Thoridain 

sub EVENT_ITEM{
if($itemcount{1419} == 1 && $itemcount{1426} == 1){
quest::say("Why thank you. $name. I haven't tasted snow bunny stew this good in quite some time. Be a dear and take this back to Mordin for me.");
quest::summonitem("1423");
quest::faction("336","-1");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("331","-1");
}
if($itemcount{1426} == 1 && $itemcount{1416} == 1){
quest::say("Why thank you. $name. I haven't tasted snow bunny stew this good in quite some time. Be a dear and take this back to Mordin for me.");
quest::summonitem("1423");
quest::faction("336","-1");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("331","-1"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Trita_Coldheart 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetins and welcome to Thurgadin. $name. Ye best watch yer step on the bridge  there. it can be a bit slippery.");
quest::say("Greetins and welcome to Thurgadin. %#1472. Ye best watch yer step on the bridge  there. it can be a bit slippery."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Guard_Dagur 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Well met. Ogre! I am Captain Njall. commander of the city guard here in Thurgadin. If ye seek ta join our ranks.  I welcome ye with open arms and have an offer to make if you are interested. If ye seek to be our enemy. then I hope ye can run swifter than my archers' arrows.");
quest::say("Well met. $name! I am Captain Njall. commander of the city guard here in Thurgadin. If ye seek ta join our ranks.  I welcome ye with open arms and have an offer to make if you are interested. If ye seek to be our enemy. then I hope ye can run swifter than my archers' arrows.");
quest::say("Well met. Barbarian! I am Captain Njall. commander of the city guard here in Thurgadin. If ye seek ta join our ranks.  I welcome ye with open arms and have an offer to make if you are interested. If ye seek to be our enemy. then I hope ye can run swifter than my archers' arrows.");
quest::say("Well met. %#1471! I am Captain Njall. commander of the city guard here in Thurgadin. If ye seek ta join our ranks.  I welcome ye with open arms and have an offer to make if you are interested. If ye seek to be our enemy. then I hope ye can run swifter than my archers' arrows.");
quest::say("Well met. %#1472! I am Captain Njall. commander of the city guard here in Thurgadin. If ye seek ta join our ranks.  I welcome ye with open arms and have an offer to make if you are interested. If ye seek to be our enemy. then I hope ye can run swifter than my archers' arrows.");
quest::say("Well met. %#1479! I am Captain Njall. commander of the city guard here in Thurgadin. If ye seek ta join our ranks.  I welcome ye with open arms and have an offer to make if you are interested. If ye seek to be our enemy. then I hope ye can run swifter than my archers' arrows.");
quest::say("Well met. %#1470! I am Captain Njall. commander of the city guard here in Thurgadin. If ye seek ta join our ranks.  I welcome ye with open arms and have an offer to make if you are interested. If ye seek to be our enemy. then I hope ye can run swifter than my archers' arrows.");
}
if($text=~/what boots/i){
quest::say("Boots made for battle are not always the most comfortable available.  However if you seek a fine set for battle bring me a set of corroded plate boots and three pieces of crushed black marble.");
}
if($text=~/what breastplate/i){
quest::say("For the breastplate I will need a corroded breastplate and three flawless diamonds.  Once I have them in my possession it will not take long to craft a sturdy breastplate.");
}
if($text=~/what helm/i){
quest::say("To create a piece of armor to protect your skull I will require three pieces of crushed coral as well as a corroded plate helmet.");
}
if($text=~/what armplates/i){
quest::say("Protection for your arms will come at the price of a set of corroded plate vambraces and three flawed emeralds.");
}
if($text=~/what bracers/i){
quest::say("For the bracers. I will require a corroded plate bracer and a set of three crushed flame emeralds.  Return to me if you happen to find these things in your travels.");
}
if($text=~/what gauntlets/i){
quest::say("Protecting your hands is very important.  I can forge protection for your hands if you bring me a pair of corroded plate gauntlets and three crushed topaz.");
}
if($text=~/what greaves/i){
quest::say("A set of corroded greaves might be salvageable if you were to find three flawed sea sapphires.  With the right techniques almost anything is possible.");
}
if($text=~/what about boots/i){
quest::say("Boots made for battle are not always the most comfortable available.  However if you seek a fine set for battle bring me a set of corroded plate boots and three pieces of crushed black marble.");
}
if($text=~/what bracer?/i){
quest::say("For the bracers. I will require a corroded plate bracer and a set of three crushed flame emeralds.  Return to me if you happen to find these things in your travels."); }
}
sub EVENT_ITEM{
if($itemcount{24931} == 1 && $itemcount{25833} == 5){
quest::summonitem("31090");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
quest::faction("331","-1");
}
if($itemcount{24930} == 1 && $itemcount{25821} == 3){
quest::summonitem("31086");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
quest::faction("331","-1");
}
if($itemcount{25838} == 5 && $itemcount{24932} == 1){
quest::summonitem("31087");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
quest::faction("331","-1"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Captain_Njall 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetings to you.  I seek the service of devout knights who have distinguished themselves.  Are you a paladin?");
}
if($text=~/i am a paladin/i){
quest::say("A paladin of your kind has not made it this far for quite some time.  Well. I wonder what it is you seek here. Do you seek heroic and chivalrous deeds to distinguish yourself from your brethren?  Do you need accoutrements to aid you in your battles perhaps?  You are in luck. knight. for I have both for you.  Do you wish to partake of my quests?");
}
if($text=~/i wish to partake in your quests/i){
quest::say("Excellent.  By serving my cause. you in turn will further your own.  I require certain components and if you bring them to me. I shall reward you for your honorable service.  You may choose from among these items: a helm. a breastplate. armplates. bracers. gauntlets. greaves. and boots.");
}
if($text=~/what helm/i){
quest::say("To create a piece of armor to protect your skull I will require three pieces of crushed coral as well as a corroded plate helmet.");
}
if($text=~/what breastplate/i){
quest::say("For the breastplate I will need a corroded breastplate and three flawless diamonds.  Once I have them in my possession it will not take long to craft a sturdy breastplate.");
}
if($text=~/what armplates/i){
quest::say("Protection for your arms will come at the price of a set of corroded plate vambraces and three flawed emeralds.");
}
if($text=~/what bracers/i){
quest::say("For the bracers. I will require a corroded plate bracer and a set of three crushed flame emeralds.  Return to me if you happen to find these things in your travels.");
}
if($text=~/what gauntlets/i){
quest::say("Protecting your hands is very important.  I can forge protection for your hands if you bring me a pair of corroded plate gauntlets and three crushed topaz.");
}
if($text=~/what greaves/i){
quest::say("A set of corroded greaves might be salvageable if you were to find three flawed sea sapphires.  With the right techniques almost anything is possible.");
}
if($text=~/what boots/i){
quest::say("Boots made for battle are not always the most comfortable available.  However if you seek a fine set for battle bring me a set of corroded plate boots and three pieces of crushed black marble."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Battlepriest_Daragor 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Well. hello there. dear. it sure gets cold here. doesn't it? Perhaps I can interest you in a sewing pattern to pass the time and keep you warm."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Betti_Frostweaver 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hail to ye as well offlander. I bid you welcome to the Icy Mug. one o' the finest establishments for a drink in Thurgadin. Whether it's [souvenirs] or stories yer lookin for. you've come to the right place.");
quest::say("Hail to ye as well offlander. I bid you welcome to the Icy Mug. one o' the finest establishments for a drink in Thurgadin. Whether it's [souvenirs] or stories yer lookin for. you've come to the right place.");
quest::say("That's not good. the Grand Historian's mighty protective of his daughter. What he do after he caught ya?");
}
if($text=~/what souvenirs/i){
quest::say("Here at the Icy Mug we have our own signature stein fer yer drinkin pleasure. For only 5 gold pieces ye can take one home to show yer kinfolk."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Petcas_Coldbeard 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("You got a dispute to settle or are ya here to yap it up?"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Lieutenant_Grimur 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Oh hello there! I'm sorta new here so I ask ye to be patient with me heheh. What kin I get fer ya. $name?"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Karey 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("I wasn't always a pottery salesman ye know. I used to forge fine velium weapons and even had me own shop. Unfortunately no one wanted to buy anything from Brittleblade's. so I work with clay now. care to purchase somethin'?"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Gilthan_Brittleblade 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("I've found it at last! By calculating the aerodynamic plane of the shaft and measuring it against the wind resistance and downward pull of the head I've managed to create the perfect arrow! I suggest ye take advantage of my stock while it lasts. $name. it sure as Brell won't be around for long.");
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Tavir 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetings to you.  I seek those who call themselves magicians.  Are you a magician. little one?");
}
if($text=~/i am a magician/i){
quest::say("I thought so.  I have several tasks for you accomplish.  Once you have completed them I will have a cap. a robe. sleeves. wristbands. gloves. leggings and boots to reward you with.");
}
if($text=~/what cap/i){
quest::say("For an enchanted head guard bring me a torn enchanted silk turban as well as three pieces of crushed flame opal.");
}
if($text=~/what robe/i){
quest::say("If you wish to have a fine robe. bring unto me a torn enchanted silk robe and three pristine emeralds.  Then you will receive a robe beyond your wildest dreams.");
}
if($text=~/what sleeves/i){
quest::say("Bring unto me a set of torn enchanted silk sleeves as well as three flawed topaz.  With these in my possession I can create a set of enchanted sleeves the likes of which spellcasters like you dream of.");
}
if($text=~/what wristbands/i){
quest::say("An enchanted silk wristguard and three crushed onyx sapphires is all that I require to create an imbued wrist wrap of great power.  Seek out these items and return to me when you have acquired them.");
}
if($text=~/what gloves/i){
quest::say("If you seek gloves of great power. bring to me three crushed topaz and a pair of torn enchanted silk gloves.  I will use the power of the gems to imbue the gloves.");
}
if($text=~/what leggings/i){
quest::say("Three nephrite and a pair of torn enchanted silk leggings will net you a fine set of pantaloons.");
}
if($text=~/what boots/i){
quest::say("Three crushed jaundice gems combined with torn enchanted silk boots would make a most interesting set of footwear.  The latent powers of the gems can be harnessed to create magical effects."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Kyla_Frostbeard 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Ahem....yes. hail. I suppose that would suffice in this case. Well. then. hail to you. sir. I am Lorekeeper Gundlt. master keeper of etiquette. It is my duty. as ordained by the Grand Historian. to keep all records and rules on all royal audiences and dealings."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Lorekeeper_Gundlt 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Welcome ta me bar. I suggest ye sit down and have a drink cause if'n ye ai'nt drinkin ye've no business bein 'ere."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Doogle_McBanick 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Well. hello there. my good fellow. I see you've somehow found your way into my private quarters. very adventurous. Normally I'd have you removed but it's refreshing to see someone with guts like you have. Too many people in this cit... err ... world have no guts. No initiative. Someday that will change. though."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Valdicar_Shadowfrost 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetings to you.  I seek one who calls himself a wizard.  What do you call yourself?");
}
if($text=~/i am a wizard/i){
quest::say("Excellent.  Are you sure enough of your skills  to undertake my tasks?  If not. get out of my sight!");
}
if($text=~/what cap/i){
quest::say("For an enchanted head guard bring me a torn enchanted silk turban as well as three pieces of crushed flame opal.");
}
if($text=~/what sleeves/i){
quest::say("Bring unto me a set of torn enchanted silk sleeves as well as three flawed topaz.  With these in my possession I can create a set of enchanted sleeves the likes of which spellcasters like you dream of.");
}
if($text=~/what robe/i){
quest::say("If you wish to have a fine robe. bring unto me a torn enchanted silk robe and three pristine emeralds.  Then you will receive a robe beyond your wildest dreams.");
}
if($text=~/what leggings/i){
quest::say("Three nephrite and a pair of torn enchanted silk leggings will net you a fine set of pantaloons.");
}
if($text=~/what boots/i){
quest::say("Three crushed jaundice gems combined with torn enchanted silk boots would make a most interesting set of footwear.  The latent powers of the gems can be harnessed to create magical effects.");
}
if($text=~/what wristbands/i){
quest::say("An enchanted silk wristguard and three crushed onyx sapphires is all that I require to create an imbued wrist wrap of great power.  Seek out these items and return to me when you have acquired them."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Mauren_Frostbeard 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("I'm terribly sorry. good fellow. but this residence is privately owned. Your presence here is quite disconcerting for my master. I implore you to take your leave. Thaaaaanks."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Yates_the_Butler 

sub EVENT_SAY{
if($text=~/what chore/i){
quest::say("The council agrees that you have demonstrated a disdain for our enemy. the Kromrif. that rivals our own. They now ask that you demonstrate your loyalty to the Dain by humbling yourself and serving our people. Give this, my seal, to Mordin. He will instruct you further.");
quest::summonitem("1420");
}
if($text=~/what brewing/i){
quest::say("Ahh, yes, good to see you again, $name. I wish it were under better circumstances that we meet today. For some time now we have sent teams of our finest rogues to gather intelligence for the Dain. Tanik Greskil is one of our best. He was recently sent into the heart of Kael Drakkel on a very important mission and has not returned. He is now long overdue, and fearing the worst, our wise council has asked me to dispatch a rescue party to determine what has become of him and return him to safety. I have decided to give you this opportunity to build upon the trust you have earned from the council. Will you accept this mission?");
}
if($text=~/what task/i){
quest::say("Every year the Dain replaces the trophies in his trophy room. There is a reward given for the best new trophy obtained. I intend to win this year and I will upgrade your prayer shawl for assisting me. Fill this box with ten Kromrif heads and bring me the combined contents along with the burlap shawl. I will submit the best one for the Dain's consideration.");
quest::say("Every year the Dain replaces the trophies in his trophy room. There is a reward given for the best new trophy obtained. I intend to win this year and I will upgrade your prayer shawl for assisting me. Fill this box with ten Kromrif heads and bring me the combined contents along with the burlap shawl. I will submit the best one for the Dain's consideration.");
quest::summonitem("17102");
}
if($text=~/I seek to perform duties for the crown./i){
quest::say("Those eager to prove their loyalty to the Dain may do so by completing tasks that I have been commissioned to assign. If you wish to begin your service, return to me with four toes of our enemy, the Kromrif.");
}
if($text=~/Hail/i){
quest::say("Greetings, $name, please be seated and hear the Grand Historian, he is among the wisest of our people.");
}
if($text=~/I seek to perform duties for the crown/i){
quest::say("Those eager to prove their loyalty to the Dain may do so by completing tasks that I have been commissioned to assign. If you wish to begin your service, return to me with four toes of our enemy, the Kromrif.");
}
if($text=~/what dutyes for the crown/i){
quest::say("Those eager to prove their loyalty to the Dain may do so by completing tasks that I have been commissioned to assign. If you wish to begin your service, return to me with four toes of our enemy, the Kromrif.");
}
if($text=~/what duties fer the crown/i){
quest::say("Those eager to prove their loyalty to the Dain may do so by completing tasks that I have been commissioned to assign. If you wish to begin your service. return to me with four toes of our enemy. the Kromrif.");
}
if($text=~/I wish to perform duties for the crown/i){
quest::say("Those eager to prove their loyalty to the Dain may do so by completing tasks that I have been commissioned to assign. If you wish to begin your service. return to me with four toes of our enemy, the Kromrif."); }
}
sub EVENT_ITEM{
if($itemcount{1175} == 1){
quest::say("Ahh, some fine specimens indeed, $name. I will have the best of these mounted at once, wish me luck in the contest! Here is the Cloth Prayer Shawl of our people. Before I forget, the council has issued yet another [chore] for you to complete.");
quest::summonitem("1176");
quest::faction("336","-1");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("331","-1");
}
if($itemcount{1422} == 1 && $itemcount{1176} == 1){
quest::say("Well done, $name, the council will be impressed with your effort. Here is the woven prayer shawl, wear it with pride. I know there is talk of great plans for you, be sure to come back and ask me what the council has [brewing].");
quest::summonitem("1177");
quest::faction("336","-1");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("331","-1");
}
if($itemcount{29125} == 4){
quest::say("Ahh, well done! On behalf of the Dain I thank you for making a dent in the number of our sworn enemy. Please accept this as a token of our appreciation. It is trivial, I know, but if you are as loyal as you claim to be, it will increase in power over time. It just so happens I have a [task] to further demonstrate your loyalty, $name.");
quest::summonitem("1175");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
quest::faction("331","-1");
}
if($itemcount{1175} == 1 && $itemcount{1174} == 1){
quest::say("Ahh, some fine specimens indeed, $name. I will have the best of these mounted at once, wish me luck in the contest! Here is the Cloth Prayer Shawl of our people. Before I forget, the council has issued yet another [chore] for you to complete.");
quest::summonitem("1176");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
quest::faction("331","-1");
}
if($itemcount{1177} == 1){
quest::summonitem("1178");
quest::faction("330","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
quest::faction("331","-1"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Loremaster_Borannin 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hail and welcome to the Broken Glacier, $name. Ye'll find the bar downstairs and comfortable rooms up top. Can I interest you in one of our signature mugs, only a platinum piece they are!");
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Tobart_Dirkins 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Ye have the look of an aspirin' velium smith about ye, $name. Well, ye won't get very far in the field without purchasin' some o' the finest smithin' molds in Thurgadin. Lucky for you I can help ye in that department, so what'll it be?"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Brimgald_Brightsteel 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("WHY, HELLO THAR, YOUNG LAD! GREAT DAY FER IT, AIN'T IT? YESSIREE! WHY THIS REMINDS ME O' THE DAYS BACK WHEN WE'D GATHER ROUND THE FIRE LIKE THIS AND.... OH. HELLO THAR, YOUNG LAD!.  ER...  WHAT WAS I SAYIN'?"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Elder_Reevis 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hello there, name's Icefang and it's my duty to see that these here pups get the proper trainin' afore bein' paired with one of our warriors.  I've heard rumors of some travelers that have a special relationship with wild beasts.  They call them [beastlords].");
}
if($text=~/i am a beastlord/i){
quest::say("Are you really?  Well I'll just be havin' ta' let you try out some o' this new armor I came up with.  The wolves seem to respond better to the boys when they're wearing it.  I have a cap, leggings, bracers, tunic, boots, sleeves, and some gloves that you might be interested in.");
}
if($text=~/what leggings/i){
quest::say("I may be able to craft a set of wondrous leggings from a set of old eroded leather leggings and three flawed sea sapphires.  It is amazing what you can do with a bit of magic.");
}
if($text=~/what cap/i){
quest::say("To create a piece of armor to protect your sensitive skull I will require three pieces of crushed coral as well as an eroded leather cap.");
}
if($text=~/what tunic/i){
quest::say("To create a spectacular tunic fit for your kind I will require three flawless diamonds and an eroded leather tunic.  With the gems and my skills I may be able to draw out some of its magical powers.");
}
if($text=~/what sleeves/i){
quest::say("Protection for your arms will come at the price of three flawed emeralds and a set of eroded leather sleeves.");
}
if($text=~/what boots/i){
quest::say("We use our feet so often, should not they be protected as well as any other portion of our bodies?  If you seek fine protection for your feet return to me with three pieces of crushed black marble and a pair of eroded leather boots.");
}
if($text=~/what bracers/i){
quest::say("For the bracers, I will require a eroded leather bracelet as well as three crushed flame emeralds.  Return to me when you find such things."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Pearce_Icefang 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("What ye want?  A torch?  I be puttin' that torch some place fer ya if that's what ye want.  Right there in that satchel o' yers if I do say meself.  Got the best prices, I do, even fer ya outlanders. Mebbe ye should take a gander round me store, ye may be openin' that coin purse then, eh?"); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Agar 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetings to you.  I seek one who calls himself a druid.  What do you call yourself, manling?");
}
if($text=~/i call myself a druid/i){
quest::say("Good,  I had hoped you were one.  As nature's guardian, you fight the never-ending struggle against those who seek to defile it.  It is an admirable quality and I wish to aid you.  I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots.");
}
if($text=~/what cap/i){
quest::say("Those who are as wise as we are know that protection of the head is most important.  I may be able to forge you something most interesting if you were to bring me three pieces of crushed onyx sapphire and an eroded leather cap.");
}
if($text=~/what tunic/i){
quest::say("If you find an eroded leather tunic and three pieces of black marble bring them to me and I shall attempt to create an enchanted tunic that will serve you well.");
}
if($text=~/what sleeves/i){
quest::say("Three jaundice gems and a set of eroded leather sleeves might be an interesting combination.  The powers of the gems may be harvested to imbue the sleeves.");
}
if($text=~/what bracers/i){
quest::say("Bracers are quite easy to imbue.  Simply find three crushed opals and an eroded leather bracer and I will complete the ritual to enchant them.");
}
if($text=~/what gloves/i){
quest::say("Strong protection for one's hands is important.  I may be able to craft you a set of powerful leather gloves if you find a set of eroded leather gloves and three crushed lava rubies.");
}
if($text=~/what leggings/i){
quest::say("Leggings are a bit trickier to imbue.  Three chipped onyx sapphires will allow me to channel the correct energies into a pair of eroded leather leggings, however those chipped onyx sapphires are somewhat rare.  Return to me if you find such things in your journeys.");
}
if($text=~/what boots/i){
quest::say("Simply bring me a set of three crushed flame emeralds and a pair of eroded leather boots and I will imbue them.  I bid you good luck in finding such things."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Cobi_Frostbeard 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetings to you.  I seek one tho has chosen the path of monkhood. What do you call yourself?");
}
if($text=~/i call myself a monk/i){
quest::say("Good,  I had hoped you were one.  I have heard that as a seeker of the way you are in constant training to push yourself to your physical and mental limits.  It is an admirable quality and I wish to aid you.  I will provide you with a cap, a tunic, sleeves, bracers, gloves, leggings and boots.");
}
if($text=~/what cap/i){
quest::say("To create a piece of armor to protect your sensitive skull I will require three pieces of crushed coral as well as an eroded leather cap.");
}
if($text=~/what tunic/i){
quest::say("To create a spectacular tunic fit for your kind I will require three flawless diamonds and an eroded leather tunic.  With the gems and my skills I may be able to draw out some of its magical powers.");
}
if($text=~/what sleeves/i){
quest::say("Protection for your arms will come at the price of three flawed emeralds and a set of eroded leather sleeves.");
}
if($text=~/what bracers/i){
quest::say("For the bracers, I will require a eroded leather bracelet as well as three crushed flame emeralds.  Return to me when you find such things.");
}
if($text=~/what gloves/i){
quest::say("Protecting your hands is very important.  I can create some excellent protection for your hands if you bring me three crushed topaz and a pair of eroded leather gloves.");
}
if($text=~/what leggings/i){
quest::say("I may be able to craft a set of wondrous leggings from a set of old eroded leather leggings and three flawed sea sapphires.  It is amazing what you can do with a bit of magic.");
}
if($text=~/what boots/i){
quest::say("We use our feet so often, should not they be protected as well as any other portion of our bodies?  If you seek fine protection for your feet return to me with three pieces of crushed black marble and a pair of eroded leather boots."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Lorekeeper_Einar 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("I seek those who practice the art of dark magicks.  I seek those who call themselves necromancers.  Are you a necromancer?");
}
if($text=~/i am a necromancer/i){
quest::say("Excellent.  Are you sure enough of your skills to undertake my tasks?  If not, get out of my sight, weakling!");
}
if($text=~/what cap/i){
quest::say("For an enchanted head guard bring me a torn enchanted silk turban as well as three pieces of crushed flame opal.");
}
if($text=~/what robe/i){
quest::say("If you wish to have a fine robe, bring unto me a torn enchanted silk robe and three pristine emeralds.  Then you will receive a robe beyond your wildest dreams.");
}
if($text=~/what boots/i){
quest::say("Three crushed jaundice gems combined with torn enchanted silk boots would make a most interesting set of footwear.  The latent powers of the gems can be harnessed to create magical effects.");
}
if($text=~/what leggings/i){
quest::say("Three nephrite and a pair of torn enchanted silk leggings will net you a fine set of pantaloons.");
}
if($text=~/what gloves/i){
quest::say("If you seek gloves of great power, bring to me three crushed topaz and a pair of torn enchanted silk gloves.  I will use the power of the gems to imbue the gloves.");
}
if($text=~/what wristbands/i){
quest::say("An enchanted silk wristguard and three crushed onyx sapphires is all that I require to create an imbued wrist wrap of great power.  Seek out these items and return to me when you have acquired them.");
}
if($text=~/what sleeves/i){
quest::say("Bring unto me a set of torn enchanted silk sleeves as well as three flawed topaz.  With these in my possession I can create a set of enchanted sleeves the likes of which spellcasters like you dream of."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Lorekeeper_Zorik 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("The finest ore fresh from the mines I have! Take a look, why don't ye, $name. I'm sure I've got somethin' ye be needin'."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Nimren_Stonecutter 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Beyond these gates is the city of our people. Be respectful and obey our laws else I'll toss yer carcass into the pit meself."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Guard_Baldvin 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Good day, stranger. I would love to sit and chat with you but I don't much like gabbing it up with total strangers. I have other things to think on, Good day."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Hunter_Tarvin 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("What can I do fer ya? If yer lookin' fer a handout I got nothin for ya. Me darn husband wastes what little money we make on gamblin'. What a sucker! I don't know why I married him."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Mandla_Klolp 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("I wasn't always just a merchant, ye know. I used to work at the temple and spent most of my time in the study of ancient texts and arts. I actually learned a lot about the dark arts in those days.  Ye know. . . necromancy. Oh, I'd never touch the stuff, mind ye, but I'll bet I could make a fine set of plate fer shadowknights if'n I had the right materials.");
}
if($text=~/what materials/i){
quest::say("Glad to see ye're interested, $name. The materials would vary by the piece of armor o' course. I could probably forge a fine set of bracers, gauntlets, greaves, boots, armplates, a helm, or a breastplate.");
}
if($text=~/what bracers/i){
quest::say("For the bracers, I will require a corroded plate bracer and a set of three crushed flame emeralds.  Return to me if you happen to find these things in your travels.");
}
if($text=~/what gauntlets/i){
quest::say("Protecting your hands is very important.  I can forge protection for your hands if you bring me a pair of corroded plate gauntlets and three crushed topaz.");
}
if($text=~/what greaves/i){
quest::say("A set of corroded greaves might be salvageable if you were to find three flawed sea sapphires.  With the right techniques almost anything is possible.");
}
if($text=~/what armplates/i){
quest::say("Protection for your arms will come at the price of a set of corroded plate vambraces and three flawed emeralds.");
}
if($text=~/what helm/i){
quest::say("To create a piece of armor to protect your skull I will require three pieces of crushed coral as well as a corroded plate helmet.");
}
if($text=~/what breastplate/i){
quest::say("For the breastplate I will need a corroded breastplate and three flawless diamonds.  Once I have them in my possession it will not take long to craft a sturdy breastplate."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Dalgrim_Underbelly 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetins, $name, you look like a Wood Elf who knows the value of a good bow when ye see one. I'll let ye in on a li'l secret, the bow is the greatest of all weapons as it allows you to inflict maximum punishment on yer foes with minimum risk. How can ye possibly go wrong? Or better yet, if'n ye be a ranger. I can see my way clear to making you a coif, tunic, sleeves, bracer, gauntlets, leggings, or boots that I'm sure ye would enjoy.");
}
if($text=~/what coif/i){
quest::say("To create a piece of armor to protect your sensitive skull. I will require three pieces of crushed coral as well as a corroded chain coif.");
}
if($text=~/what tunic/i){
quest::say("To forge a spectacular chain tunic I will require three flawless diamonds and a corroded chain tunic.  With the gems and my skills I may be able to draw out some of its magical powers.");
}
if($text=~/what sleeves/i){
quest::say("Protection for your arms will come at the price of three flawed emeralds and a set of corroded chain sleeves.");
}
if($text=~/what bracer/i){
quest::say("For the bracers, I will require a corroded chain bracer as well as three crushed flame emeralds.  Return to me when you find such things, $name.");
}
if($text=~/what gauntlets/i){
quest::say("Protecting your hands is very important.  I can forge protection for your hands if you bring me a pair of corroded chain gauntlets and three crushed topaz.");
}
if($text=~/what leggings/i){
quest::say("A set of corroded chain leggings might be salvageable if you were to find three flawed sea sapphires.  With the right techniques and ingredients almost anything is possible.");
}
if($text=~/what boots/i){
quest::say("We use our feet so often, should not they be protected as well as any other portion of our bodies?  If you seek fine protection for your feet, return to me with three pieces of crushed black marble and a set of corroded chain boots."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Argash 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Uuuhh, this be a private room, me friend. Mayhap ye should leave before somethin' unfortunate happens."); }
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Travit_Conwil 

}}
