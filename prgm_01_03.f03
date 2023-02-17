      Program prgm_01_03
!
!     This program reads 2 3x3 matrices from a user-provided input file. 
!     After the files are opened and read, they are closed and then printed.
!
!
      implicit none
      integer,parameter::inFileUnitA=10,inFileUnitB=10
      integer::errorFlag,i,j,k,temp
      real,dimension(3,3)::matrixInA,matrixInB,matrixProdC
      character(len=128)::fileNameA,fileNameB
!
!
!     Start by asking the user for the name of the data file.
!
      write(*,*)' What is the name of the first input data file?'
      read(*,*) fileNameA
      write(*,*)' What is the name of the second input data file?'
      read(*,*) fileNameB

!
!     Open the data file and read matrixInA from that file.
!
      open(unit=inFileUnitA,file=TRIM(fileNameA),status='old',  &
        iostat=errorFlag)
      if(errorFlag.ne.0) then
        write(*,*)' There was a problem opening the input file.'
        goto 999
      endIf
      do i = 1,3
        read(inFileUnitA,*) matrixInA(1,i),matrixInA(2,i),matrixInA(3,i)
      endDo
      close(inFileUnitA)

      open(unit=inFileUnitB,file=TRIM(fileNameB),status='old',  &
        iostat=errorFlag)
      if(errorFlag.ne.0) then
        write(*,*)' There was a problem opening the input file.'
        goto 999
      endIf
      do i = 1,3
        read(inFileUnitB,*) matrixInB(1,i),matrixInB(2,i),matrixInB(3,i)
      endDo
      close(inFileUnitB)
!     Matrix multiplication C_ik_ = A_ij_*B_jk_
      do i = 1,3
        do k = 1,3
          matrixProdC(i,k) = (matrixInA(1,i)*matrixInB(k,1)) + (matrixInA(2,i)*matrixinB(k,2)) + (matrixInA(3,i)*matrixinB(k,3))
        endDo
      endDo  
         
 
!
!     Call the subroutine PrintMatrix to print matrixInA.
!
      write(*,*)'Matrix A'
      call PrintMatrix3x3(matrixInA)
      write(*,*)'Matrix B'
      call PrintMatrix3x3(matrixInB)
      write(*,*)'Matrix C = AxB'
      call PrintMatrix3x3(matrixProdC)
!
  999 continue
      End Program prgm_01_03


      Subroutine PrintMatrix3x3(matrix)
!
!     This subroutine prints a 3x3 real matrix. The output is written to StdOut.
!
      implicit none
      real,dimension(3,3),intent(in)::matrix
      integer::i
!
!     Format statements.
!
 1000 format(3(2x,f5.1))
!
!     Do the printing job.
!
      write(*,*)' Printing Matrix',matrix
!
!      write(*,1000)matrixInA
!
!
      return
      End Subroutine PrintMatrix3x3
