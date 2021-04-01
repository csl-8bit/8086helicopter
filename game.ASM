.model small
.stack 64
.data
	seed   dw 13666
	two    dw 2
	ten    dw 10
	fifty  dw 50
	file_name    DB "high.txt",0             
	file_handler DW ?
	input_name        LABEL BYTE
	input_name_max    DB    11
	input_name_act    DB    ?
	high_score_player DB    11 DUP(' ')
	front_screen_page_number db 0
	back_screen_page_number db 1
	char_for_print_as_ascii db ?
	row_for_print_as_ascii db ?
	col_for_print_as_ascii db ?
	;helicopter image
	heli_image_1   db 00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h ;19x9
				   db 08h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,00h,00h,00h,00h,00h,00h
				   db 04h,04h,04h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,03h,03h,00h,00h,00h
				   db 00h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,03h,03h,03h,03h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,08h,08h,08h,03h,03h,03h,03h,03h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,03h,03h,03h,03h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,06h,00h,00h,00h,00h,06h,00h,06h,00h,00h,06h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,06h,06h,06h,06h,00h

	heli_image_2   db 00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h ;19x9
				   db 0ch,0ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0ch,00h,00h,00h,00h,00h,00h
				   db 0ch,07h,0ch,00h,00h,00h,00h,00h,00h,00h,00h,0ch,0ch,0ch,08h,08h,00h,00h,00h
				   db 00h,0ch,0ch,0ch,07h,0ch,0ch,0ch,0ch,0ch,0ch,0ch,0ch,08h,08h,08h,08h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,0ch,0ch,0ch,08h,08h,08h,08h,08h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,07h,08h,08h,08h,08h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,07h,07h,07h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,04h,00h,00h,00h,00h,04h,00h,04h,00h,00h,04h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,04h,04h,00h
				   
	heli_image_3   db 00h,00h,00h,00h,00h,00h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h ;19x9
				   db 07h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,05h,00h,00h,00h,00h,00h,00h
				   db 06h,07h,06h,00h,00h,00h,00h,00h,00h,00h,00h,05h,05h,05h,08h,08h,00h,00h,00h
				   db 00h,06h,05h,06h,05h,05h,05h,05h,05h,06h,05h,06h,05h,08h,08h,08h,08h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,05h,06h,08h,08h,08h,08h,08h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,05h,06h,08h,08h,08h,08h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,06h,06h,06h,06h,06h,00h,00h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,07h,00h,00h,00h,00h,07h,00h,07h,00h,00h,07h
				   db 00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,07h,07h,07h,07h,07h,07h,07h,07h,00h
				   
    fuel_image     db 00h,00h,00h,00h,00h,00h,07h,07h,07h     ; 12x9
				   db 00h,00h,00h,00h,00h,07h,07h,07h,00h
				   db 00h,00h,0ch,0ch,07h,07h,07h,00h,00h
				   db 00h,0ch,0ch,0ch,0ch,07h,0ch,00h,00h
				   db 0ch,0ch,0ch,0ch,0ch,0ch,0ch,0ch,00h
				   db 0ch,0ch,00h,0ch,0ch,0ch,00h,0ch,0ch
				   db 0ch,0ch,0ch,00h,0ch,00h,0ch,0ch,0ch
				   db 0ch,0ch,0ch,0ch,00h,0ch,0ch,0ch,0ch
				   db 0ch,0ch,0ch,00h,0ch,00h,0ch,0ch,0ch
				   db 0ch,0ch,00h,0ch,0ch,0ch,00h,0ch,0ch
				   db 0ch,0ch,0ch,0ch,0ch,0ch,0ch,0ch,0ch
				   db 00h,0ch,0ch,0ch,0ch,0ch,0ch,0ch,00h
				   
	fire_image     db 00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h  ;17x17
				   db 00h,00h,00h,04h,04h,0eh,0eh,0eh,0eh,0eh,0eh,0eh,04h,04h,00h,00h,00h
				   db 00h,00h,04h,0eh,0eh,0eh,0eh,0eh,00h,0eh,0eh,0eh,0eh,0eh,04h,00h,00h
				   db 00h,04h,0eh,0eh,0eh,0eh,0eh,0eh,00h,00h,0eh,0eh,0eh,0eh,0eh,04h,00h
				   db 00h,04h,0eh,0eh,0eh,0eh,0eh,0eh,00h,00h,00h,0eh,0eh,0eh,0eh,04h,00h
				   db 04h,0eh,0eh,0eh,0eh,0eh,0eh,00h,00h,00h,00h,0eh,0eh,0eh,0eh,0eh,04h
				   db 04h,0eh,0eh,0eh,0eh,0eh,00h,00h,00h,00h,00h,00h,0eh,0eh,0eh,0eh,04h
				   db 04h,0eh,0eh,00h,0eh,00h,00h,00h,00h,0eh,00h,00h,0eh,00h,0eh,0eh,04h
				   db 04h,0eh,0eh,00h,00h,00h,00h,00h,0eh,00h,00h,00h,00h,00h,0eh,0eh,04h
				   db 04h,0eh,0eh,0eh,00h,00h,00h,0eh,0eh,00h,00h,00h,00h,0eh,0eh,0eh,04h
				   db 04h,0eh,0eh,0eh,00h,00h,00h,0eh,0eh,00h,0eh,00h,0eh,0eh,00h,0eh,04h
				   db 04h,0eh,00h,00h,0eh,00h,00h,00h,0eh,0eh,0eh,00h,00h,00h,00h,0eh,04h
				   db 00h,04h,0eh,00h,00h,00h,0eh,0eh,0eh,0eh,0eh,00h,00h,00h,0eh,04h,00h
				   db 00h,04h,0eh,0eh,00h,00h,00h,0eh,0eh,0eh,00h,00h,00h,0eh,0eh,04h,00h
				   db 00h,00h,04h,0eh,0eh,0eh,00h,00h,00h,00h,00h,0eh,0eh,0eh,04h,00h,00h
				   db 00h,00h,00h,04h,04h,0eh,0eh,0eh,0eh,0eh,0eh,0eh,04h,04h,00h,00h,00h
				   db 00h,00h,00h,00h,00h,04h,04h,04h,04h,04h,04h,04h,00h,00h,00h,00h,00h
				   		   
	;settings variable (if want change setting parameter, go to 'initialize_variable' proc)
	heli_x   		dw ?
	heli_y   		dw ?
	heli_fall_speed dw ?
	heli_jump_speed dw ?
	heli_width 		dw ?
	heli_height     dw ?
	heli_image_start_address dw ?

	top_cave_pos_y     db 320 dup(?)
	bottom_cave_pos_y  db 320 dup(?)
	cave_velocity      dw ?
	cave_gradient      db ?
	cave_color         db 0FH
	.cave_ending       dw ?
	cave_direction     db ? ;0 = down, 1 = up
	high_score    dw ?
	current_score dw 0
	fuel_count  db ?
	loop_block_count db ?
	lose_fuel_score_mark dw ?
	
	fuel_pos_y dw ?
	fuel_pos_x dw ?
	fuel_image_width dw ?
	fuel_image_height dw ?
	fuel_exist db 1
	
	fire_pos_y dw ?
	fire_pos_x dw ?
	fire_image_width dw ?
	fire_image_height dw ?
	
	fuel_block_pos_x dw ?
	fuel_block_pos_y dw ?
	;string message
	.interface_msg1 db "Score:"
	.start_screen_msg1 db "The Helicopter Game"
	.start_screen_msg2 db "Press any key to fly up  "
	.start_screen_msg3 db "Release to fall down     "
	.start_screen_msg4 db "Press 1/2/3 to change color"
	.start_screen_msg5 db "Highscore:"
	.start_screen_msg6 db "By Player:"
	.game_over_msg1 db "GAME OVER!!!!"
	.game_over_msg2 db "SPACE - TRY AGAIN"
	.game_over_msg3 db "  ESC - EXIT     "
	
	.game_over_msg4 db "   CONGRATULATION      "
	.game_over_msg5 db "YOU WON PLAYER "
	.game_over_msg6 db "YOUR NAME > "
	
