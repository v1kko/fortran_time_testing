
function mock_time()
  use iso_fortran_env, only: int64
  implicit none
  integer(int64) mock_time
  mock_time = 0_int64
end function


#include "assertions.f90"


program testing
  use time_subroutines, only : even_time, int64
  use assertions
  implicit none
  logical even

  call ASSERT(even_time(5_int64) .eqv. .false.)
  call ASSERT(even_time(4_int64) .eqv. .true.)
  call ASSERT(even_time(3_int64) .eqv. .true.)
end program
