# 破壞者 (Destroyer) 資料包初始化
scoreboard objectives add destroyer.lvl dummy
scoreboard objectives add destroyer.timer dummy
scoreboard objectives add destroyer.broken dummy
scoreboard objectives add destroyer_info trigger
scoreboard objectives add destroyer_kit trigger
tellraw @a [{"text":"[破壞者資料包] ","color":"gold","bold":true},{"text":"已載入！輸入 ","color":"yellow"},{"text":"/trigger destroyer_kit","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/trigger destroyer_kit"}},{"text":" 領取全套測試工具，或輸入 ","color":"yellow"},{"text":"/trigger destroyer_info","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/trigger destroyer_info"}},{"text":" 查看等級範圍說明。","color":"yellow"}]
