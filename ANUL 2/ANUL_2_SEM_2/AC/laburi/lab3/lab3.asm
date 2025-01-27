INCLUDE Irvine32.inc ; includem fisierul de antet

.data ; segmentul de date
	mes1 byte "Introduceti valoarea X:", 0 ; string pentru mesajul de introducere a valorii X
	mes2 byte "Introduceti valoarea Y:", 0 ; string pentru mesajul de introducere a valorii Y
	mes3 byte "Rezultatul este:", 0 ; string pentru afisarea rezultatului
	vrx dword 0 ; variabila pentru valoarea X, initializata cu 0
	vry dword 0 ; variabila pentru valoarea Y, initializata cu 0
	rez dword 0 ; variabila pentru stocarea rezultatului, initializata cu 0

.code ; segmentul de cod
	
	; (Y-X)*2-121 cand X par
	; 2*Y+X/4 cand X impar

	main PROC ; incepem procedura principala
	mov edx, offset mes1 ; mutam adresa mesajului 1 in registrul edx
	call WriteString ; afisam mesajul 1
	call ReadInt ; citim o valoare intreaga de la tastatura
	mov vrx, eax ; mutam valoarea citita in variabila vrx

	mov edx, offset mes2 ; mutam adresa mesajului 2 in registrul edx
	call WriteString ; afisam mesajul 2
	call ReadInt ; citim o alta valoare intreaga de la tastatura
	mov vry, eax ; mutam valoarea citita in variabila vry

	mov eax, vrx      ; Salvam valoarea lui X in registru EAX
	and eax, 1      ; Operatie bit la bit intre X si 1
	cmp eax, 0      ; Comparam rezultatul cu 0
	jz par          ; Daca ZF este setat, atunci X este par
	jmp impar       ; Daca ZF nu este setat, atunci X este impar

par:
    mov eax, vrx ; mutam valoarea lui vrx in eax
    mov ebx, vry ; mutam valoarea lui vry in ebx
    sub ebx, eax ; scadem valoarea din eax din valoarea lui ebx
    mov eax, ebx ; mutam valoarea lui ebx in eax
    mov bx, 2 ; mutam valoarea 2 in partea inferioara a registrului bx
    cwd ; extindem semnul din dx in ax
    mul bx ; inmultim valoarea din eax cu 2
    sub eax, 121 ; scadem din valoarea din eax 121
    mov rez, eax ; mutam valoarea din eax in variabila rez
    jmp sfarsit ; sarim la eticheta sfarsit

impar:
    mov eax, vrx    ; mutam valoarea lui vrx in eax 
    mov ebx, 4
    xor edx, edx
    ;shr eax, 2      ; impartim valoarea lui vrx la 4
    div ebx
    mov ecx, eax
    
    mov eax, vry    ; mutam valoarea lui vry in ebx
    mov ebx, 2
    mul ebx
    ;shl ebx, 1      ; inmultim valoarea lui ebx cu 2
    add eax, ecx    ; rezultatul adunaii valorii din ebx cu eax

sfarsit:
	mov edx, offset mes3
	mov eax, ecx
	call WriteString
	mov eax, ecx
	call WriteInt	
	call Crlf	
 	exit
	main ENDP
	END main
