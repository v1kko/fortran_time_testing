module assertions
  character(len=*), parameter :: ESC = achar(27)
contains
  subroutine ASSERT_(x, message, file, line)
    implicit none
    logical, intent(in)               :: x
    character ( len = * ), intent(in) :: message
    character ( len = * ), intent(in) :: file
    integer, intent(in)               :: line
    write(*,*) "Test in file: ", file, " on line number: ", line
    if (x) then
      write(*,*) ESC // "[32mAssertion success" // ESC // "[0m: ", message
    else 
      write(*,*) ESC // "[31mAssertion error" // ESC // "[0m:   ", message
    end if
    write(*,*) "--------------------------------------------------------------"
  end subroutine
end module
#define ASSERT( x ) \
  ASSERT_(x, "x", __FILE__, __LINE__)
