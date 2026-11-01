package tw.holylight.creativeinstantstop.mixin;

import net.minecraft.client.player.ClientInput;
import net.minecraft.client.player.LocalPlayer;
import net.minecraft.world.phys.Vec2;
import net.minecraft.world.phys.Vec3;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

/**
 * After each client tick of player movement, if the player is in creative-style flight
 * and no movement key is held, kill the leftover velocity so flight stops instantly.
 */
@Mixin(LocalPlayer.class)
public abstract class LocalPlayerMixin {
	@Shadow public ClientInput input;

	@Inject(method = "aiStep", at = @At("TAIL"))
	private void creativeInstantStop$brake(CallbackInfo ci) {
		LocalPlayer self = (LocalPlayer) (Object) this;
		if (!self.getAbilities().flying || self.isPassenger() || self.isFallFlying()) return;

		Vec2 move = this.input.getMoveVector();
		boolean noHorizontal = move.x == 0.0F && move.y == 0.0F;
		boolean noVertical = !this.input.keyPresses.jump() && !this.input.keyPresses.shift();

		Vec3 v = self.getDeltaMovement();
		double x = noHorizontal ? 0.0 : v.x;
		double y = noVertical ? 0.0 : v.y;
		double z = noHorizontal ? 0.0 : v.z;
		if (x != v.x || y != v.y || z != v.z) {
			self.setDeltaMovement(x, y, z);
		}
	}
}
