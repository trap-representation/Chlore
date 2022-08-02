/ example 4-a: Loading addressable objects at runtime
  This program loads an addressable object at runtime
  NOTE This example won't work with implementations/targets that cannot load addressable objects at runtime
/

import "./lib/import/porttypes.clh"
:obj_name dat str "./example4-b.sso"

:main

%pushuc 0 ;registers the object at the 0th index of the object handler table
%pushp obj_name
%pushuc 8 ;this is the alignment
aloadaoc ;this will put the object in the executable code section aligned to an 8 byte boundary

%pushuc 0 %pushuc 0 ldaohd staosymhd ;store the base address of `example-4b.sso' at the 0th index of the symbol handler table; it is basically the same as saying "Use the default entry point for the object"

%pushuc 0
ldaohd ;push the base address of the object registered at the 0th index of the object handler table
%pushuc 0
invokeaosym ;invoke the symbol registered at the 0th index


hlt