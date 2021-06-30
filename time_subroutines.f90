module time_subroutines
  use iso_fortran_env, only : int64

#ifdef TESTING
  interface time
    integer(int64) function mock_time()
      use iso_fortran_env, only : int64
      implicit none
    end function 
  end interface
#endif

contains

logical function even_time(seconds)
  implicit none
  integer(int64), intent(in) :: seconds
  integer(int64)             :: seconds_since_epoch

  seconds_since_epoch = time()
  if (mod(seconds_since_epoch + seconds, 2) == 0) then
    even_time = .true.
  else
    even_time = .false.
  end if

end function

end module
