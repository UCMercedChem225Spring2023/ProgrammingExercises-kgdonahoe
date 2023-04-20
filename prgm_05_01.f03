      program prgm_05_01
!     Variable declarations             
      implicit none
      integer::n1,n2,N,k,IError
      real::hMatrixElement,m,l
      real,external::PIB_1D_Modified_Hamiltonian_Element,PIB_1D_Modified_V_Element,PIB_1D_T_Element
      Real,Dimension(:),Allocatable::packArray,EVals,Temp_Vector
      Real,Dimension(:,:),Allocatable::EVecs
      logical::fail
      character(Len=64)::Character_Temp
      
      Call Get_Command_Argument(1,Character_Temp)
      Read(Character_Temp,*) N
      Allocate(packArray(N*(N+1)/2),EVals(N),EVecs(N,N),Temp_Vector(3*N))
      m = 1
      l = 1
      k = 1
! calculate matrix elements, put into a lower column packed array
      do n2 = 1,N
        do n1 = n2,N
         packArray(k) = PIB_1D_Modified_Hamiltonian_Element(m,l,n1,n2)
         k = k + 1
        end Do
      end Do

! Variational
! phi(n) = sin(n*pi*x/L)
! psi = sum of c_n*phi(n) for N values of n
! solve energy  as sum of phis
! take derivative of E wrt. c1, c2 to find minimum E for c1 and c2
! use lapack and get eigenvalues c_n)


      Call SSPEV('V','L',N,packArray,EVals,EVecs,N,  &
        Temp_Vector,IError)
      If(IError.ne.0) then
        Write(*,*)' Failure in DSPEV.'
        STOP
      endIf
      Write(*,*)' EVals:'
      Call Print_Matrix_Full_Real(RESHAPE(EVals,(/1,N/)),1,N)
      Write(*,*)' EVecs:'
      Call Print_Matrix_Full_Real(EVecs,N,N)

      999  continue
      end program prgm_05_01

      Real Function PIB_1D_Modified_Hamiltonian_Element(m,l,n1,n2)
      implicit none
      real::vMatrixElement,tMatrixElement
      real::m,l
      integer::n1,n2
      real,external::PIB_1D_Modified_V_Element,PIB_1D_T_Element
      vMatrixElement = PIB_1D_Modified_V_Element(n1,n2,l,m)
      tMatrixElement = PIB_1D_T_Element(n1,n2,l,m)
      PIB_1D_Modified_Hamiltonian_Element=(vMatrixElement+tMatrixElement)
      return
      end Function PIB_1D_Modified_Hamiltonian_Element
!    daughter functions      

     Real Function PIB_1D_Modified_V_Element(n1,n2,l,m)
     implicit none
     real,parameter::pi=4*atan(1.0d0)
     integer::n1,n2
     real::l,m  
     if(n1==n2) then
       PIB_1D_Modified_V_Element= 10*l/2
     else if(modulo(n1+n2,2)==0) then
       PIB_1D_Modified_V_Element= 0
     else
       PIB_1D_Modified_V_Element=(-8*10*l*n1*n2)/((pi**2)*(((n1**2)-(n2**2))**2))
     endif
     return
     end Function PIB_1D_Modified_V_Element


     Real Function PIB_1D_T_Element(n1,n2,l,m)
     implicit none
     real,parameter::pi=4*atan(1.0d0)
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

      Subroutine Print_Matrix_Full_Real(AMat,M,N)
!
!     This subroutine prints a real matrix that is fully dimension - i.e.,
!     not stored in packed form. AMat is the matrix, which is dimensioned
!     (M,N).
!
!     The output of this routine is sent to unit number 6 (set by the local
!     parameter integer IOut).
!
!
!     Variable Declarations
!
      implicit none
      integer,intent(in)::M,N
      real,dimension(M,N),intent(in)::AMat
!
!     Local variables
      integer,parameter::IOut=6,NColumns=5
      integer::i,j,IFirst,ILast
!
 1000 Format(1x,A)
 2000 Format(5x,5(7x,I7))
 2010 Format(1x,I7,5F14.6)
!
      Do IFirst = 1,N,NColumns
        ILast = Min(IFirst+NColumns-1,N)
        write(IOut,2000) (i,i=IFirst,ILast)
        Do i = 1,M
          write(IOut,2010) i,(AMat(i,j),j=IFirst,ILast)
        endDo
      endDo
!
      Return
      End Subroutine Print_Matrix_Full_Real

