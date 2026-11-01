# Auto LAN for Switch (Geyser)

Client-side Fabric mod for Minecraft 26.3 (Fabric Loader 0.20.1+).
About 2 seconds after any singleplayer world loads, it opens the world to LAN on port **25565**
with **online mode OFF** and cheats allowed for guests, so Geyser Standalone (auth-type: offline)
can bring Bedrock / Switch players in without a Java account.

Build: `./gradlew build` -> `build/libs/auto-lan-switch-1.0.0.jar` -> copy into `.minecraft/mods`.
