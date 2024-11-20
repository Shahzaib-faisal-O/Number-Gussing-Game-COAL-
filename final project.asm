;****************************************************************************;
;*********************	MACRO TO SCROLL SPECIFIC ROWS to SPECIFIC	*********************;

SetResolution macro srow,scol,erow,ecol,attrib 
	mov ah,06h
	mov al,0h
	mov bh,attrib
	mov ch,srow
	mov cl,scol
	mov dh,erow
	mov dl,ecol
	int 10h

SetResolution endm  

;****************************************************************************************************;
;*******************	MACRO TO SET THE CURSOR POSITION at SPECIFIC Row and column	*****************;

setCursor macro row,col

	mov ah,02
	mov bh,0h
	mov dh,row
	mov dl,col
	int 10h

setCursor endm

;****************************************************************************;
;*********************	MACRO TO Print a String	*********************;

print macro string 

mov ah,09h
mov dx,offset string
int 21h
endm
;----------------------------------------------------------------------
org 100h
.model small
.stack 100h
.data 
intro        db '  Welcome to the Number Gussing Game $'	;string to print the starting text
firstMember  db ' Shahziab Faisal 2212349       $'	;string to print the starting text
secondMember db '      Aatir raza 221217       $'	;string to print the starting text
press db 'Press Any Key to Continue $'	;string to print the starting text
GameRule db 'Game Rules:    ---- $'
;-----------------------------------------------------------
win db '--WIN--', '$' ; String to display if the guess is correct
false db '--FALSE--', '$' ; String to display if the guess is incorrect
lose db '--LOSE--', '$' ; String to display after three incorrect guesses
var db ?                ; Variable to store the hidden integer 
msg1 db 'Enter Hidden Number for Other Player To guess$'
;----------------------------------------------------------------
.code
main proc 
     ;call SetupScreen ; Set up the screen for other operations
    call TitleScreen  
    call SetupScreen ; Set up the screen for other operations 
   
    mov ax, @data         ; Initialize the data segment
    mov ds, ax
     
   print msg1
   mov ah,7            ; Input of an invisible integer
   int 21h 
    
   mov var,al            ; Store the hidden integer in the variable 'var'
  
   mov cl,3              ; Loop 3 times for three guesses 
   
   li:                ; Loop label for the guessing process
    mov ah,7            ; Input a guess
    int 21h 
    
    cmp al,var          ; Compare the guess with the hidden integer
    je found            ; Jump to 'Found' label if the guess is correct
   
    mov dl,10           ; Move to the next line
    mov ah,02h          ; Output the newline character
    int 21h                                            
    
    mov dl,13
    mov ah,2
    int 21h 
    
    print false      ; Display the incorrect guess message
   
    Loop li          ; Repeat the loop for the remaining attempts
    
    print lose          ; Display the message for three incorrect guesses
    
  
  mov dl,10             ; Move to the next line
  mov ah,02h            ; Output the newline character
  int 21h 
  
  jmp end               ; Jump to the 'jam' label to terminate the program
  
found:
 print win
  
  mov dl,10             ; Move to the next line
  mov ah,02h            ; Output the newline character
  int 21h  
  
  jmp end               ; Jump to the 'jam' label to terminate the program 
  
end:
  mov ah,4ch            ; Terminate the program
  int 21h 
    
    
    main endp


ret
;****************************************************************************************************;
;*******************	PROC TO SET THE TitleScreen	*****************;


TitleScreen proc near	;procedure to set the front page of the screen

	SetResolution 0,0,24,79,45h		;to set the color of the screen 
	SetResolution 7,16,15,60,0eh    ;to set the small on the screen size and color stuff
	
	setCursor 8,21
	print intro
	
	setCursor 9,21
	print firstMember
	
	setCursor 10,21
	print secondMember
	
	
	setCursor 12,21
	print GameRule
	
	
	setCursor 14,25
	print press
	
	mov ah,01h
	int 21h
	ret

TitleScreen endp

;****************************************************************************************************;
;*******************	PROC TO SET THE SETUPSCREEN	*****************;

SetupScreen proc near
    SetResolution 0, 0, 30, 90, 0   ; Clear the screen with black color
    SetResolution 0, 0, 24, 79, 0Fh ; Set text color to white on black background
    ; Set cursor position or any other screen setup operations as needed
    setCursor 0, 0  ; Set the cursor to the top-left corner    
    ret
SetupScreen endp
  