;------------------------------------------------------------------------------------------code segment start------------------------------------------------------------------------------------ 
.code
main proc
	mov ax,@data
    mov ds,ax
	mov es,ax
	mov heli_image_start_address, offset heli_image_1
	call randomize_seed
	start:
	call initialize_variable
	call set_video_mode
	call start_screen
	loop_frame:
		call spawn_heli			;spawn heli into backscreen
		call spawn_cave			;spawn cave into backscreen
		call spawn_fuel			;spawn fuel into backscreen (will have checking inside, see whether to spawn or not(based on score/time) )
		call print_interface	;print interface into the back screen
		call flip_screen		;flip backscreen to frontscreen
	    call check_collision
		cmp al,1
			je lose    ;carry flag, 0 = no collision, 1 = collision with cave, 2 = collide with fuel
		cmp al,0
			je no_collision
		collide_with_fuel:	
		inc fuel_count
		mov fuel_exist,0
		mov fuel_pos_x,1   ;note: put to 1, so that wont increase fuel count many time
		no_collision:
		add current_score,1
		call decrease_fuel_count	;if reach certain score_mark, will decrease fuel
		call update_difficulty
		mov dx, 1       ;sleep for 1 tick
		call sleep
		call clear_back_screen
		jmp loop_frame
	lose:
		call game_over_screen
		jc start	; if carry flag = 1, start game again
		call exit	; else exit game
main endp


; ==================================
; METHOD	: decrease_fuel_count
; INPUT		: n/a
; RETURN	: n/a
; description: will decrease if reach every score
; ==================================
decrease_fuel_count proc
	cmp fuel_count,0 ; if 0 fuel ady, then no need deduct
	je no_need_decrease
	mov ax, current_score
	mov dx,0
	div lose_fuel_score_mark			        ;remainder stored in DL (either 0 or 1)
	cmp dl,0			; if dl = 0, means at 100 score mark
	je reach_score_mark
	ret
	reach_score_mark:
		dec fuel_count
		ret
	no_need_decrease:
		ret
