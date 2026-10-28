kill @e[type=minecraft:marker,tag=destroyer_target,distance=..8]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["destroyer_target"]}
execute align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=minecraft:marker,tag=destroyer_target,distance=..0.5,limit=1] destroyer.timer 40
