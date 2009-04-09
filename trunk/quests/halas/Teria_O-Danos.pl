sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Good day to ye! Ye look a wee bit hungrry.  I sell many fine foods. Please have a look. Might I suggest the [lion roast]? It is a wee bit expensive, but well worth it.");
}
if($text=~/what lion roast/i){
quest::say("The lion roast is quite good. Tis me specialty. Ah marinate the lion meat in mammoth fat fer two days before roasting it. Lion meat isn't common around here.  I'll purchase what I can from strangers but I rely mostly on shipments from the Plains o' Karana.  I'm presently searching fer someone to [pick up me lion meat shipment].");
}
if($text=~/i will pick you up lion meat shipment/i){
quest::say("It'd be grand o' ye to pick up me lion meat shipment. Ye must travel to the Plains o' Karana. Search fer a Northman fishing village. It should be Clan McMannus. Speak with the chieftain, Einhorst. Tell him ye're there to [pick up the lion meat shipment for Halas]. When ye return, I'll pay ye at least three gold.  I look forward to yer return.");
}
if($text=~/i will pick me up lion meat shipment/i){
quest::say("It'd be grand o' ye to pick up me lion meat shipment. Ye must travel to the Plains o' Karana. Search fer a Northman fishing village. It should be Clan McMannus. Speak with the chieftain, Einhorst. Tell him ye're there to [pick up the lion meat shipment for Halas]. When ye return, I'll pay ye at least three gold.  I look forward to yer return."); }
}
sub EVENT_ITEM { 
if($itemcount{12221} == 1){
quest::say("Thank ye for picking up this shipment. Here is your payment.");
quest::exp(1000);
quest::givecash(0,0,3,0); }
}
#END of FILE Zone:halas  ID:29035 -- Teria_O`Danos 

