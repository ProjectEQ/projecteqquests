sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Hail $name. Know that only within these few passageways and rooms whose borders are marked by the symbol of the Circle of Unseen Hands can we speak freely of our organization and its undertakings. Neither the streets of the city above nor the sewers and catacombs are free of ears that would harm the Circle of Unseen Hands should they hear of our [secrets].");
 }
 if($text =~ /What secrets/i) {
	quest::say("The Circle has many secrets some of which only Hans may know. Our agents are all about, mingling among the common law abiding folk and working in all manner of profession. At one time we had a significant number of the Qeynos Guard allied to our organization but the loyal soldiers of Antonius Bayle IV has discovered and punished many of them. The ones that remain are hesitant at best to continue their association with us. You will need to exercise much caution within this city as you learn the ropes. I will help get you outfitted in some [gear] that you will find useful in our line of work.");
 }
 if($text =~ /what gear/i) {
	quest::say("Take this Curing Kit. With it you can assemble an outfit of light, flexible, and sturdy yet inconspicuous leather clothing to protect you from the perils of your job. The materials required will depend on the piece of clothing you desire to craft. Do you plan on crafting Sturdy Workmans [Gloves], Sturdy Workmans [Boots], a Sturdy Workmans [Bracer], a Sturdy Workmans [Cap], Sturdy Workmans [Leggings], Sturdy Workmans [Sleeves], or a Sturdy Workmans [Tunic]? Once you are suitably outfitted return to me and I will inform you of your [next job].");
        quest::summonitem(17125);  
 }
 if($text =~ /what boots/i) {
	quest::say("To craft Sturdy Workmans Boots you require two [silk thread], two ruined wolf pelts, two giant field rat whiskers, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
        quest::summonitem(19561);      
 }
  if($text =~ /what bracer/i) {
	quest::say("To craft an Sturdy Workmans Bracer you require a [silk thread], a ruined wolf pelt, and a giant field rat whiskers. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
        quest::summonitem(19558);
 }
  if($text =~ /what cap/i) {
 	quest::say("To craft a Sturdy Workmans Cap you require two [silk thread], a ruined wolf pelt, a large myotis bat fur, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Coif Pattern.");
        quest::summonitem(19555);
 }
  if($text =~ /what gloves/i) {
 	quest::say("To craft Sturdy Workmans Gloves you require two [silk thread], a ruined wolf pelt, two giant field rat whiskers, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
        quest::summonitem(19559);
 }
  if($text =~ /what leggings/i) {
 	quest::say("To craft Sturdy Workmans Leggings you require three [silk thread], a low quality wolf pelt, two large myotis bat furs, and a giant king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
        quest::summonitem(19560);
 }
  if($text =~ /what sleeves/i) {
 	quest::say("To craft Sturdy Workmans Sleeves you require two [silk thread], a low quality wolf pelt, two large myotis bat furs, and a giant king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
        quest::summonitem(19557);
 }
  if($text =~ /what tunic/i) {
 	quest::say("To craft a Sturdy Workmans Tunic you require four [silk thread], a medium quality wolf pelt, a giant myotis bat fur, and a giant king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
        quest::summonitem(19556);
 }
  if($text =~ /what next job/i) {
 	quest::say("A message between two of our agents was recently intercepted by a Qeynos Guardsman. The message is encoded in thieves cant but should the guards eventually decode it we would expect trouble. Guard Gregor, the guard who currently is in possession of the message is out patrolling somewhere in the West Karanas. Find this guard and recover the message. Bring it back to me when you have done so.");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19942 => 1)) {
    quest::say("Excellent work!"); #not actual text
    quest::summonitem(20266);
    quest::ding();
  }
  
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}