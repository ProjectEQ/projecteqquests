sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings and salutations $name. I am Miltiades Tal`Azroth Crusader of Karana. I have spent all of my years here in Qeynos and gathered infinite knowledge from my teachers on my path to enlightenment. I have also started training new recruits to help them find their calling as a Holy Warrior of Karana. If you are a [Paladin of Karana] I might have some tasks for you to complete.");
}
if($text=~/paladin of karana/i){
quest::say("That is excellent news $name. As a Knight in training of Karana I would like to offer you a series of [tests] what will test your devotion to yourself and your god.");
}
if($text=~/what tests/i){
quest::say("I have put together a series of tests that will enable our new recruits to create their own armor. You will use a Rainkeepers Assembly Kit to combine assorted items that you will collect from both the hunting areas surround Qeynos and the city itself. Combining these magical items in your kit will create a material that you will place in a forge along with molds that I will present to you to create your armor. Are you ready to start [fashioning your materials]?");
}
if($text=~/fashioning your materials/i){
quest::say("Excellent $name. Please take this Rainkeepers Assembly Kit. Now for your materials you will fashion you will obviously need to know what items are used for what armor materials. Simply tell me what armor piece you [want] to create and I will present you with the recipe for that specific armor material. I can present you with the molds and recipes necessary for creating Rainkeeper [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates].");
quest::summonitem(17264); 
}
if($text =~ /I want to craft armguards/i) {
	quest::say("Here is your Rainkeepers Armguards Mold. To create your armguard material you will need to combine 2 Bricks of Crude Iron, 1 Snake Fang and 1 Burned Out Lightstone and 1 Fishing Bait in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Armguards of the Rainkeeper.");
quest::summonitem(22613);
}
if($text =~ /I want to craft boots/i) {
	quest::say("Here is your Rainkeepers Boot Mold. To create your boot material you will need to combine 3 Bricks of Crude Iron, 1 Patch of Gnoll Fur, 1 Giant Snake Fang and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boots of the Rainkeeper.");
quest::summonitem(22612);
}
if($text =~ /I want to craft bracers/i) {
	quest::say("Here is your Rainkeepers Bracer Mold. To create your bracer material you will need to combine 1 Brick of Crude Iron, 2 Gnoll Pup Scalps, 1 Patch of Gnoll Fur and 1 Water Flask in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Rainkeeper.");
quest::summonitem(22611);
 }
 if($text =~ /I want to craft a breastplate/i) {
	quest::say("Here is your Rainkeepers Breastplate Mold. To create your breastplate material you will need to combine 5 Bricks of Crude Iron, 1 Coyote Skull, 1 Golden Bandit Tooth, 1 Young Plains Cat Scalp, 1 Diseased Wolf Pelt and 1 Lightstone in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Breastplate of the Rainkeeper. Please come back to see me after you");
quest::summonitem(22616);
 }
 if($text =~ /I want to craft gauntlets/i) {
	quest::say("Here is your Rainkeepers Gauntlets Mold. To create your gauntlet material you will need to combine 3 Bricks of Crude Iron, 1 Chunk of Meat, 1 Shadow Wolf Paw, and 2 Giant Fire Beetle Eyes in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Rainkeeper.");
quest::summonitem(22615);
 }
 if($text =~ /I want to craft greaves/i) {
	quest::say("Here is your Rainkeepers Greaves Mold. To create your greaves material you will need to combine 4 Bricks of Crude Iron, 2 Ruined Lion Skins, 1 Spider Legs and 1 Bottle in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Greaves of the Rainkeeper.");
quest::summonitem(22614);
}
if($text =~ /I want to craft a helm/i) {
	quest::say("Here is your Rainkeepers Helm Mold. To create your helm material you will need to combine 2 Bricks of Crude Iron, 1 Patch of Gnoll Fur, 1 Large Snake Skin and 1 Fish Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Helm of the Rainkeeper.");
quest::summonitem(22610);
 }
 if($text =~ /What final favor/i) {
	quest::say("In the past I have sent some of my finest messengers to Qeynos Hills to deliver messages to the Sayers about current events in Qeynos. However the last few I have sent did not return so I began to look into what might have happened when I received word that the Bloodsabers had claimed responsibility for the slayings. I must ask that you bring me the head of a certain Bloodsaber who I think is [responsible] for the slayings.");
 }
 if($text =~ /Who is responsible for the slayings/i) {
	quest::say("I have reason to believe that Tovax Vmar is behind this, a dreaded necromancer that has been known to prowl the hills. Having Tovax dead will surely send a message to the Bloodsabers to tread lightly for their days are numbered. If you are able to find Tovax return to me his necklace along with 2 Enchanted Wisp Globes and I will reward you with a weapon suitable for a true knight of Karana.");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 27414 => 1, 27415 => 2)) {
  quest::summonitem(27488);
  quest::exp(500);
  quest::say("Good! Now the Bloodsabers know that Karana will not allow them to live forever! Here, take this to aid you.");    
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos  ID:1018 -- Miltiades_Tal`Azroth 
