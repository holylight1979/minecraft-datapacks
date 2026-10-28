scoreboard players set @s destroyer_info 0
tellraw @s [{"text":"========== [自訂改造資料包說明] ==========","color":"gold","bold":true}]
tellraw @s [{"text":"【1. 破壞者 (Destroyer) 範圍挖掘附魔】","color":"yellow","bold":true}]
tellraw @s [{"text":"• 破壞者 I ~ V：","color":"white"},{"text":"3×1×1 → 3×3×1 → 3×3×2 → 3×3×3 → 5×5×3（按住 Shift 潛行可暫時切換回單格挖掘）","color":"gray"}]
tellraw @s [{"text":"【2. 全附魔神裝指令 (op_eq)】","color":"light_purple","bold":true}]
tellraw @s [{"text":"• 輸入 ","color":"white"},{"text":"/trigger op_eq set <1~255>","color":"green","underlined":true,"click_event":{"action":"suggest_command","command":"/trigger op_eq set 255"}},{"text":" 即可領取指定附魔等級 (1~255) 的全套獄髓神裝、武器與破壞者工具！","color":"white"}]
