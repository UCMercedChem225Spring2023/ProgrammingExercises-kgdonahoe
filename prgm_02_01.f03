      program prgm_02_01

!     Variable declarations        

      implicit none
      integer::i,NCmdLineArgs,n1,n2
      real::l,m,tMatrixElement
      real,external::PIB_1D_T_Element
      logical::fail
      character(len=1024)::cmd_buffer

!
!     Format statements
!
 2000 format (1X,'Kinetic energy matrix element',I5,',',I5,' is ',F12.5,'.')
 9000 format (1X,'Expected 4 command line arguments, but found ',i2,'.')

!     read var from command lines
!     write(*,*)'Enter an integer for n1.'
!     read(*,*) n1
!     write(*,*)'Enter an integer for n2.'
!     read(*,*) n2
!     write(*,*)'Enter a real number for l.'
!     read(*,*) l
!     write(*,*)'Enter a real number for m.'
!     read(*,*) m

      fail = .false.
      NCmdLineArgs = command_argument_count()      
      if(NCmdLineArgs.ne.4) then
        write(*,9000) NCmdLineArgs
        fail = .true.
      endIf
      if(fail) goto 999
      call Get_Command_Argument(1,cmd_buffer)
      read(cmd_buffer,*) m
      call Get_Command_Argument(2,cmd_buffer)
      read(cmd_buffer,*) l
      call Get_Command_Argument(3,cmd_buffer)
      read(cmd_buffer,*) n1
      call Get_Command_Argument(4,cmd_buffer)
      read(cmd_buffer,*) n2

!     evaluate matrix element 
      tMatrixElement = PIB_1D_T_Element(n1,n2,l,m)

      write(*,2000)n1,n2,tMatrixElement
<<<<<<< HEAD
 999 continue  
=======
 999  continue  
>>>>>>> refs/remotes/origin/main

      end program prgm_02_01

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

