      program prgm_02_03
!     Variable declarations             
      implicit none
      integer::i,NCmdLineArgs,n1,n2
      real::b,l,m,hMatrixElement,vMatrixElement,tMatrixElement
      real,external::PIB_1D_Modified_Hamiltonian_Element,PIB_1D_Modified_V_Element,PIB_1D_T_Element
      logical::fail
      character(len=1024)::cmd_buffer


 2000 format(1X,'Hamiltonian energy matrix element',I5,',',I5,' is ',F12.5,'.')
 9000 format (1X,'Expected 5 command line arguments, but found ',i2,'.')


!     write(*,*)'Enter an integer for n1.'
!     read(*,*) n1
!     write(*,*)'Enter an integer for n2.'
!     read(*,*) n2
!     write(*,*)'Enter a real number for l.'
!     read(*,*) l
!     write(*,*)'Enter a real number for m.'
!     read(*,*) m
!     write(*,*)'Enter a real number for b.'
!     read(*,*) b

      fail = .false.
      NCmdLineArgs = command_argument_count()      
      if(NCmdLineArgs.ne.5) then
        write(*,9000) NCmdLineArgs
        fail = .true.
      endIf
      if(fail) goto 999
      call Get_Command_Argument(1,cmd_buffer)
      read(cmd_buffer,*) b
      call Get_Command_Argument(2,cmd_buffer)
      read(cmd_buffer,*) m
      call Get_Command_Argument(3,cmd_buffer)
      read(cmd_buffer,*) l
      call Get_Command_Argument(4,cmd_buffer)
      read(cmd_buffer,*) n1
      call Get_Command_Argument(5,cmd_buffer)
      read(cmd_buffer,*) n2

      hMatrixElement = PIB_1D_Modified_Hamiltonian_Element(b,m,l,n1,n2)

!     these are just to check that everything's working right 
 3000 format(1X,'Kinetic energy matrix element',I5,',',I5,' is ',F12.5,'.')
 4000 format(1X,'Potential energy matrix element',I5,',',I5,' is ',F12.5,'.')

      tMatrixElement = PIB_1D_T_Element(n1,n2,l,m)
      vMatrixElement = PIB_1D_Modified_V_Element(n1,n2,l,b)

      write(*,2000)n1,n2,hMatrixElement
      write(*,3000)n1,n2,tMatrixElement

!     end testing block      
      write(*,4000)n1,n2,vMatrixElement
 999  continue
      end program prgm_02_03

      Real Function PIB_1D_Modified_Hamiltonian_Element(b,m,l,n1,n2)
      implicit none
      real::vMatrixElement,tMatrixElement
      real::b,m,l
      integer::n1,n2
      real,external::PIB_1D_Modified_V_Element,PIB_1D_T_Element
      vMatrixElement = PIB_1D_Modified_V_Element(n1,n2,l,b)
      tMatrixElement = PIB_1D_T_Element(n1,n2,l,m)
      PIB_1D_Modified_Hamiltonian_Element=(vMatrixElement+tMatrixElement)
      return
      end Function PIB_1D_Modified_Hamiltonian_Element
!    daughter functions      

     Real Function PIB_1D_Modified_V_Element(n1,n2,l,b)
     implicit none
     real,parameter::pi=3.1415926
     integer::n1,n2
     real::l,b  
     if(n1==n2) then
       PIB_1D_Modified_V_Element= b*l/2
     else if(modulo(n1+n2,2)==0) then
       PIB_1D_Modified_V_Element= 0
     else
       PIB_1D_Modified_V_Element=(-8*b*l*n1*n2)/((pi**2)*(((n1**2)-(n2**2))**2))
     endif
     return
     end Function PIB_1D_Modified_V_Element


     Real Function PIB_1D_T_Element(n1,n2,l,m)
     implicit none
     real,parameter::pi=3.1415926
     integer,intent(in)::n1,n2
     real,intent(in)::m,l
     real::prefactor

     prefactor=((pi**2)/(2*m*(l**2)))
  
     if(n1==n2) then
       PIB_1D_T_Element= (n1**2)*prefactor
     else
       PIB_1D_T_Element=0
     endif
     return
     end Function PIB_1D_T_Element