decrease_fuel_count endp
; ==================================
; METHOD	: spawn_fuel
; INPUT		: n/a
; RETURN	: n/a
; description: will spawn fuel tank every 50 score
; ==================================
spawn_fuel proc
	mov ax,current_score
	mov dx,0
	div fifty	    ;remainder stored in DL (range 0-49)
	cmp dl,0
	je put_fuel_to_right_side
	continue_spawn_fuel:
	call draw_fuel
	ret

	put_fuel_to_right_side:
		mov fuel_pos_x,310
		mov ah,0
		mov al,top_cave_pos_y[310]
		mov fuel_pos_y,ax
		add fuel_pos_y,30
		mov fuel_exist,1
		jmp continue_spawn_fuel
spawn_fuel endp

; ==================================
; METHOD	: draw_fuel
; INPUT		: n/a
; RETURN	: n/a
; description: draw fuel image based on fuel position variable. If fuel image is out of bound, then will set fuel_exist to 0 to avoid glitches
; ==================================
draw_fuel proc
	cmp fuel_exist,1
	je proceed_draw_fuel		; if fuel exist in the screen, proceed to draw it then shift to left side
		ret				; if does not exist, then do not draw
	proceed_draw_fuel:
	mov cx,fuel_pos_x ;set the initial column (x)
	mov dx,fuel_pos_y ;set the initial line (y)
	mov si,offset fuel_image      ;for indexing of fuel_image
	draw_fuel_horizontal:
		mov al,[si]    ; put color into al
		cmp al,00h     ; if is white color then no need draw
			je skip_draw_pixel_2
		mov ah,0ch ;set the configuration to writing a pixel
		mov bh,back_screen_page_number ;write to back page first, later only flip screen
		int 10h    ;execute the configuration
		skip_draw_pixel_2:
		inc si
		inc cx     ;cx = cx + 1
		mov ax,cx          ;cx - fuel_x > fuel size (y -> we go to the next line,n -> we continue to the next column
		sub ax,fuel_pos_x
		cmp ax,fuel_image_width
			jng draw_fuel_horizontal
		
		mov cx,fuel_pos_x ;the cx register goes back to the initial column
		inc dx        ;we advance one line
		
		mov ax,dx              ;dx - fuel_pos_y > fuel size (y -> we exit this procedure,n -> we continue to the next line
		sub ax,fuel_pos_y
		cmp ax,fuel_image_height
			jng draw_fuel_horizontal
			
	mov ax,cave_velocity	;shift the fuel to left, based on the cave_velocity
	sub fuel_pos_x,ax
	js fuel_out_of_bound   ;when fuel_pos_x become negative
	ret
	fuel_out_of_bound:
		mov fuel_exist,0
	ret
draw_fuel endp

; ==================================
; METHOD	: initialize_variable
; INPUT		: n/a
; RETURN	: n/a
; ==================================
initialize_variable proc	
	mov heli_x,50 			;helicopter x position
	mov heli_y,100			;helicopter y position
	mov heli_fall_speed,5	;how fast the helicopter drop
	mov heli_jump_speed,8   ;how fast the helicopter fly up
	mov heli_width,18       ;dont touch, this must be same as the helicopter image width
	mov heli_height,8		;dont touch, this must be same as the helicopter image height
	mov cave_velocity,10	;how fast the cave move
	mov cave_gradient,1		;how vigorous the cave move up and down
	mov cave_color,0fh
	mov current_score,0
	mov si,0
	mov cx,320
	.reset_top_cave_pos:			;reset top cave to original state
		mov top_cave_pos_y[si],40
		inc si
		loop .reset_top_cave_pos
		
	mov si,0
	mov cx,320
	.reset_bottom_cave_pos:			;reset bottom cave to original state
		mov bottom_cave_pos_y[si],160
		inc si
		loop .reset_bottom_cave_pos
		
	call read_highscore_from_file		; read highscore and highscore player from the file
	
	mov fuel_pos_x,300 			;fuel x position
	mov fuel_pos_y,100			;fuel y position
	mov fuel_image_width,8       ;dont touch, this must be same as the fuel image width
	mov fuel_image_height,11		;dont touch, this must be same as the fuel image height
	
	mov fire_pos_x,15 			;fire x position
	mov fire_pos_y,18		;fire y position
	mov fire_image_width,16     ;dont touch, this must be same as the fire image width
	mov fire_image_height,16		;dont touch, this must be same as the fire image height
	
	mov fuel_count,1
	mov lose_fuel_score_mark,100
	ret
initialize_variable endp

; ==================================
; METHOD	: start_screen
; INPUT		: n/a
; RETURN	: n/a
; ==================================
start_screen proc	
 .start_screen_begin:
	call draw_heli
	call draw_cave
	
	mov ax,1300h          ;request display string,al 01 = advance cursor
	mov bh,back_screen_page_number ;  write to back page first, later only flip screen
	mov bl,1011b			;attribute
	lea bp,.start_screen_msg1;address of string in es:bp
	mov cx,19				;length of string
	mov dh,2				;row
	mov dl,10				;column
	int 10h
	
	mov ax,1300h          ;request display string,al 01 = advance cursor
	mov bh,back_screen_page_number;  write to back page first, later only flip screen
	mov bl,1011b			;attribute
	lea bp,.start_screen_msg2;address of string in es:bp
	mov cx,25				;length of string
	mov dh,11				;row
	mov dl,12				;column
	int 10h
	
	mov ax,1300h          ;request display string,al 01 = advance cursor
	mov bh,back_screen_page_number  ;  write to back page first, later only flip screen
	mov bl,1011b			;attribute
	lea bp,.start_screen_msg3;address of string in es:bp
	mov cx,25				;length of string
	mov dh,12				;row
	mov dl,12				;column
	int 10h
	
	mov ax,1300h          ;request display string,al 01 = advance cursor
	mov bh,back_screen_page_number  ;  write to back page first, later only flip screen
	mov bl,1011b			;attribute
	lea bp,.start_screen_msg4;address of string in es:bp
	mov cx,27				;length of string
	mov dh,13				;row
	mov dl,12				;column
	int 10h
	
	mov ax,1300h          ;request display string,al 01 = advance cursor
	mov bh,back_screen_page_number  ;  write to back page first, later only flip screen
	mov bl,1011b			;attribute
	lea bp,.start_screen_msg5;address of string in es:bp
	mov cx,10				;length of string
	mov dh,22				;row
	mov dl,2				;column
	int 10h
	
	mov ax,high_score			;print high score
	mov row_for_print_as_ascii,22
	mov col_for_print_as_ascii,12
	call print_as_ascii
	
	mov ax,1300h          ;request display string,al 01 = advance cursor
	mov bh,back_screen_page_number ;  write to back page first, later only flip screen
	mov bl,1011b			;attribute
	lea bp,.start_screen_msg6;address of string in es:bp
	mov cx,10				;length of string
	mov dh,22				;row
	mov dl,18				;column
	int 10h
	
	mov ax,1300h          ;request display string,al 01 = advance cursor
	mov bh,back_screen_page_number ;  write to back page first, later only flip screen
	mov bl,1111b			;attribute
	lea bp,high_score_player ;address of string in es:bp
	mov ch,0
	mov cl,input_name_act				;length of string
	mov dh,22				;row
	mov dl,28				;column
	int 10h
	
	call flip_screen
	mov ah,07h
	int 21h
	cmp al,31h
		je change_to_heli_image_1
	cmp al,32h
		je change_to_heli_image_2
	cmp al,33h
		je change_to_heli_image_3
	ret
	change_to_heli_image_1:
		mov heli_image_start_address, offset heli_image_1
		jmp .start_screen_begin
		
	change_to_heli_image_2:
		mov heli_image_start_address, offset heli_image_2
		jmp .start_screen_begin
		
	change_to_heli_image_3:
		mov heli_image_start_address, offset heli_image_3
		jmp .start_screen_begin
start_screen endp

; ==================================
; METHOD	: update_difficulty
; INPUT		: n/a
; RETURN	: n/a
;description: add score and change difficulty/phase when reach certain amount of score
; ==================================
update_difficulty proc		
	cmp current_score,100
		je phase_1
	cmp current_score,200
		je phase_2
	cmp current_score,300
		je phase_3
	cmp current_score,400
		je phase_4
	cmp current_score,500
		je phase_5
	cmp current_score,600
		je phase_6
	cmp current_score,700
		je phase_7
	ret
	phase_1:	;phase means the difficulty level
		add top_cave_pos_y[319],4			;make cave narrower
		sub bottom_cave_pos_y[319],4
		mov cave_gradient, 2				;make cave more curve
		ret
	phase_2:
		add top_cave_pos_y[319],4			;make cave narrower
		sub bottom_cave_pos_y[319],4
		mov cave_color,0eh					; change to yellow color
		ret
	phase_3:
		add top_cave_pos_y[319],4			;make cave narrower
		sub bottom_cave_pos_y[319],4
		ret
	phase_4:
		mov cave_velocity,12				;make cave move faster
		mov lose_fuel_score_mark,75
		ret
	phase_5:
		mov cave_velocity,14			;make cave move faster
		mov cave_color,0ch			;change to bright red color
		ret
	phase_6:
		mov cave_velocity,16	;make cave move faster
		mov lose_fuel_score_mark,50
		ret
	phase_7:
		mov cave_velocity,18	;make cave move faster
		mov cave_color,04h		;change to dark red color
		mov cave_gradient, 3				;make cave more curve
		ret
update_difficulty endp

; ==================================
; METHOD	: check_collision
; INPUT		: heli_y,top_cave_pos_y,bottom_cave_pos_y
; RETURN	: al(0 = no collide cave, 1 = collide with cave, 2 = collide with fuel)
; ==================================
check_collision proc	
    mov si,heli_width
	add si,50
	mov ax,heli_y
	;check collision of heli top part with cave 
	cmp al,top_cave_pos_y[si]
		jbe collide_with_cave
	cmp al,bottom_cave_pos_y[si]
		jae collide_with_cave
	;check collision of heli bottom part with cave 
	add ax,heli_height
	cmp al,top_cave_pos_y[si]
		jbe collide_with_cave
	cmp al,bottom_cave_pos_y[si]
		jae collide_with_cave
	
	mov ax,heli_x
	mov bx,fuel_pos_x
	add bx,fuel_image_width
	cmp bx,ax ; cmp fuel right edge, helicopter left edge
		jb no_collide
		
	mov ax,heli_x
	add ax,heli_width
	mov bx,fuel_pos_x
	cmp fuel_pos_x,ax ; cmp fuel left edge, helicopter right edge
		ja no_collide	
		
	mov ax,heli_y
	mov bx,fuel_pos_y
	add bx,fuel_image_height
	cmp bx,ax         ;cmp fuel bottom edge, helicopter top edge
		jb no_collide
		
	mov ax,heli_y
	add ax,heli_height
	mov bx,fuel_pos_y
	cmp fuel_pos_x,ax ; cmp fuel top edge, helicopter bottom edge
		ja no_collide	
		
	mov al,2
	ret
	
	no_collide:
		mov al,0
		ret
	
	collide_with_cave:
		mov al,1
		ret
check_collision endp

; ==================================
; METHOD	: game_over_screen
; INPUT		: n/a
; RETURN	: carry flag(1 = again, 0= end)
; ==================================
game_over_screen proc	
	mov ax,current_score
	cmp high_score,ax  ; cmp current_score,high_score
	jb broke_record   ; if high_score < current_score 
		mov ah,02h		;set cursor position
		mov bh,front_screen_page_number		; page 0
		mov dh,11			;row
		mov dl,14			;column
		int 10h			;execute
		mov si,0 ;for indexing of game_over_msg1
		print_game_over_animation:
			mov ah,02h
			mov dl,.game_over_msg1[si]
			int 21h
			mov dx,2		
			call sleep		;sleep for 2tick
			inc si
			cmp si,13
			jb print_game_over_animation
	
		mov ax,1300h          ;request display string,al 01 = advance cursor
		mov bh,front_screen_page_number ;  just write to front screen, screen flickering because no fast moving image in this game over screen
		mov bl,1111b			;attribute
		lea bp,.game_over_msg2	;address of string in es:bp
		mov cx,17				;length of string
		mov dh,12				;row
		mov dl,12				;column
		int 10h
		
		mov ax,1300h          ;request display string,al 01 = advance cursor
		mov bh,front_screen_page_number ;  just write to front screen, screen flickering because no fast moving image in this game over screen
		mov bl,1111b			;attribute
		lea bp,.game_over_msg3	;address of string in es:bp
		mov cx,17				;length of string
		mov dh,13				;row
		mov dl,12				;column
		int 10h
		
		.get_input_for_end_or_start_again:
			mov ah,07h	;get input
			int 21h

			cmp al,32  ;play again (set carry flag to 1)
			je play_again
			cmp al,27
			je end_game
			jmp .get_input_for_end_or_start_again
		
		end_game:
			clc			;end game (set carry flag to 0)
			ret
		play_again:
			stc			;play again(set carry flag to 1)
			ret
			
		
	broke_record:
		mov high_score,ax	 ; note: ax is current score
		
		mov ax,1300h          ;request display string,al 01 = advance cursor
		mov bh,front_screen_page_number ;  just write to front screen, screen flickering because no fast moving image in this game over screen
		mov bl,1011b			;attribute
		lea bp,.game_over_msg4	;address of string in es:bp
		mov cx,23				;length of string
		mov dh,12				;row
		mov dl,10				;column
		int 10h
		
		mov ax,1300h          ;request display string,al 01 = advance cursor
		mov bh,front_screen_page_number ;  just write to front screen, screen flickering because no fast moving image in this game over screen
		mov bl,1011b			;attribute
		lea bp,.game_over_msg5	;address of string in es:bp
		mov cx,15				;length of string
		mov dh,13				;row
		mov dl,10				;column
		int 10h
		
		mov ax,1300h          ;request display string,al 01 = advance cursor
		mov bh,front_screen_page_number ;  just write to front screen, screen flickering because no fast moving image in this game over screen
		mov bl,1111b			;attribute
		lea bp,high_score_player ;address of string in es:bp
		mov ch,0
		mov cl,input_name_act				;length of string
		mov dh,13				;row
		mov dl,25				;column
		int 10h
		
		mov ax,1301h          ;request display string,al 01 = advance cursor
		mov bh,front_screen_page_number ;  just write to front screen, screen flickering because no fast moving image in this game over screen
		mov bl,1011b			;attribute
		lea bp,.game_over_msg6	;address of string in es:bp
		mov cx,12				;length of string
		mov dh,14				;row
		mov dl,10				;column
		int 10h
		
		MOV AH,0AH				;request input string
		LEA DX,input_name  
		INT 21H
		XOR AH,AH
		MOV AL,input_name_act
		MOV SI,AX         
		MOV high_score_player[SI],' '
			
		call write_highscore_to_file
		stc
		ret
game_over_screen endp


; ==================================
; METHOD	: print_interface
; INPUT		: current_score
; RETURN	: N/A
; ==================================
print_interface proc	
	mov ax,1300h          ;request display string,al 01 = advance cursor
	mov bh,back_screen_page_number ;  write to back page first, later only flip screen
	mov bl,1011b			;attribute
	lea bp,.interface_msg1		;address of string in es:bp
	mov cx,6				;length of string
	mov dh,1				;row
	mov dl,2				;column
	int 10h
	mov ax,current_score
	mov row_for_print_as_ascii,1
	mov col_for_print_as_ascii,8
	call print_as_ascii
	
	;draw interface fuel symbol
	mov cx,fire_pos_x ;set the initial column (x)
	mov dx,fire_pos_y ;set the initial line (y)
	mov si,offset fire_image      ;for indexing of fire_image
	draw_fire_interface_horizontal:
		mov al,[si]    ; put color into al
		mov ah,0ch ;set the configuration to writing a pixel
		mov bh,back_screen_page_number ;write to back page first, later only flip screen
		int 10h    ;execute the configuration
		inc si
		inc cx     ;cx = cx + 1
		mov ax,cx          ;cx - fire_pos_x > fire size (y -> we go to the next line,n -> we continue to the next column
		sub ax,fire_pos_x
		cmp ax,fire_image_width
			jng draw_fire_interface_horizontal
		
		mov cx,fire_pos_x ;the cx register goes back to the initial column
		inc dx        ;we advance one line
		
		mov ax,dx              ;dx - fire_pos_y > fire size (y -> we exit this procedure,n -> we continue to the next line
		sub ax,fire_pos_y
		cmp ax,fire_image_height
			jng draw_fire_interface_horizontal
	
	cmp fuel_count,0
	je no_need_print_fuel_block
	
	mov al, fuel_count
	mov loop_block_count,al
	
	mov fuel_block_pos_x,36
	mov fuel_block_pos_y,18
	print_fuel_block:
		mov cx,fuel_block_pos_x ;set the initial column (x)
		mov dx,fuel_block_pos_y ;set the initial line (y)
		draw_fuel_block_horizontal:
			mov al,0eh    ; put color into al , yellow
			mov ah,0ch ;set the configuration to writing a pixel
			mov bh,back_screen_page_number ;write to back page first, later only flip screen
			int 10h    ;execute the configuration
			inc cx     ;cx = cx + 1
			mov ax,cx          ;cx - fuel_block_pos_x > fuel block size (y -> we go to the next line,n -> we continue to the next column
			sub ax,fuel_block_pos_x
			cmp ax,5		; each block width
				jng draw_fuel_block_horizontal
			
			mov cx,fuel_block_pos_x ;the cx register goes back to the initial column
			inc dx        ;we advance one line
			
			mov ax,dx              ;dx - fuel_block_pos_y > fuel block size (y -> we exit this procedure,n -> we continue to the next line
			sub ax,fuel_block_pos_y
			cmp ax,15    ; each block height
				jng draw_fuel_block_horizontal
			
		add fuel_block_pos_x,8
		dec loop_block_count
		cmp loop_block_count,0
		jne print_fuel_block
	ret
	no_need_print_fuel_block:
	ret
print_interface endp


; ==================================
; METHOD	: spawn_cave
; INPUT		: TOP_CAVE_POS_Y, BOTTOM_CAVE_POS_Y, CAVE_VELOCITY, CAVE_GRADIENT
; RETURN	: N/A
; ==================================
spawn_cave proc	
	call update_cave_pos
	call draw_cave
	ret
spawn_cave endp


; ==================================
; METHOD	: update_cave_pos
; INPUT		: TOP_CAVE_POS_Y, BOTTOM_CAVE_POS_Y, CAVE_VELOCITY, CAVE_GRADIENT
; RETURN	: N/A
; ==================================
update_cave_pos proc
	MOV SI,0
	MOV AX, 320						;mov .cave_ending, 320-cave_velocity
	SUB AX,cave_velocity
	MOV .cave_ending,AX
	shift_cave_to_left:    ;shift data to left side
		mov di,si					 ;mov di, si+cave_velocity
		add di,cave_velocity
		mov al,top_cave_pos_y[di]    ;mov top_cave_pos_y[si],top_cave_pos_y[di]
		mov top_cave_pos_y[si],al
		mov al,bottom_cave_pos_y[di] ;mov bottom_cave_pos_y[si],bottom_cave_pos_y[di]
		mov bottom_cave_pos_y[si],al
		inc si
		cmp si,.cave_ending
			jb shift_cave_to_left
		
	mov di,si	;mov di, si-1
	sub di,1
	replace_cave_right_side_position:
		call random             ; random number in ax (0-65535)
		mov dx,0
		div two			        ;remainder stored in DL (either 0 or 1)
		mov cave_direction, dl  ;0 = down, 1 = up
		mov bl,cave_gradient        ;cave_gradient means how vigorous the cave move up and down
		cmp cave_direction,0
			je downward_cave_pos
		upward_cave_pos:
			neg bl					;bl = -cave_gradient
		downward_cave_pos:
		mov ah,bottom_cave_pos_y[di] 
		add ah,bl					 ;ah = bottom_cave_pos_y[di] + cave_gradient
		mov al,top_cave_pos_y[di]    
		add al,bl					 ;al = top_cave_pos_y[di] + cave_gradient
		cmp al,0
			jb cave_out_of_bound
		cmp al,199
			ja cave_out_of_bound
		cmp ah,0
			jb cave_out_of_bound
		cmp ah,199
			ja cave_out_of_bound
			
		mov bottom_cave_pos_y[si],ah
		mov top_cave_pos_y[si],al

		end_update_cave_pos:
			inc di
			inc si
			cmp si,320
			jb replace_cave_right_side_position
		ret
		cave_out_of_bound:
			mov ah,bottom_cave_pos_y[di]
			mov bottom_cave_pos_y[si],ah
			mov al,top_cave_pos_y[di]
			mov top_cave_pos_y[si],al
			jmp end_update_cave_pos
update_cave_pos endp


; ==================================
; METHOD	: draw_cave
; INPUT		: TOP_CAVE_POS_Y, BOTTOM_CAVE_POS_Y,cave_color
; RETURN	: N/A
; ==================================
draw_cave proc
	mov si,0   ; for indexing of top_cave_pos_y and bottom_cave_pos_y
	draw_cave_1:
		mov dh,0
		mov dl,top_cave_pos_y[si]     ;initialize y position to top_cave_pos_y
		draw_top_cave:
			MOV CX,SI  					 ;set x position    
			mov ah,0ch ;set the configuration to writing a pixel
			mov al,cave_color ;choose white as color
			mov bh,back_screen_page_number ;write to back page first, later only flip screen
			int 10h    ;execute the configuration
			sub dl,13  ;dl = how dense the cave looks like
			cmp dl,top_cave_pos_y[si]
			jb draw_top_cave
			
		mov dh,0
		mov dl,bottom_cave_pos_y[si]  ;initialize y position
		draw_bottom_cave:
			MOV CX,SI  					 ;set x position    
			mov ah,0ch ;set the configuration to writing a pixel
			mov al,cave_color ;choose white as color
			mov bh,back_screen_page_number ;write to back page first, later only flip screen
			int 10h    ;execute the configuration
			add dl,13	;dl = how dense the cave looks like
			cmp dl,199
			jb draw_bottom_cave
		inc si
		cmp si,320
		jb draw_cave_1
	ret
draw_cave endp

; ==================================
; METHOD	: spawn_heli
; INPUT		: HELI_X, HELI_Y, HELI_SIZE
; RETURN	: N/A
; ==================================
spawn_heli proc
	cmp fuel_count,0
	je fall ; if no more fuel, cannot fly
	call kbhit
		test al,al
		jz fall
		jump:
			mov ax,heli_jump_speed
			sub heli_y, ax
			jmp skip
		fall: 
			mov ax,heli_fall_speed
			add heli_y, ax	
		skip:
			call draw_heli
	ret
spawn_heli endp

; ==================================
; METHOD	: DRAW_HELI
; INPUT		: HELI_X, HELI_Y, HELI_SIZE
; RETURN	: N/A
; ==================================
draw_heli proc
	mov cx,heli_x ;set the initial column (x)
	mov dx,heli_y ;set the initial line (y)
	mov si,heli_image_start_address      ;for indexing of heli_image
	draw_heli_horizontal:
		mov al,[si]    ; put color into al
		cmp al,00h     ; if is white color then no need draw
			je skip_draw_pixel
		mov ah,0ch ;set the configuration to writing a pixel
		mov bh,back_screen_page_number ;write to back page first, later only flip screen
		int 10h    ;execute the configuration
		skip_draw_pixel:
		inc si
		inc cx     ;cx = cx + 1
		mov ax,cx          ;cx - heli_x > heli size (y -> we go to the next line,n -> we continue to the next column
		sub ax,heli_x
		cmp ax,heli_width
			jng draw_heli_horizontal
		
		mov cx,heli_x ;the cx register goes back to the initial column
		inc dx        ;we advance one line
		
		mov ax,dx              ;dx - heli_y > heli size (y -> we exit this procedure,n -> we continue to the next line
		sub ax,heli_y
		cmp ax,heli_height
			jng draw_heli_horizontal
	ret
draw_heli endp

; ==================================
; METHOD	: read_highscore_from_file
; INPUT		: high_score,high_score_player
; RETURN	: n/a
; DESCRIPTION: read the highscore and player from file to 'high_score' and 'high_score_player'
; ==================================
read_highscore_from_file proc	
	mov ah,3dh               ;--open highscore file
	mov al,0h
	lea dx,file_name
	int 21h
	mov file_handler,ax
			
	mov ah,3fh               ;--read highscore from file   
	mov bx,file_handler
	mov cx,2
	lea dx,high_score
	int 21h  
	
	mov ah,3fh               ;--read highscore_player from file   
	mov bx,file_handler
	mov cx,1
	lea dx,input_name_act
	int 21h  
	
	mov ah,3fh               ;--read highscore_player from file   
	mov bx,file_handler
	mov cx,11
	lea dx,high_score_player
	int 21h  

	mov ah,3eh               ;--close highscore file
	mov bx,file_handler
	int 21h
	ret
read_highscore_from_file endp


; ==================================
; METHOD	: write_highscore_to_file
; INPUT		: high_score,high_score_player
; RETURN	: n/a
;DESCRIPTION: write the 'high_score' and 'high_score_player' to the file 
; ==================================
write_highscore_to_file proc	
	mov ah,3dh               ;--open highscore file
	mov al,1h
	lea dx,file_name
	int 21h
	mov file_handler,ax
		   
	mov ah,40h               ;--write highscore into file   
	mov bx,file_handler
	mov cx,2
	lea dx,high_score
	int 21h 
	
	mov ah,40h               ;--write highscore player into file   
	mov bx,file_handler
	mov cx,1
	lea dx,input_name_act
	int 21h 
	
	mov ah,40h               ;--write highscore player into file   
	mov bx,file_handler
	mov cx,11
	lea dx,high_score_player
	int 21h 


	mov ah,3eh               ;--close highscore file
	mov bx,file_handler
	int 21h
	ret
write_highscore_to_file endp

; ==================================
; METHOD	: KBHIT
; INPUT		: N/A
; RETURN	: RETURNS KEY HIT IN AX (0 = no key hit)
; ==================================
kbhit proc
	mov al, 0			; check for any keys hit
	mov ah, 1			; but do not block (async)
	int 16h				; call bios interrupt
	jz .kbhit_end				; if no keys hit jump to end
	mov ax, 0			; get key hit function
	int 16h				; call bios interrupt
	ret		
	
	.kbhit_end:
		mov ax, 0			; set ax to 0 if no keys hit
		ret
kbhit endp

; =================================
; PROTOTYPE	: randomize_seed
; INPUT		: seed
; RETURN	: n/a
;description: randomize a number(0-65535) and put into 'seed'
; =================================
randomize_seed proc
	mov ax, 0			; get tick count function 
	int 1Ah				; call BIOS interrupt
	mov seed, dx 		; tickcount as seed
	ret
randomize_seed endp
	
	
; ================================
; PROTOTYPE	: random
; INPUT		: seed
; RETURN	: random number(0-65535) in AX
; ================================
random proc
	mov ax, seed
	mov dx, 33333
	mul dx				; multiply SEED with AX

	inc ax				; increment seed
	mov seed, ax		; use AX as new seed
	mov ax, dx		; return random value in AX
	ret
random endp


; ============================================================
; METHOD	: SLEEP
; INPUT		: AMOUNT OF MS TO SLEEP IN DX 
; RETURN	: N/A
; ============================================================
sleep proc
	mov ax, 0	; get tick count function
	mov bx, dx	; save ms

	int 1ah		; call bios interrupt
	add bx, dx	; ms + ticks

	.wait:
		int 1ah		; call bios interrupt
		cmp dx, bx
		jne .wait	; loop until we waited for ms amount
		ret
sleep endp

; ============================================================
; METHOD	: PRINT_AS_ASCII
; INPUT		: AX (the value to be printed), row_for_print_as_ascii (ROW), col_for_print_as_ascii(COL)
; RETURN	: N/A
; description: print number in ascii
; ============================================================
print_as_ascii proc
	push ax			;reserve used register	
	push cx
	push dx
	
	xor cx,cx
	xor dx,dx
	mov bx, 10             
	
	div_by_ten:                            
		div ten                      ; divide 10 (word-sized).
		push dx                     ; save remainder.        
		inc cx                   ; add one to counter   
		xor dx,dx
		cmp ax, 0                   ; compare quotient (ax) to zero
		jne div_by_ten                   
		
	display_ascii:     
		xor dx,dx		
		pop dx                        ; put top of stack into dx.
		add dl, 30h             	         
		mov char_for_print_as_ascii, dl

		push cx
		mov ax,1300h          ;request display string,al 01 = advance cursor
		mov bh,back_screen_page_number  ;  write to back page first, later only flip screen
		mov bl,1111b			;attribute
		lea bp,char_for_print_as_ascii;address of string in es:bp
		mov cx,1				;length of string
		mov dh,row_for_print_as_ascii		;row
		mov dl,col_for_print_as_ascii		;column
		int 10h
		pop cx
		
		inc col_for_print_as_ascii
		loop display_ascii  
		
	pop dx			
	pop cx		
	pop ax		;restore original register
	ret
print_as_ascii endp 

flip_screen proc
	mov ah,05h		
	mov al,back_screen_page_number		;change active screen to back screen
	int 10h
	
	xor back_screen_page_number,1
	xor front_screen_page_number,1
	ret
		
	;DIRECT VIDEO BUFFER MANIPULATION METHOD - BUT NO COLOR (DONT KNOW WHY?)
	; push ds	
	; push es
	; mov ax, 0a000h
	; mov es, ax
	; xor di, di

	; mov ax, 0a200h
	; mov ds, ax
	; xor si, si

	; mov cx, 4000 ; 64000 / 4
	; rep movsw  ; copy 4 bytes from [DS:SI] into [ES:DI]
	
	
	; mov ax, 0a200h
	; mov es, ax          ; Beginning of VGA memory in segment 0xA000
	; mov ax, 0h    ; Set the color to clear with 0x76 (green?) 0x00=black
	; xor di, di           ; Destination address set to 0
	; mov cx, 4000  ; We are doing 4 bytes at a time so count = (320*200)/4 DWORDS
	; rep stosw              ; Clear video memory

	; pop es
	; pop ds
	ret
flip_screen endp
clear_back_screen proc
	push es
	cmp back_screen_page_number,0
	je clear_page_0
	mov ax, 0a200h
	.clear_screen_continue:
	mov es, ax             ; Beginning of video memory in segment 0xA200/a000
	mov ax, 0h    ; Set the color to clear with  0x00=black
	xor di, di           ; Destination address set to 0
	mov cx, 4000   ; We are doing 2 bytes at a time
	rep stosw              ; Clear video memory
	mov ax,0600h
	mov bh,61h
	pop es
	ret
	clear_page_0:
		mov ax, 0a000h
		jmp .clear_screen_continue
clear_back_screen endp
set_video_mode proc
	mov ax, 000dh	; 320x200 @ 16 color mode
	int 10h			; call bios interrupt
	ret
set_video_mode endp

exit proc
	call set_video_mode
	mov ax,4c00h
	int 21h
exit endp
end main            
 