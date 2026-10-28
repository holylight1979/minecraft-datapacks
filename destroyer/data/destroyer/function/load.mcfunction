# 破壞者 (Destroyer) 與全附魔神裝 (op_eq) 資料包初始化
scoreboard objectives add destroyer.lvl dummy
scoreboard objectives add destroyer.timer dummy
scoreboard objectives add destroyer.broken dummy
scoreboard objectives add destroyer_info trigger
scoreboard objectives add destroyer_kit trigger
scoreboard objectives add op_eq trigger
scoreboard objectives add op_eq.lvl dummy
scoreboard objectives add op_eq.qc dummy
scoreboard objectives add op_eq.ms dummy
tellraw @a [{"text":"[改造資料包] ","color":"gold","bold":true},{"text":"已載入！點此或輸入指令： ","color":"yellow"},{"text":"[領取全附魔神裝 Lv.255]","color":"light_purple","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/trigger op_eq set 255"}},{"text":" | ","color":"gray"},{"text":"[破壞者工具包]","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/trigger destroyer_kit"}},{"text":" | ","color":"gray"},{"text":"[查看說明]","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/trigger destroyer_info"}}]
