sub EVENT_SAY {
 if($text =~ /Hail/i) {
  quest::say('May Karana guide your strengths.  Are you a [citizen of Qeynos] or a visitor?');
 }
 #Same dialogue for both : 'I am a citizen' and 'I am not a citizen'
  if($text =~ /citizen of Qeynos/i) {
  quest::say('Then I would urge you to attend daily services in the Temple of Thunder.  You are a [member of Thunder] are you not?  Or maybe I am mistaken and you are just [lost].');
 }
  if($text =~ /lost/i) {
  quest::say('Then study and spread the words of Karana the Rainkeeper.  May all the storms in your heart be controlled by the Rainkeeper.  You are young to the world just as [Cheslin] is.');
 }
  if ($text=~/member of thunder/i && $faction == 4) {
  quest::say("I welcome you. Karana cares for all of His flock. He bestows a touch of His power upon the souls of the Clerics and Paladins of our temple. We look after His flock. Speaking of which, I require the assistance of a young paladin to [deliver provisions to needy members].");
 }
 if ($text=~/ready/i && $faction != 4) {
   quest::say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
 }
 
  if($text =~ /karana bandit/i) {
  quest::say('In the Plains of Karana can be found the [Karana Bandits].  They plague our followers and dare to use the name of the Rainkeeper as title.  For this, Karana commands their deaths.  I have a bounty for every returned Bandit Sash, collectible by members only.  For clerics, Gehna has a bounty on Binder Spectacles.');
 }
  if($text =~ /Cheslin/i) {
  quest::say('My son, Cheslin, is currently in training to be a Qeynos Guard.  I fear it was not his calling.  He is not quite in our realm of reality.  He spent too many years of playing games of warriors and dragons.  He will be doing his first patrols in Qeynos Hills this week.  If you are near there, I would appreciate it if you would watch and see him safely through his first patrols.  Tell him I sent you.');
 }
 if ($text=~/deliver provisions to needy members./i) {
   quest::say("Good show!! Here you are, young knight. Take these blankets to any resident who desires warmth. Ask them if they are followers of Karana, then ask if they require temple blankets. Be careful, the plains are quite dangerous for a young knight.");
   quest::summonitem(12102);
 }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 12100 => 1)) {
   quest::say("Good work $class. The Karana Bandits have been plaguing the Rainkeepers flock for some time.  Take this as a small reward for your devotion.  Continue the fight against the Karana Bandits.  Ahh... I wish [Cheslin] was equally as skilled.");
   quest::exp(2000);
   #random bronze item reward
quest::summonitem(quest::ChooseRandom(7012,7013,7014,7016,4204,4201,4202,4203,4204,4205,4206,4207,4208,4209,4210,4211,4212,4213,4214,4215,4216,4217,4218,4219,4220,4221,4222,4223,4224,4225,5035,5036,6019,6021));
   # 1 gold, 12 silver
   quest::givecash("0","12","1","0");
   # Knights of Thunder
   quest::faction("183","10");
   # Blood Sabers
   quest::faction("21","-10");
   # Priests of Life
   quest::faction("257","10");
   # Guards of Qeynos
  quest::faction("135","10");
 }
else
{
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
}
#updated by TheBlaz