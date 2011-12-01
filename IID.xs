#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Thread::IID		PACKAGE = Thread::IID		

UV
get_interpreter_id()
   CODE:
      RETVAL = (UV)PERL_GET_THX;

   OUTPUT:
      RETVAL
