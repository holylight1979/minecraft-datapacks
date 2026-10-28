scoreboard players set @s destroyer_kit 0
function destroyer:give_lv1
function destroyer:give_lv2
function destroyer:give_lv3
function destroyer:give_lv4
function destroyer:give_lv5
give @s minecraft:enchanted_book[minecraft:stored_enchantments={"destroyer:destroyer":5}] 1
tellraw @s [{"text":"[破壞者] ","color":"gold","bold":true},{"text":"已發放 破壞者 I ~ V 獄髓鎬與 破壞者 V 附魔書！","color":"green"}]
