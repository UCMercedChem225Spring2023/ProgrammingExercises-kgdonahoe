     program prgm_02_01
     implicit none
     integer::n1,n2
     real::l,m,T,PIB_1D_T_Element


     write(*,*)'Enter an integer for n1.'
     read(*,*) n1
     write(*,*)'Enter an integer for n2.'
     read(*,*) n2
     write(*,*)'Enter a real number for l.'
     read(*,*) l
     write(*,*)'Enter a real number for m.'
     read(*,*) m

     T = PIB_1D_T_Element(n1,n2,l,m)

 100 format(1X,'Kinetic energy matrix element',I5,',',I5,' is ',F12.5,'.')

     write(*,100)n1,n2,T

     end program prgm_02_01

     Real Function PIB_1D_T_Element(n1,n2,l,m)
     implicit none
     real,parameter::pi=3.1415926
     integer::n1,n2
     real::l,m  
     if(n1==n2) then
       PIB_1D_T_Element= (n1**2)*(pi**2)/(2*m*(l**2))
     else
       PIB_1D_T_Element=0
     endif
     return
     end Function PIB_1D_T_Element

