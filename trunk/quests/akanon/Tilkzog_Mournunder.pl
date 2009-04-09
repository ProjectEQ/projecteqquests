sub EVENT_SAY {
  if ($text=~/silk thread/i) {
    quest::say("To create silk thread, combine 2 spiderling silk inside a tailoring kit.");
  }
  if ($text=~/Hail, Tilkzog Mournunder/i) {
    quest::say("Hail $name. I am Tilkzog Mournunder, Necromancer of the Dark Reflection. It is my duty here to assist not only the young necromancers of the Dark Reflection but also those wizards, magicians, and enchanters that have been called into the service of the Plague Bringer. I will aid you in obtaining an outfit of [durable clothing] suitable for a young sorcerer of the Dark Reflection. Once you have been adequately outfitted for venturing beyond our homeland in service of the Plague Bringer return to me and I will assist you in obtaining a [staff of dark reflections].");
  }
  if ($text=~/staff of dark reflections/i) {
    quest::say("The Dark Reflection has many enemies even within our home of Ak'Anon and the surrounding Steamfont Mountains. Many fear and oppose the beliefs that grant us our vision and powers. A wizard of the Eldrich Collective by the name of Winex Kloktik has been aiding members of the Deep Muses hunt and slay those loyal to Bertoxxulous and the Dark Reflection. Seek Winex Kloktik and eliminate her. When you have completed this task bring me Winex's Staff.");
  }
  if ($text=~/durable clothing/i) {
    quest::say("The sorcerous servants of Bertoxxulous, the Plague Bringer, are privileged with the sight of the Dark Reflection. This gift enlightens us to the powers of disease, decay, death, and destruction. Forces that are misunderstood and feared by the majority of Norrath, including our fellow gnomes of Ak'Anon. These forces are the catalyst of change, cleansing Norrath of the old and weak, and we are the agents of this catalyst. However, before you will be of much use to the Dark Reflection you must gather the [components] necessary for the outfit that will protect and aid you in your duties.");
  }
  if ($text=~/components/i) {
    quest::say("You will need this Curing Kit and varying components depending on the piece of clothing you wish to fabricate. Do you desire to craft a [plague sorcerer cap], [plague sorcerer wristband], [plague sorcerer gloves], [plague sorcerer boots], [plague sorcerer sleeves], [plague sorcerer pantaloons], or [plague sorcerer robe]?");
    quest::summonitem(17125);
  }
  if ($text=~/plague sorcerer boots/i) {
    quest::say("To craft Plague Sorcerer Boots you require two [silk thread], two ebon drakeling bile, and two large rat pelts. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
    quest::summonitem(19561);
  }
  if ($text=~/plague sorcerer cap/i) {
    quest::say("To craft a Plague Sorcerer Cap you will require two [silk thread], ebon drakeling bile, and a grikbar kobold scalp. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
    quest::summonitem(19555);
  }
  if ($text=~/plague sorcerer gloves/i) {
    quest::say("To craft Plague Sorcerer Gloves you require two [silk thread], ebon drakeling bile, and two yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
    quest::summonitem(19559);
  }
  if ($text=~/plague sorcerer pantaloons/i) {
    quest::say("To craft Plague Sorcerer Pantaloons you require two [silk thread], young ebon drake bile, and four yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
    quest::summonitem(19560);
  }
  if ($text=~/plague sorcerer robe/i) {
    quest::say("To craft a Plague Sorcerer Robe you will require three [silk thread], ebon drake bile, a giant rat pelt, and two yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
    quest::summonitem(19556);
  }
  if ($text=~/plague sorcerer sleeves/i) {
    quest::say("To craft Plague Sorcerer Sleeves you require two [silk thread], young ebon drake bile, and three yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
    quest::summonitem(19557);
  }
  if ($text=~/plague sorcerer wristband/i) {
    quest::say("To craft a Plague Sorcerer Wristband you require a [silk thread], ebon drakeling bile, and a large rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
    quest::summonitem(19558);
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10994 => 1)) {
    quest::say("You have done well to bring Winex's staff to me, $name. Here is your reward for dealing with that meddlesome fool.");
    quest::summonitem(11081);
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}