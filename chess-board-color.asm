INCLUDE Irvine32.inc

; proc prototypes
PrintTile   PROTO color : DWORD
PrintEvenRow PROTO counter : BYTE, color : DWORD
PrintOddRow   PROTO counter : BYTE, color : dword
PrintBoard	PROTO color : DWORD
PrintBaseColor PROTO

.code
main PROC
mov edx, 0; initial color
invoke PrintBoard, edx; print board
exit
main ENDP

PrintBoard PROC USES ecx, color:dword
mov ecx, 4; 4 times for each even and odd row
L1 :
invoke PrintEvenRow, 4, color; Print even row 4 times
invoke PrintOddRow, 4, color; Print even row 4 times
LOOP L1
invoke PrintBaseColor
ret
PrintBoard ENDP

PrintEvenRow PROC uses ecx, counter:byte, color : dword
movzx ecx, counter
L1 :
invoke PrintTile, white * 16; print white tile first
invoke PrintTile, color
LOOP L1
call CrLf
ret
PrintEvenRow ENDP

PrintOddRow PROC USES ecx, counter:byte, color : dword
movzx ecx, counter
L1 :
invoke PrintTile, color; print color tile first
invoke PrintTile, white * 16
LOOP L1
call CrLf
ret
PrintOddRow ENDP

PrintTile PROC USES eax, color:dword
mov eax, color; move color to eax
call SetTextColor
mov al, ' '; move al empty char
call WriteChar; print left half
call WriteChar; print right half
ret
PrintTile ENDP

PrintBaseColor PROC USES eax
mov eax, white + (black * 16); initial color (white and black background)
call SetTextColor
ret
PrintBaseColor ENDP

END main
