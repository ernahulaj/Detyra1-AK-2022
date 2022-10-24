.globl main
.data
test: .word 4 #caktimi i vleres se variables test

.text
main: lw $a0, test  #vendosja e vleres nga test ne regjistrin a0
	  jal printFun  #thirrja e funksionit printFun  
	  
	  # Mbyllja e programit
	  li $v0, 10 
	  syscall


printFun: bge $a0, 1, else  #Nese vlera e parametrit >= 1, kalo te label else
		  #perndryshe return
		  jr $ra 

#label else
else:   addi $sp, $sp, -8 #alokimi i hapesires memorike per ruajtjen e dy integerave
		sw $a0, 0($sp)    #ruajtja e vleres se parametrit ne adresen ku ndodhet stack pointeri
		sw $ra, 4($sp)	  #ruajtja e return address ne poziten ku ndodhet stack pointeri + 4
		
		add $t0, $a0, $zero  #vendosja e vleres se regjistrit a0 ne t0
		li $v0, 1			 #shtypja e integerit
		syscall
		
		#shtypja e hapesires
		li $v0, 11	
		li $a0, ' '
		syscall
		
		#zvogelimi i vleres ne t0 per 1 dhe ruajtja ne a0
		sub $a0, $t0, 1
		
		#hapi rekursiv
		jal printFun
		
		#marrja e vlerave ( parametrave paraprake dhe return adsresses) nga memoria
		lw $a0, 0($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 8  #dealokimi i hapesires memorike
		
		#shtypja e integerave
		li $v0, 1
		syscall
		
		#shtypja e hapesires
		li $v0, 11
		li $a0, ' '
		syscall
		
		jr $ra
		
		