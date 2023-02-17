    program prgm_02_01
    implicit none
    integer::n1,n2
    real::l,m,T
    logical::d12
    real,parameter::pi=3.1415926


    write(*,*)'Enter an integer for n1.'
    read(*,*) n1
    write(*,*)'Enter an integer for n2.'
    read(*,*) n2
    write(*,*)'Enter a real number for l.'
    read(*,*) l
    write(*,*)'Enter a real number for m.'
    read(*,*) m

    if(n1==n2) then
      T = (n1**2)*(pi**2)/(2*m*(l**2))
    else
      T=0
    endif

    write(*,*)T

    end program prgm_02_01
