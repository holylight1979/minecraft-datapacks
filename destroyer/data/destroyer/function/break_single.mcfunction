execute if block ~ ~ ~ #destroyer:protected run return 0
execute unless entity @s[gamemode=creative] run loot spawn ~ ~ ~ mine ~ ~ ~ mainhand
particle minecraft:crit ~ ~ ~ 0.25 0.25 0.25 0.05 2
setblock ~ ~ ~ minecraft:air
scoreboard players add @s destroyer.broken 1
