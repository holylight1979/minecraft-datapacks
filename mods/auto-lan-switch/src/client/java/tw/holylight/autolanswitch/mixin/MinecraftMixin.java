package tw.holylight.autolanswitch.mixin;

import net.minecraft.client.Minecraft;
import net.minecraft.client.server.IntegratedServer;
import net.minecraft.network.chat.Component;
import net.minecraft.server.MinecraftServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Unique;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@Mixin(Minecraft.class)
public abstract class MinecraftMixin {
	@Unique private static final Logger LOG = LoggerFactory.getLogger("auto_lan_switch");
	@Unique private static final int PORT = 25565;
	@Unique private IntegratedServer autoLanSwitch$handled;
	@Unique private int autoLanSwitch$delay;

	@Inject(method = "tick", at = @At("TAIL"))
	private void autoLanSwitch$tick(CallbackInfo ci) {
		Minecraft mc = (Minecraft) (Object) this;
		IntegratedServer server = mc.getSingleplayerServer();
		if (server == null || mc.player == null || mc.getConnection() == null) {
			autoLanSwitch$delay = 0;
			if (server == null) autoLanSwitch$handled = null;
			return;
		}
		if (server == autoLanSwitch$handled) return;
		if (++autoLanSwitch$delay < 40) return; // ~2s after joining the world
		autoLanSwitch$handled = server;
		if (server.isPublished()) {
			server.setUsesAuthentication(false);
			return;
		}
		boolean ok = server.publishServer(MinecraftServer.MultiplayerScope.LAN, true, PORT);
		server.setUsesAuthentication(false); // after publish: overrides OfflineLAN's toggle default
		LOG.info("auto_lan_switch: publish LAN port {} -> {}, online mode off", PORT, ok);
		mc.player.sendSystemMessage(Component.literal(ok
				? "[自動區網] 已在連接埠 25565 開放區網（離線模式，Switch 可加入）"
				: "[自動區網] 開放區網失敗（25565 可能被占用）"));
	}
}
