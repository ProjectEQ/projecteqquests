sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Good day to ye! Ye look a wee bit hungrry. I sell many fine foods. Please have a look. Might I suggest the [lion roast]? It is a wee bit expensive, but well worth it.");
  }
  if($text=~/lion roast/i) {
    quest::say("The lion roast is quite good. Tis me specialty. Ah marinate the lion meat in mammoth fat fer two days before roasting it. Lion meat isn't common around here. I'll purchase what I can from strangers but I rely mostly on shipments from the Plains o' Karana. I'm presently searching fer someone to [pick up me lion meat shipment].");
  }
  if($text=~/lion meat shipment/i) {
    quest::say("It'd be grand o' ye to pick up me lion meat shipment. Ye must travel to the Plains o' Karana. Search fer a Northman fishing village. It should be Clan McMannus. Speak with the chieftain, Einhorst. Tell him ye're there to [pick up the lion meat shipment for Halas]. When ye return, I'll pay ye at least three gold. I look forward to yer return.");
  }
  if($text=~/lion delight/i) {
    quest::say("Oh, yes. A wonderful tasting dish. Unfortunately, I need more lion meat to make that dish. Might I instead suggest the [lion roast]?"); #Text made up
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13961 => 1)) { #Lion Meat Shipment
    quest::say("Ye've returned!! How wonderful! The people o' Halas thank ye! It isn't often we get to indulge ourselves in the delicacies o' warmer climates. Here ye go, me friend. Ye've completed the delivery in good time. I hope ye deliver more often. Here, try some of me new creation.. [Lion Delight].");
    quest::summonitem(12221); #Lion Delight
    quest::givecash(0,3,0,0); #Gold x 3
    quest::faction(213,5); #Merchants of Halas
    quest::faction(361,5); #Wolves of the North
    quest::faction(294,5); #Shamen of Justice
    quest::exp(1000);
    quest::ding();
  }
  else {
    quest::say("I have no use for that $name. You may take it back.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:halas  ID:29035 -- Teria_O`Danos