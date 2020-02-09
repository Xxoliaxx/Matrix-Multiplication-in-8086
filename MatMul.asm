data  segment
mat1  db  01h,02h,03h,04h,05h,06h
mat2  db  01h,02h,03h,04h,05h,06h
mat3  dw  09h  dup(?)
data  ends

code  segment
start:
ASSUME  CS:code,DS:data
MOV  ax,data
MOV  ds,ax
MOV  ch,03h
MOV  bx,offset  mat3
MOV  SI,offset  mat1

nextrow:
MOV  DI,offset  mat2
MOV  cl,03h

nextcol:
MOV  dl,02h
MOV  bp,0000h
MOV  ax,0000h

next_ele: 
MOV  al,[SI] 
MUL  byte ptr[DI] 
ADD  bp,ax
INC  SI
ADD  DI,03h
DEC dl
JNZ  next_ele
SUB  DI,05h
SUB  SI,02h
MOV  [bx],bp
INC  bx
DEC  cl
JNZ  nextcol
ADD  SI,02h  
DEC  ch
JNZ  nextrow
MOV ah,4ch

INT  3
code ends
end  start
