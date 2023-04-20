Program Vector_Vector
!
! Variable Declarations
!
Implicit None
Integer::NDim
Real::Time_Start,Time_End,DotProduct
Real,Dimension(:),Allocatable::Vector1,Vector2
Character(Len=64)::Character_Temp
!
! Format Statements.
!
1000 Format(1x,'Dimension=',I6,' Time: ',F10.8,' s.')
!
! Get the dimensionality of the problem from the command line.
!
Call Get_Command_Argument(1,Character_Temp)
Read(Character_Temp,*) NDim
!
! Allocate memory for Matrix1 and Matrix2. Then fill the matrices with
! random values.
! random_number is an existing subroutine in Fortran

Allocate(Vector1(NDim),Vector2(NDim))
Call random_number(Vector1)
Call random_number(Vector2)
!Write(*,*) Vector1
!
! Compute matrix products using the intrinsic MatMul function.
! n.b. Fortran stores column-wise--order of that indices are multiplied can make a difference to total computational time (kji
! faster than ijk)

Call cpu_time(Time_Start)
DotProduct = Dot_Product(Vector1,Vector2)
!Write(*,*) DotProduct
Call cpu_time(Time_End)
Write(*,1000) NDim,Time_End-Time_Start

!
End Program Vector_Vector
