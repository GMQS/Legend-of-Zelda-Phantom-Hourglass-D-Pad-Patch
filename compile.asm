.nds
.relativeinclude on
.include "macros.asm"

;edit the ARM9
;uncompressed sizes: US 0x5CF78, EU 0x5CFD8, JP 0x5CE78
;RAM ranges: US 0x02004000-0x02060F77, EU 0x02004000-0x02060FD7, JP 0x02004000-0x02060E77
.ropen "arm9/arm9.bin", "arm9/arm9.bin", "arm9/arm9.bin", \
       "temp/arm9.bin", "temp/arm9.bin", "temp/arm9.bin", \
        0x02004000, 0x02004000, 0x02004000
	;advance dialog with A/B in addition to tap - US, EU, JP offsets
	.rorg 0x0203A474, 0x0203A4B8, 0x0203A224
	bl dialog_advance_check_keys

	;stops game from clearing the pressed buttons during boss battles - US, EU, JP offsets
	.rorg 0x0202ADEC, 0x0202AE04, 0x0202ADBC
	rb 0x0202ADF8,  0x0202AE10, 0x0202ADC8

	;ARM9 "freespace" - US, EU, JP offsets
	.rorg 0x02058608, 0x02058664, 0x02058318
		.area 0x4B4
			.include "util.asm"
			.include "movement/movement_arm9_freespace.asm"
			.include "interact/interact_arm9_freespace.asm"
			.include "attack/attack_arm9_freespace.asm"
			.include "dialog/dialog_arm9_freespace.asm"
			.pool
		.endarea
.close

;edit the overlay0000 (contains code for movement with touchscreen)
;uncompressed sizes: US 0x71F60, EU 0x71F60, JP 0x71F60
;RAM ranges: US 0x02077360-0x020E92C0, EU 0x020773C0-0x020E9320, JP 0x02077060-0x020E8FC0
.ropen "arm9/overlay_0000.bin", "arm9/overlay_0000.bin", "arm9/overlay_0000.bin", \
       "temp/overlay_0000.bin", "temp/overlay_0000.bin", "temp/overlay_0000.bin", \
       0x02077360, 0x020773C0, 0x02077060
	.include "interact/interact_overlay0000.asm"
	.include "attack/attack_overlay0000.asm"
	.include "movement/movement_overlay0000.asm"
.close

;edit the overlay0021/20 (contains checks for key inputs for quick menus)
;US uses overlay21, EU and JP use overlay20
;uncompressed sizes: US 0xC900, EU 0xC900, JP 0xC900
;RAM ranges: US 0x02112BA0-0x0211F4A0, EU 0x02112C20-0x0211F520, JP 0x021121A0-0x0211EAA0
.ropen "arm9/overlay_0021.bin", "arm9/overlay_0020.bin", "arm9/overlay_0020.bin", \
       "temp/overlay_0021.bin", "temp/overlay_0020.bin", "temp/overlay_0020.bin", \
       0x02112BA0, 0x02112C20, 0x021121A0
	.include "movement/movement_overlay0021.asm"
.close

;edit the overlay0029 (contains checks for key inputs for quick menus)
;uncompressed sizes: US 0x3B560, EU 0x3B580, JP 0x3B560
;RAM ranges: US 0x0211F5C0-0x0215AB20, EU 0x0211F640-0x0215ABC0, JP 0x0211EAE0-0x0215A040
.ropen "arm9/overlay_0029.bin", "arm9/overlay_0029.bin", "arm9/overlay_0029.bin", \
       "temp/overlay_0029.bin", "temp/overlay_0029.bin", "temp/overlay_0029.bin", \
       0x0211F5C0, 0x0211F640, 0x0211EAE0
	.include "movement/movement_overlay0029.asm"
.close
;eof
