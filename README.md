# ⛏️ Minecraft Java 26.3 資料包專案 (`新的世界`)

本儲存庫管理 Minecraft Java 版（版本 `26.3`，Data Pack Format `121`）的自訂資料包（Datapacks）改造專案。

---

## 📦 目前收錄資料包

### 1. 破壞者附魔 (`destroyer`)
- **附魔 ID**：`destroyer:destroyer`
- **顯示名稱**：`破壞者` (Destroyer)
- **最高等級**：`V`（共 5 級）
- **適用工具**：所有挖掘工具（`#minecraft:enchantable/mining`：鎬、鏟、斧、鋤、剪刀，支援獄髓、鑽石、鐵、銅、金、石、木製工具）
- **取得方式**：
  - 附魔台直接附魔、村民交易、鐵砧結合附魔書
  - 指令直接附魔：`/enchant @s destroyer:destroyer <1~5>`
  - 一鍵領取測試工具包（無須 OP 權限）：`/trigger destroyer_kit`
  - 查看遊戲內說明（無須 OP 權限）：`/trigger destroyer_info`

#### 📐 等級與挖掘範圍（寬 × 高 × 深）
隨著「破壞者」等級提升，挖掘範圍會從單格（1×1×1）依序擴展 **寬度（左右）**、**高度（上下）** 與 **深度（前後）**，並自動依據玩家的 **水平方位與仰角（平視、往下挖、往上挖）** 智慧轉向：

| 等級 | 階段特色 | 挖掘範圍 (寬 × 高 × 深) | 單次最大方塊數 | 說明 |
| :--- | :--- | :---: | :---: | :--- |
| **破壞者 I** | 寬度擴展 | **3 × 1 × 1** | 3 格 | 左右橫向擴展為 3 格寬 |
| **破壞者 II** | 高度擴展 | **3 × 3 × 1** | 9 格 | 擴展為 3×3 平面截面，適合開鑿標準隧道 |
| **破壞者 III** | 深度推進 | **3 × 3 × 2** | 18 格 | 往挖掘方向推進 2 格深度 |
| **破壞者 IV** | 立方破壞 | **3 × 3 × 3** | 27 格 | 完整 3×3×3 立方體挖掘 |
| **破壞者 V** | 終極巨坑 | **5 × 5 × 3** | 75 格 | 寬 5 × 高 5 × 深 3 大型隧道開鑿 |

#### ✨ 核心機制與安全防護
- **潛行精準模式**：按住 `Shift`（潛行）挖掘時，會自動暫停範圍破壞、切換回 **1×1×1 單格精準挖掘**，避免拆壞基地建築或紅石機關。
- **完整支援工具附魔**：範圍破壞使用原版 `loot spawn ... mine ~ ~ ~ mainhand` 機制，主手工具上的 **絲綢之觸（Silk Touch）** 與 **幸運（Fortune）** 會完整套用到範圍內的每一格方塊！
- **防呆保護清單 (`#destroyer:protected`)**：範圍挖掘絕對不會破壞基岩、屏障、指令方塊、終界傳送門框、生怪磚、試煉生怪磚、寶庫、強化深板岩，也不會誤拆 **儲物箱、陷阱箱、終界箱、木桶、界伏盒、熔爐、漏斗、烽火台** 等重要容器與方塊。
- **生存與創造雙模式支援**：生存模式透過 `minecraft:hit_block` 與方塊破壞偵測精準定位；創造模式亦支援視線追蹤範圍挖掘。

---

## 🛠️ 常用遊戲內指令

```mcfunction
# 重新載入資料包
/reload

# 領取 破壞者 I ~ V 全套獄髓鎬 + 附魔書（一般玩家可用）
/trigger destroyer_kit

# 在聊天室顯示各等級範圍說明（一般玩家可用）
/trigger destroyer_info

# 為手上拿著的工具直接附魔（需開啟作弊/OP）
/enchant @s destroyer:destroyer 1
/enchant @s destroyer:destroyer 2
/enchant @s destroyer:destroyer 3
/enchant @s destroyer:destroyer 4
/enchant @s destroyer:destroyer 5

# 單獨領取指定等級的測試獄髓鎬（需開啟作弊/OP）
/function destroyer:give_lv1
/function destroyer:give_lv2
/function destroyer:give_lv3
/function destroyer:give_lv4
/function destroyer:give_lv5
```

---

## 📁 目錄結構

```text
datapacks/
├── README.md
└── destroyer/
    ├── pack.mcmeta
    └── data/
        ├── minecraft/
        │   └── tags/
        │       ├── enchantment/
        │       │   ├── in_enchanting_table.json
        │       │   ├── non_treasure.json
        │       │   └── tooltip_order.json
        │       └── function/
        │           ├── load.json
        │           └── tick.json
        └── destroyer/
            ├── enchantment/
            │   └── destroyer.json
            ├── predicate/
            │   └── is_sneaking.json
            ├── tags/
            │   └── block/
            │       ├── air_or_fluid.json
            │       └── protected.json
            └── function/
                ├── load.mcfunction
                ├── server_tick.mcfunction
                ├── tick_player.mcfunction
                ├── on_hit_block.mcfunction
                ├── place_target_marker.mcfunction
                ├── trigger_at_marker.mcfunction
                ├── detect_level.mcfunction
                ├── break_by_direction.mcfunction
                ├── break_single.mcfunction
                ├── show_info.mcfunction
                ├── give_kit.mcfunction
                ├── give_lv1.mcfunction ~ give_lv5.mcfunction
                ├── raycast_creative_step1.mcfunction ~ step18.mcfunction
                ├── dir/
                │   └── north, south, west, east, down_ns, down_ew, up_ns, up_ew.mcfunction
                └── aoe/
                    └── <dir>_lv1.mcfunction ~ <dir>_lv5.mcfunction
```

---

## 📝 改版紀錄 (Changelog)

### v1.0.0 (2026-10-28)
- 新增 **「破壞者 (Destroyer)」(`destroyer:destroyer`)** 自訂挖掘附魔（支援 Minecraft Java `26.3` / `pack_format 121`）。
- 實作 Lv.1 (`3×1×1`)、Lv.2 (`3×3×1`)、Lv.3 (`3×3×2`)、Lv.4 (`3×3×3`)、Lv.5 (`5×5×3`) 五階段寬、高、深範圍擴展。
- 實作 6 方向視角（東西南北 + 上下仰角）自動轉向演算法。
- 加入 Shift 潛行單格精準挖掘切換、絲綢之觸/幸運掉落支援、容器與不可破壞方塊保護機制。
- 新增 `/trigger destroyer_kit` 與 `/trigger destroyer_info` 便捷指令。
